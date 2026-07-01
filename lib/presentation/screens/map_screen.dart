import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:fishing_hobby_app/domain/repositories/fishing_repository.dart';
import 'package:fishing_hobby_app/domain/entities/fishing_spot.dart';
import 'package:fishing_hobby_app/core/constants/app_constants.dart';
import 'package:fishing_hobby_app/core/theme/app_theme.dart';

class MapScreen extends StatefulWidget {
  final FishingRepository repository;

  const MapScreen({Key? key, required this.repository}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  List<FishingSpot> _spots = [];
  bool _loading = true;
  String? _error;
  bool _showCoral = true;
  bool _showFish = true;
  bool _showDepth = true;

  @override
  void initState() {
    super.initState();
    _loadSpots();
  }

  Future<void> _loadSpots() async {
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      final spots = await widget.repository.getAllSpots();
      setState(() {
        _spots = spots;
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

  List<Marker> _buildMarkers() {
    final markers = <Marker>[];
    for (final spot in _spots) {
      markers.add(
        Marker(
          point: LatLng(spot.latitude, spot.longitude),
          width: 40,
          height: 40,
          child: const Icon(Icons.location_on, color: Colors.red, size: 40),
        ),
      );
      if (_showCoral) {
        for (final cz in spot.coralZones) {
          markers.add(
            Marker(
              point: LatLng(cz.lat, cz.lng),
              width: 30,
              height: 30,
              child: const Icon(Icons.waves, color: AppTheme.coralColor, size: 30),
            ),
          );
        }
      }
      if (_showFish) {
        for (final fs in spot.fishSpots) {
          markers.add(
            Marker(
              point: LatLng(fs.lat, fs.lng),
              width: 30,
              height: 30,
              child: const Icon(Icons.set_meal, color: AppTheme.fishZoneColor, size: 30),
            ),
          );
        }
      }
    }
    return markers;
  }

  Widget _buildLegend() {
    return Positioned(
      top: 16,
      right: 16,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(children: const [Icon(Icons.location_on, color: Colors.red), SizedBox(width: 4), Text('Spot')]),
              Row(children: const [Icon(Icons.waves, color: AppTheme.coralColor), SizedBox(width: 4), Text('Karang')]),
              Row(children: const [Icon(Icons.set_meal, color: AppTheme.fishZoneColor), SizedBox(width: 4), Text('Ikan')]),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFilters() {
    return Positioned(
      bottom: 16,
      left: 16,
      right: 16,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FilterChip(
                label: const Text('Karang'),
                selected: _showCoral,
                onSelected: (v) => setState(() => _showCoral = v),
              ),
              FilterChip(
                label: const Text('Ikan'),
                selected: _showFish,
                onSelected: (v) => setState(() => _showFish = v),
              ),
              FilterChip(
                label: const Text('Kedalaman'),
                selected: _showDepth,
                onSelected: (v) => setState(() => _showDepth = v),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (_error != null) {
      return Center(child: Text('Gagal memuat spot: $_error'));
    }
    return Stack(
      children: [
        FlutterMap(
          options: MapOptions(
            initialCenter: const LatLng(AppConstants.bulukumbaLat, AppConstants.bulukumbaLon),
            initialZoom: AppConstants.defaultZoom,
            minZoom: AppConstants.minZoom,
            maxZoom: AppConstants.maxZoom,
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'com.callunk.fishing_hobby_app',
            ),
            CircleLayer(
              circles: [
                for (final spot in _spots)
                  CircleMarker(
                    point: LatLng(spot.latitude, spot.longitude),
                    color: AppTheme.primaryColor.withValues(alpha: 0.2),
                    borderColor: AppTheme.primaryColor,
                    borderStrokeWidth: 1,
                    useRadiusInMeter: true,
                    radius: 500, // 500m radius around each spot
                  ),
              ],
            ),
            MarkerLayer(markers: _buildMarkers()),
          ],
        ),
        _buildLegend(),
        _buildFilters(),
      ],
    );
  }
}
