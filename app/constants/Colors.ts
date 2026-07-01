// =============================================
// 🌊 FishApp - Ocean Dark Theme Palette
// =============================================

export const Colors = {
  // Primary Colors
  primary: '#0077B6',      // Deep Ocean Blue
  primaryLight: '#00B4D8', // Bright Cyan
  primaryDark: '#03045E',  // Dark Navy

  // Accent Colors
  accent: '#90E0EF',       // Light Aqua
  accentBright: '#CAF0F8',// Very Light Blue

  // Background Colors
  background: '#023047',   // Main Background
  surface: '#03045E',      // Card/Surface Background
  surfaceLight: '#0A3460', // Lighter Surface
  surfaceElevated: '#126185', // Elevated Surface

  // Text Colors
  textPrimary: '#FFFFFF',    // Primary Text
  textSecondary: '#90E0EF',  // Secondary Text
  textMuted: '#6B8CAE',      // Muted/Placeholder Text

  // Semantic Colors
  success: '#4CAF50',      // Success Green
  successLight: '#81C784',
  warning: '#FF9800',      // Warning Orange
  warningLight: '#FFB74D',
  danger: '#F44336',      // Danger Red
  dangerLight: '#EF5350',
  info: '#2196F3',        // Info Blue
  infoLight: '#64B5F6',

  // Special Colors
  coral: '#FF6B6B',       // Coral Reef (for fish spots)
  fishZone: '#4ECDC4',    // Fish Zone
  deepWater: '#2C3E50',   // Deep Water
  shallowWater: '#3498DB', // Shallow Water
  sand: '#F4E4BA',        // Sand Beach

  // Gradient Colors
  gradientStart: '#0077B6',
  gradientEnd: '#00B4D8',

  // Tab Bar
  tabBarBackground: '#03045E',
  tabBarActive: '#00B4D8',
  tabBarInactive: '#6B8CAE',

  // Border/Divider
  border: 'rgba(144, 224, 239, 0.2)',
  divider: 'rgba(144, 224, 239, 0.1)',

  // Overlay
  overlay: 'rgba(2, 48, 71, 0.8)',
  overlayDark: 'rgba(0, 0, 0, 0.6)',

  // Difficulty Badge Colors
  badgeEasy: {
    bg: 'rgba(76, 175, 80, 0.2)',
    text: '#4CAF50',
  },
  badgeMedium: {
    bg: 'rgba(255, 152, 0, 0.2)',
    text: '#FF9800',
  },
  badgeHard: {
    bg: 'rgba(244, 67, 54, 0.2)',
    text: '#F44336',
  },

  // Skeleton Loading
  skeleton: '#1A4A6B',
  skeletonHighlight: '#2A5A7B',
};

export const Spacing = {
  xs: 4,
  sm: 8,
  md: 12,
  lg: 16,
  xl: 20,
  xxl: 24,
  xxxl: 32,
};

export const FontSizes = {
  xs: 10,
  sm: 12,
  md: 14,
  lg: 16,
  xl: 18,
  xxl: 22,
  xxxl: 28,
  display: 36,
};

export const BorderRadius = {
  sm: 8,
  md: 12,
  lg: 16,
  xl: 20,
  xxl: 24,
  round: 9999,
};

export const Shadows = {
  sm: {
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 1 },
    shadowOpacity: 0.2,
    shadowRadius: 2,
    elevation: 2,
  },
  md: {
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.25,
    shadowRadius: 4,
    elevation: 4,
  },
  lg: {
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 4 },
    shadowOpacity: 0.3,
    shadowRadius: 8,
    elevation: 8,
  },
};