// =============================================
// 🌊 FishApp - Spot Service
// =============================================

import { Spot } from '../models/types';

// Static data for Bulukumba fishing spots
const SPOTS_DATA: Spot[] = [
  {
    id: 'spot_001',
    name: 'Pantai Mandallmanna',
    description: 'Pantai indah dengan spot mancing tradisional, sering ditemukan ikan Kerapu dan Baracuda. Pemandangan sunset yang memukau.',
    image: 'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?w=800',
    latitude: -5.5566,
    longitude: 120.1923,
    type: 'pantai',
    depthRange: '3-8 meter',
    coralZones: [
      { id: 'c1', lat: -5.5570, lng: 120.1925, type: 'coral_reef', depth: 3, riskLevel: 'low' },
      { id: 'c2', lat: -5.5565, lng: 120.1930, type: 'coral_reef', depth: 4, riskLevel: 'low' },
    ],
    fishSpots: [
      { lat: -5.5568, lng: 120.1927, fishTypes: ['Kerapu', 'Baracuda', 'Teri'], bestTime: '06:00-09:00' },
      { lat: -5.5562, lng: 120.1932, fishTypes: ['Kakap', 'Tongkol'], bestTime: '17:00-20:00' },
    ],
    amenities: ['Warung makan', 'Area parkir', 'Toilet', 'Penginapan'],
    bestSeason: 'April - Oktober',
    difficulty: 'mudah',
    rating: 4.5,
    reviewCount: 128,
  },
  {
    id: 'spot_002',
    name: 'Pantai Bira',
    description: 'Pantai terkenal dengan pasir putihnya, spot mancing dari atas batu karang. Cocok untuk yang suka tantangan.',
    image: 'https://images.unsplash.com/photo-1506953823976-52e1fdc0149a?w=800',
    latitude: -5.5912,
    longitude: 120.2356,
    type: 'tebing_karang',
    depthRange: '5-15 meter',
    coralZones: [
      { id: 'c3', lat: -5.5920, lng: 120.2360, type: 'coral_reef', depth: 5, riskLevel: 'medium' },
      { id: 'c4', lat: -5.5905, lng: 120.2370, type: 'rocky', depth: 7, riskLevel: 'medium' },
    ],
    fishSpots: [
      { lat: -5.5915, lng: 120.2365, fishTypes: ['Ikan Napoleon', 'Kerapu', 'Marlin'], bestTime: '05:00-08:00' },
      { lat: -5.5908, lng: 120.2375, fishTypes: ['Tuna', 'Mahi-mahi'], bestTime: '08:00-11:00' },
    ],
    amenities: ['Resort', 'Restaurant', 'Rental perahu', 'Guide lokal'],
    bestSeason: 'September - November',
    difficulty: 'sedang',
    rating: 4.8,
    reviewCount: 256,
  },
  {
    id: 'spot_003',
    name: 'Muara Sungai Lemo-Lemo',
    description: 'Muara sungai dengan air payau, spot bagus untuk mancing ikan air tawar dan payau. Ramai dikunjungi pemula.',
    image: 'https://images.unsplash.com/photo-1545450660-3378a7f3a364?w=800',
    latitude: -5.5123,
    longitude: 120.1545,
    type: 'muara',
    depthRange: '2-5 meter',
    coralZones: [
      { id: 'c5', lat: -5.5125, lng: 120.1548, type: 'seagrass', depth: 2, riskLevel: 'low' },
    ],
    fishSpots: [
      { lat: -5.5120, lng: 120.1542, fishTypes: ['Ikan Gabus', 'Ikan Mas', 'Udang'], bestTime: '06:00-10:00' },
      { lat: -5.5128, lng: 120.1550, fishTypes: ['Ikan Kerbau', 'Ikan Belanak'], bestTime: '15:00-18:00' },
    ],
    amenities: ['Warung', 'Jembatan pancing', 'Area keluarga'],
    bestSeason: 'Sepanjang tahun',
    difficulty: 'mudah',
    rating: 4.2,
    reviewCount: 89,
  },
  {
    id: 'spot_004',
    name: 'Pulau Selayar',
    description: 'Pulau kecil dengan perairan jernih, spot diving dan mancing. Terkenal dengan ikan-ikan colorful.',
    image: 'https://images.unsplash.com/photo-1559827291-72ee739d0d9a?w=800',
    latitude: -6.1167,
    longitude: 120.4667,
    type: 'pulau',
    depthRange: '10-30 meter',
    coralZones: [
      { id: 'c6', lat: -6.1170, lng: 120.4670, type: 'coral_reef', depth: 12, riskLevel: 'high' },
      { id: 'c7', lat: -6.1165, lng: 120.4675, type: 'coral_reef', depth: 15, riskLevel: 'high' },
    ],
    fishSpots: [
      { lat: -6.1175, lng: 120.4660, fishTypes: ['Ikan Napoleon', 'Baracuda', 'Kerapu'], bestTime: '07:00-10:00' },
      { lat: -6.1160, lng: 120.4680, fishTypes: ['Hiu kecil', 'Penyu', 'Ikan Manta'], bestTime: '10:00-14:00' },
    ],
    amenities: ['Diving center', 'Penginapan', 'Restaurant', 'Kapal sewa'],
    bestSeason: 'April - Oktober',
    difficulty: 'sulit',
    rating: 4.9,
    reviewCount: 412,
  },
  {
    id: 'spot_005',
    name: 'Tanjung Bira',
    description: 'Tanjung dengan pemandangan laut terbuka, spot mancing laut dalam. Favorit para pemancing berpengalaman.',
    image: 'https://images.unsplash.com/photo-1468276311594-df7cb65d8df6?w=800',
    latitude: -5.5589,
    longitude: 120.2012,
    type: 'perairan_dalam',
    depthRange: '20-50 meter',
    coralZones: [
      { id: 'c8', lat: -5.5595, lng: 120.2020, type: 'rocky', depth: 25, riskLevel: 'medium' },
    ],
    fishSpots: [
      { lat: -5.5585, lng: 120.2010, fishTypes: ['Tuna', 'Marlin', 'Swordfish'], bestTime: '03:00-06:00' },
      { lat: -5.5590, lng: 120.2025, fishTypes: ['Mahi-mahi', 'Wahoo', 'Kingfish'], bestTime: '06:00-09:00' },
    ],
    amenities: ['Pelabuhan', 'Storage dingin', 'Workshop pancing', 'Penginapan'],
    bestSeason: 'Oktober - Maret',
    difficulty: 'sulit',
    rating: 4.7,
    reviewCount: 178,
  },
  {
    id: 'spot_006',
    name: 'Pantai Bara',
    description: 'Pantai dengan air laut yang sangat jernih, spot mancing dan snorkeling. Cocok untuk keluarga.',
    image: 'https://images.unsplash.com/photo-1504608524841-42fe6f032b4b?w=800',
    latitude: -5.5834,
    longitude: 120.2256,
    type: 'pantai',
    depthRange: '2-6 meter',
    coralZones: [
      { id: 'c9', lat: -5.5838, lng: 120.2260, type: 'coral_reef', depth: 3, riskLevel: 'low' },
    ],
    fishSpots: [
      { lat: -5.5832, lng: 120.2252, fishTypes: ['Ikan Terbang', 'Teri', 'Kembung'], bestTime: '07:00-10:00' },
      { lat: -5.5840, lng: 120.2262, fishTypes: ['Ikan Kakap', 'Ikan Merah'], bestTime: '16:00-19:00' },
    ],
    amenities: ['Taman laut', 'Jasa snorkel', 'Warung', 'Toilet'],
    bestSeason: 'April - November',
    difficulty: 'mudah',
    rating: 4.4,
    reviewCount: 95,
  },
];

