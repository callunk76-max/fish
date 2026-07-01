import 'package:fishing_hobby_app/domain/entities/fishing_spot.dart';
import 'package:fishing_hobby_app/domain/entities/weather.dart';

abstract class FishingRepository {
  Future<List<FishingSpot>> getAllSpots();
  Future<WeatherData> getWeather(double lat, double lon);
  Future<MarineData> getMarine(double lat, double lon);
}
