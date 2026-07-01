import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:fishing_hobby_app/domain/entities/fishing_spot.dart';
import 'package:fishing_hobby_app/domain/entities/weather.dart';
import 'package:fishing_hobby_app/core/constants/app_constants.dart';
import 'package:http/http.dart' as http;

class RemoteDataSource {
  final http.Client client;

  RemoteDataSource({required this.client});

  Future<List<FishingSpot>> fetchSpots() async {
    final jsonString = await rootBundle.loadString('assets/data/spots_bulukumba.json');
    final List<dynamic> data = json.decode(jsonString);
    return data.map((e) => _mapSpot(e)).toList();
  }

  FishingSpot _mapSpot(Map<String, dynamic> json) {
    return FishingSpot(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      type: json['type'] as String,
      depthRange: json['depth_range'] as String,
      coralZones: (json['coral_zones'] as List)
          .map((c) => CoralZone(
                lat: (c['lat'] as num).toDouble(),
                lng: (c['lng'] as num).toDouble(),
                type: c['type'] as String,
                depth: (c['depth'] as num).toDouble(),
              ))
          .toList(),
      fishSpots: (json['fish_spots'] as List)
          .map((f) => FishSpot(
                lat: (f['lat'] as num).toDouble(),
                lng: (f['lng'] as num).toDouble(),
                fishTypes: List<String>.from(f['fish_types']),
                bestTime: f['best_time'] as String,
              ))
          .toList(),
      amenities: List<String>.from(json['amenities']),
      bestSeason: json['best_season'] as String,
      difficulty: json['difficulty'] as String,
    );
  }

  Future<WeatherData> fetchWeather({required double lat, required double lon}) async {
    final url = Uri.parse(ApiConstants.weatherUrl(lat: lat, lon: lon));
    final response = await client.get(url);
    if (response.statusCode != 200) {
      throw Exception('Failed to load weather data');
    }
    final Map<String, dynamic> json = jsonDecode(response.body);
    final current = json['current'];
    final currentWeather = CurrentWeather(
      temperature: (current['temperature_2m'] as num).toDouble(),
      apparentTemperature: (current['apparent_temperature'] as num).toDouble(),
      humidity: (current['relative_humidity_2m'] as num).toInt(),
      weatherCode: (current['weather_code'] as num).toInt(),
      windSpeed: (current['wind_speed_10m'] as num).toDouble(),
      windDirection: (current['wind_direction_10m'] as num).toInt(),
      windGusts: (current['wind_gusts_10m'] as num).toDouble(),
    );

    final hourlyList = (json['hourly'] as Map<String, dynamic>)['time'] as List;
    final hourlyTemps = (json['hourly'] as Map<String, dynamic>)['temperature_2m'] as List;
    final hourlyCodes = (json['hourly'] as Map<String, dynamic>)['weather_code'] as List;
    final hourlyWind = (json['hourly'] as Map<String, dynamic>)['wind_speed_10m'] as List;
    final hourlyWindDir = (json['hourly'] as Map<String, dynamic>)['wind_direction_10m'] as List;
    final hourlyPrecip = (json['hourly'] as Map<String, dynamic>)['precipitation_probability'] as List;

    final hourly = List<HourlyWeather>.generate(hourlyList.length, (i) {
      return HourlyWeather(
        time: DateTime.parse(hourlyList[i]),
        temperature: (hourlyTemps[i] as num).toDouble(),
        weatherCode: (hourlyCodes[i] as num).toInt(),
        windSpeed: (hourlyWind[i] as num).toDouble(),
        windDirection: (hourlyWindDir[i] as num).toInt(),
        precipitationProbability: (hourlyPrecip[i] as num).toInt(),
      );
    });

    final dailyList = (json['daily'] as Map<String, dynamic>)['time'] as List;
    final dailyCodes = (json['daily'] as Map<String, dynamic>)['weather_code'] as List;
    final dailyTempMax = (json['daily'] as Map<String, dynamic>)['temperature_2m_max'] as List;
    final dailyTempMin = (json['daily'] as Map<String, dynamic>)['temperature_2m_min'] as List;
    final dailyPrecip = (json['daily'] as Map<String, dynamic>)['precipitation_probability_max'] as List;
    final dailySunrise = (json['daily'] as Map<String, dynamic>)['sunrise'] as List;
    final dailySunset = (json['daily'] as Map<String, dynamic>)['sunset'] as List;

    final daily = List<DailyWeather>.generate(dailyList.length, (i) {
      return DailyWeather(
        date: DateTime.parse(dailyList[i]),
        weatherCode: (dailyCodes[i] as num).toInt(),
        temperatureMax: (dailyTempMax[i] as num).toDouble(),
        temperatureMin: (dailyTempMin[i] as num).toDouble(),
        precipitationProbabilityMax: (dailyPrecip[i] as num).toInt(),
        sunrise: dailySunrise[i] as String,
        sunset: dailySunset[i] as String,
      );
    });

    return WeatherData(current: currentWeather, hourly: hourly, daily: daily);
  }

  Future<MarineData> fetchMarine({required double lat, required double lon}) async {
    final url = Uri.parse(ApiConstants.marineUrl(lat: lat, lon: lon));
    final response = await client.get(url);
    if (response.statusCode != 200) {
      throw Exception('Failed to load marine data');
    }
    final Map<String, dynamic> json = jsonDecode(response.body);
    final hourlyList = (json['hourly'] as Map<String, dynamic>)['time'] as List;
    final waveHeights = (json['hourly'] as Map<String, dynamic>)['wave_height'] as List;
    final waveDirs = (json['hourly'] as Map<String, dynamic>)['wave_direction'] as List;
    final wavePeriods = (json['hourly'] as Map<String, dynamic>)['wave_period'] as List;

    final hourly = List<HourlyMarine>.generate(hourlyList.length, (i) {
      return HourlyMarine(
        time: DateTime.parse(hourlyList[i]),
        waveHeight: (waveHeights[i] as num).toDouble(),
        waveDirection: (waveDirs[i] as num).toDouble(),
        wavePeriod: (wavePeriods[i] as num).toDouble(),
      );
    });

    final dailyList = (json['daily'] as Map<String, dynamic>)['time'] as List;
    final waveHeightMax = (json['daily'] as Map<String, dynamic>)['wave_height_max'] as List;
    final waveDirDom = (json['daily'] as Map<String, dynamic>)['wave_direction_dominant'] as List;

    final daily = List<DailyMarine>.generate(dailyList.length, (i) {
      return DailyMarine(
        date: DateTime.parse(dailyList[i]),
        waveHeightMax: (waveHeightMax[i] as num).toDouble(),
        waveDirectionDominant: (waveDirDom[i] as num).toDouble(),
      );
    });

    return MarineData(hourly: hourly, daily: daily);
  }
}
