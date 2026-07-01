import 'dart:convert';
import 'package:fishing_hobby_app/domain/entities/fishing_spot.dart';
import 'package:flutter/services.dart' show rootBundle;

class LocalDataSource {
  Future<List<FishingSpot>> loadSpots() async {
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
}
