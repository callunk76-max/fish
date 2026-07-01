import 'package:flutter/material.dart';
import 'package:fishing_hobby_app/domain/repositories/fishing_repository.dart';
import 'package:fishing_hobby_app/domain/entities/weather.dart';
import 'package:fishing_hobby_app/core/constants/app_constants.dart';
import 'package:intl/intl.dart';

class WeatherScreen extends StatefulWidget {
  final FishingRepository repository;

  const WeatherScreen({Key? key, required this.repository}) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  WeatherData? _weather;
  bool _loading = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadWeather();
  }

  Future<void> _loadWeather() async {
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      final data = await widget.repository.getWeather(AppConstants.bulukumbaLat, AppConstants.bulukumbaLon);
      setState(() {
        _weather = data;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
      });
    } finally {
      setState(() {
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (_error != null) {
      return Center(child: Text('Gagal memuat cuaca: $_error'));
    }
    if (_weather == null) {
      return const Center(child: Text('Tidak ada data cuaca'));
    }
    final current = _weather!.current;
    final now = DateTime.now();
    final formattedTime = DateFormat('HH:mm').format(now);
    return RefreshIndicator(
      onRefresh: _loadWeather,
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text('Cuaca Sekarang ($formattedTime)', style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 12),
          Row(
            children: [
              Text(
                '${getWeatherIcon(current.weatherCode)} ${getWeatherDescription(current.weatherCode)}',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const Spacer(),
              Text('\${current.temperature.toStringAsFixed(1)}°C', style: Theme.of(context).textTheme.headlineLarge),
            ],
          ),
          const Divider(height: 32),
          Text('Prakiraan 7 Hari', style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 8),
          Column(
            children: _weather!.daily.map((d) {
              final dateFmt = DateFormat('EEE, d MMM').format(d.date);
              return ListTile(
                leading: Text(getWeatherIcon(d.weatherCode), style: const TextStyle(fontSize: 24)),
                title: Text(dateFmt),
                subtitle: Text('Maks \${d.temperatureMax.toStringAsFixed(1)}°C • Min \${d.temperatureMin.toStringAsFixed(1)}°C'),
                trailing: Text('🌅 ${d.sunrise}\n🌇 ${d.sunset}', textAlign: TextAlign.right),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