// Get all spots
export async function getAllSpots(): Promise<Spot[]> {
  // Simulate network delay
  await new Promise(resolve => setTimeout(resolve, 500));
  return SPOTS_DATA;
}

// Get spot by ID
export async function getSpotById(id: string): Promise<Spot | null> {
  await new Promise(resolve => setTimeout(resolve, 300));
  return SPOTS_DATA.find(spot => spot.id === id) || null;
}

// Get spots by type
export async function getSpotsByType(type: Spot['type']): Promise<Spot[]> {
  await new Promise(resolve => setTimeout(resolve, 400));
  return SPOTS_DATA.filter(spot => spot.type === type);
}

// Search spots by name or description
export async function searchSpots(query: string): Promise<Spot[]> {
  await new Promise(resolve => setTimeout(resolve, 300));
  const lowerQuery = query.toLowerCase();
  return SPOTS_DATA.filter(spot =>
    spot.name.toLowerCase().includes(lowerQuery) ||
    spot.description.toLowerCase().includes(lowerQuery) ||
    spot.fishSpots.some(fs => fs.fishTypes.some(f => f.toLowerCase().includes(lowerQuery)))
  );
}

// Get spots by difficulty
export async function getSpotsByDifficulty(difficulty: Spot['difficulty']): Promise<Spot[]> {
  await new Promise(resolve => setTimeout(resolve, 300));
  return SPOTS_DATA.filter(spot => spot.difficulty === difficulty);
}

