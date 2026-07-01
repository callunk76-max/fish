// =============================================
// 🌊 FishApp - TypeScript Models
// =============================================

export interface CoralZone {
  id: string;
  lat: number;
  lng: number;
  type: 'coral_reef' | 'rocky' | 'sandy' | 'seagrass';
  depth: number;
  riskLevel: 'low' | 'medium' | 'high';
}

export interface FishSpotData {
  lat: number;
  lng: number;
  fishTypes: string[];
  bestTime: string;
}

export interface Spot {
  id: string;
  name: string;
  description: string;
  image?: string;
  latitude: number;
  longitude: number;
  type: 'pantai' | 'tebing_karang' | 'muara' | 'perairan_dalam' | 'pulau';
  depthRange: string;
  coralZones: CoralZone[];
  fishSpots: FishSpotData[];
  amenities: string[];
  bestSeason: string;
  difficulty: 'mudah' | 'sedang' | 'sulit';
  rating?: number;
  reviewCount?: number;
  createdAt?: string;
}

export interface CurrentWeather {
  temperature: number;
  feelsLike: number;
  humidity: number;
  weatherCode: number;
  weatherDescription: string;
  weatherIcon: string;
  windSpeed: number;
  windDirection: number;
  windGusts?: number;
  pressure: number;
  visibility?: number;
  uvIndex?: number;
}

export interface HourlyWeather {
  time: string;
  temperature: number;
  weatherCode: number;
  windSpeed: number;
  precipitationProbability: number;
}

export interface DailyWeather {
  date: string;
  weatherCode: number;
  temperatureMax: number;
  temperatureMin: number;
  precipitationProbabilityMax: number;
  sunrise: string;
  sunset: string;
}

export interface MarineData {
  waveHeight: number;
  waveDirection: number;
  wavePeriod: number;
  waterTemperature: number;
}

export interface WeatherData {
  current: CurrentWeather;
  hourly: HourlyWeather[];
  daily: DailyWeather[];
  marine?: MarineData;
  location: {
    name: string;
    country: string;
    lat: number;
    lon: number;
  };
  timezone: string;
}

export interface CatchLog {
  id: string;
  fishType: string;
  weight?: number; // in kg
  length?: number; // in cm
  spotId?: string;
  spotName?: string;
  latitude?: number;
  longitude?: number;
  photo?: string;
  notes?: string;
  weather?: string;
  bait?: string;
  catchTime: string;
  createdAt: string;
}

export interface UserSettings {
  // Location
  useCurrentLocation: boolean;
  savedLatitude?: number;
  savedLongitude?: number;
  savedLocationName?: string;

  // Units
  temperatureUnit: 'celsius' | 'fahrenheit';
  distanceUnit: 'km' | 'miles';
  weightUnit: 'kg' | 'lb';

  // Notifications
  weatherAlert: boolean;
  newSpotNotification: boolean;

  // Map
  mapStyle: 'standard' | 'satellite' | 'terrain';

  // Profile
  displayName?: string;
  avatar?: string;
}

export interface AppState {
  spots: Spot[];
  weather: WeatherData | null;
  catchLogs: CatchLog[];
  settings: UserSettings;
  isLoading: boolean;
  error: string | null;
}