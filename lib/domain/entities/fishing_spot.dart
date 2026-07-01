import 'package:equatable/equatable.dart';

class FishingSpot extends Equatable {
  final String id;
  final String name;
  final String description;
  final double latitude;
  final double longitude;
  final String type;
  final String depthRange;
  final List<CoralZone> coralZones;
  final List<FishSpot> fishSpots;
  final List<String> amenities;
  final String bestSeason;
  final String difficulty;

  const FishingSpot({
    required this.id,
    required this.name,
    required this.description,
    required this.latitude,
    required this.longitude,
    required this.type,
    required this.depthRange,
    required this.coralZones,
    required this.fishSpots,
    required this.amenities,
    required this.bestSeason,
    required this.difficulty,
  });

  @override
  List<Object?> get props => [id, name, latitude, longitude];
}

class CoralZone extends Equatable {
  final double lat;
  final double lng;
  final String type;
  final double depth;

  const CoralZone({
    required this.lat,
    required this.lng,
    required this.type,
    required this.depth,
  });

  @override
  List<Object?> get props => [lat, lng, type, depth];
}

class FishSpot extends Equatable {
  final double lat;
  final double lng;
  final List<String> fishTypes;
  final String bestTime;

  const FishSpot({
    required this.lat,
    required this.lng,
    required this.fishTypes,
    required this.bestTime,
  });

  @override
  List<Object?> get props => [lat, lng, fishTypes];
}