// Get nearby spots (simple distance calculation)
export async function getNearbySpots(lat: number, lng: number, radiusKm: number = 20): Promise<Spot[]> {
  await new Promise(resolve => setTimeout(resolve, 400));
  
  function calculateDistance(lat1: number, lon1: number, lat2: number, lon2: number): number {
    const R = 6371; // Earth's radius in km
    const dLat = (lat2 - lat1) * Math.PI / 180;
    const dLon = (lon2 - lon1) * Math.PI / 180;
    const a = Math.sin(dLat / 2) * Math.sin(dLat / 2) +
              Math.cos(lat1 * Math.PI / 180) * Math.cos(lat2 * Math.PI / 180) *
              Math.sin(dLon / 2) * Math.sin(dLon / 2);
    const c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
    return R * c;
  }

  return SPOTS_DATA.filter(spot => 
    calculateDistance(lat, lng, spot.latitude, spot.longitude) <= radiusKm
  );
}

// Get all spot types
export function getSpotTypes(): { value: Spot['type']; label: string; icon: string }[] {
  return [
    { value: 'pantai', label: 'Pantai', icon: 'beach' },
    { value: 'tebing_karang', label: 'Tebing Karang', icon: 'rocks' },
    { value: 'muara', label: 'Muara', icon: 'river' },
    { value: 'perairan_dalam', label: 'Perairan Dalam', icon: 'anchor' },
    { value: 'pulau', label: 'Pulau', icon: 'island' },
  ];
}

// Get all difficulty levels
export function getDifficultyLevels(): { value: Spot['difficulty']; label: string; color: string }[] {
  return [
    { value: 'mudah', label: 'Mudah', color: '#4CAF50' },
    { value: 'sedang', label: 'Sedang', color: '#FF9800' },
    { value: 'sulit', label: 'Sulit', color: '#F44336' },
  ];
}

// Get weather description from weather code (OpenWeatherMap)
export function getWeatherDescription(code: number): string {
  const weatherCodes: Record<number, { description: string; icon: string }> = {
    0: { description: 'Cerah', icon: 'sun' },
    1: { description: 'Umumnya Cerah', icon: 'sun' },
    2: { description: 'Sebagian Berawan', icon: 'cloud-sun' },
    3: { description: 'Berawan', icon: 'cloud' },
    45: { description: 'Berkabut', icon: 'cloud-fog' },
    48: { description: 'Kabut Beku', icon: 'cloud-fog' },
    51: { description: 'Gerimis Ringan', icon: 'cloud-drizzle' },
    53: { description: 'Gerimis', icon: 'cloud-drizzle' },
    55: { description: 'Gerimis Lebat', icon: 'cloud-drizzle' },
    61: { description: 'Hujan Ringan', icon: 'cloud-rain' },
    63: { description: 'Hujan', icon: 'cloud-rain' },
    65: { description: 'Hujan Lebat', icon: 'cloud-rain' },
    71: { description: 'Hujan Salju Ringan', icon: 'snowflake' },
    73: { description: 'Hujan Salju', icon: 'snowflake' },
    75: { description: 'Hujan Salju Lebat', icon: 'snowflake' },
    80: { description: 'Hujan Lokal Ringan', icon: 'cloud-rain' },
    81: { description: 'Hujan Lokal', icon: 'cloud-rain' },
    82: { description: 'Hujan Lokal Lebat', icon: 'cloud-rain' },
    95: { description: 'Badai Petir', icon: 'cloud-lightning' },
    96: { description: 'Badai Petir + Salju', icon: 'cloud-lightning' },
    99: { description: 'Badai Petir Berat', icon: 'cloud-lightning' },
  };
  return weatherCodes[code] || { description: 'Tidak Diketahui', icon: 'cloud' };
}