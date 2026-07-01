import 'package:fishing_hobby_app/data/datasources/remote/remote_data_source.dart';
import 'package:fishing_hobby_app/domain/entities/fishing_spot.dart';
import 'package:fishing_hobby_app/domain/entities/weather.dart';
import 'package:fishing_hobby_app/domain/repositories/fishing_repository.dart';

class FishingRepositoryImpl extends FishingRepository {
  final RemoteDataSource remote;

  FishingRepositoryImpl({required this.remote});

  @override
  Future<List<FishingSpot>> getAllSpots() async {
    try {
      return await remote.fetchSpots();
    } catch (e) {
      // Fallback could be local cache later
      rethrow;
    }
  }

  @override
  Future<WeatherData> getWeather(double lat, double lon) async {
    return await remote.fetchWeather(lat: lat, lon: lon);
  }

  @override
  Future<MarineData> getMarine(double lat, double lon) async {
    return await remote.fetchMarine(lat: lat, lon: lon);
  }
}
