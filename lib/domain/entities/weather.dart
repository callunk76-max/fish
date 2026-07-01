import 'package:equatable/equatable.dart';

class WeatherData extends Equatable {
  final CurrentWeather current;
  final List<HourlyWeather> hourly;
  final List<DailyWeather> daily;

  const WeatherData({
    required this.current,
    required this.hourly,
    required this.daily,
  });

  @override
  List<Object?> get props => [current, hourly, daily];
}

class CurrentWeather extends Equatable {
  final double temperature;
  final double apparentTemperature;
  final int humidity;
  final int weatherCode;
  final double windSpeed;
  final int windDirection;
  final double windGusts;

  const CurrentWeather({
    required this.temperature,
    required this.apparentTemperature,
    required this.humidity,
    required this.weatherCode,
    required this.windSpeed,
    required this.windDirection,
    required this.windGusts,
  });

  @override
  List<Object?> get props => [
        temperature,
        apparentTemperature,
        humidity,
        weatherCode,
        windSpeed,
        windDirection,
        windGusts,
      ];
}

class HourlyWeather extends Equatable {
  final DateTime time;
  final double temperature;
  final int weatherCode;
  final double windSpeed;
  final int windDirection;
  final int precipitationProbability;

  const HourlyWeather({
    required this.time,
    required this.temperature,
    required this.weatherCode,
    required this.windSpeed,
    required this.windDirection,
    required this.precipitationProbability,
  });

  @override
  List<Object?> get props => [time, temperature, weatherCode, windSpeed];
}

class DailyWeather extends Equatable {
  final DateTime date;
  final int weatherCode;
  final double temperatureMax;
  final double temperatureMin;
  final int precipitationProbabilityMax;
  final String sunrise;
  final String sunset;

  const DailyWeather({
    required this.date,
    required this.weatherCode,
    required this.temperatureMax,
    required this.temperatureMin,
    required this.precipitationProbabilityMax,
    required this.sunrise,
    required this.sunset,
  });

  @override
  List<Object?> get props => [date, weatherCode, temperatureMax, temperatureMin];
}

class MarineData extends Equatable {
  final List<HourlyMarine> hourly;
  final List<DailyMarine> daily;

  const MarineData({
    required this.hourly,
    required this.daily,
  });

  @override
  List<Object?> get props => [hourly, daily];
}

class HourlyMarine extends Equatable {
  final DateTime time;
  final double waveHeight;
  final double waveDirection;
  final double wavePeriod;

  const HourlyMarine({
    required this.time,
    required this.waveHeight,
    required this.waveDirection,
    required this.wavePeriod,
  });

  @override
  List<Object?> get props => [time, waveHeight, waveDirection, wavePeriod];
}

class DailyMarine extends Equatable {
  final DateTime date;
  final double waveHeightMax;
  final double waveDirectionDominant;

  const DailyMarine({
    required this.date,
    required this.waveHeightMax,
    required this.waveDirectionDominant,
  });

  @override
  List<Object?> get props => [date, waveHeightMax, waveDirectionDominant];
}

// Helper function to get weather description from code
String getWeatherDescription(int code) {
  switch (code) {
    case 0:
      return 'Cerah';
    case 1:
    case 2:
    case 3:
      return 'Sebagian Besar Berawan';
    case 45:
    case 48:
      return 'Berkabut';
    case 51:
    case 53:
    case 55:
      return 'Gerimis';
    case 61:
    case 63:
    case 65:
      return 'Hujan';
    case 71:
    case 73:
    case 75:
      return 'Hujan Salju';
    case 77:
      return 'Butiran Salju';
    case 80:
    case 81:
    case 82:
      return 'Hujan Lebat';
    case 85:
    case 86:
      return 'Hujan Salju Lebat';
    case 95:
      return 'Badai Petir';
    case 96:
    case 99:
      return 'Badai Petir + Es';
    default:
      return 'Tidak Diketahui';
  }
}

// Get weather icon from code
String getWeatherIcon(int code) {
  switch (code) {
    case 0:
      return '☀️';
    case 1:
    case 2:
    case 3:
      return '⛅';
    case 45:
    case 48:
      return '🌫️';
    case 51:
    case 53:
    case 55:
      return '🌦️';
    case 61:
    case 63:
    case 65:
    case 80:
    case 81:
    case 82:
      return '🌧️';
    case 95:
    case 96:
    case 99:
      return '⛈️';
    default:
      return '🌤️';
  }
}

// Get wave condition description
String getWaveCondition(double height) {
  if (height < 0.5) return 'Sangat Tenang';
  if (height < 1.0) return 'Tenang';
  if (height < 1.5) return 'Sedang';
  if (height < 2.5) return 'Bergelora';
  return 'Sangat Bergelora';
}

// Get wind direction compass
String getWindDirection(int degrees) {
  const directions = [
    'U',
    'U-UT',
    'UT',
    'T-UT',
    'T',
    'T-AT',
    'AT',
    'B-AT',
    'B',
    'B-AB',
    'AB',
    'U-AB',
  ];
  final index = ((degrees + 15) / 30).floor() % 12;
  return directions[index];
}