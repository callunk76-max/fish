class AppConstants {
  // App Info
  static const String appName = 'Fishing Hobby';
  static const String appVersion = '1.0.0';

  // API Endpoints (Open-Meteo - Free, No API Key)
  static const String openMeteoBaseUrl = 'https://api.open-meteo.com/v1';
  static const String openMeteoForecast = '/forecast';
  static const String openMeteoMarine = '/marine';

  // WorldTides API (Free tier)
  static const String worldTidesBaseUrl = 'https://www.worldtides.info/api/v3';

  // Bulukumba Coordinates
  static const double bulukumbaLat = -5.5566;
  static const double bulukumbaLon = 120.1923;

  // Default Map Settings
  static const double defaultZoom = 11.0;
  static const double minZoom = 5.0;
  static const double maxZoom = 18.0;

  // Depth zones for sonar simulation
  static const double shallowDepth = 5.0;  // meters
  static const double mediumDepth = 15.0;
  static const double deepDepth = 30.0;
}

class ApiConstants {
  // Open-Meteo endpoints
  static String weatherUrl({
    required double lat,
    required double lon,
  }) =>
      '${AppConstants.openMeteoBaseUrl}${AppConstants.openMeteoForecast}'
      '?latitude=$lat&longitude=$lon'
      '&current=temperature_2m,relative_humidity_2m,apparent_temperature,weather_code,wind_speed_10m,wind_direction_10m,wind_gusts_10m'
      '&hourly=temperature_2m,weather_code,wind_speed_10m,wind_direction_10m,precipitation_probability'
      '&daily=weather_code,temperature_2m_max,temperature_2m_min,precipitation_probability_max,sunrise,sunset'
      '&timezone=auto';

  static String marineUrl({
    required double lat,
    required double lon,
  }) =>
      '${AppConstants.openMeteoBaseUrl}${AppConstants.openMeteoMarine}'
      '?latitude=$lat&longitude=$lon'
      '&hourly=wave_height,wave_direction,wave_period'
      '&daily=wave_height_max,wave_direction_dominant'
      '&timezone=auto';
}