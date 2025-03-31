import 'package:flutter/material.dart';

class AppColors {
  // Primary Colors
  static const Color primary = Color.fromRGBO(0, 150, 136, 1.0); // Teal color from main.dart
  static const Color primaryLight = Color.fromRGBO(77, 182, 172, 1.0); // Lighter shade for hover states
  static const Color primaryDark = Color.fromRGBO(0, 121, 107, 1.0); // Darker shade for pressed states

  // Secondary Colors
  static const Color secondary = Color(0xFFFFA000); // Warm orange for secondary elements
  static const Color secondaryLight = Color(0xFFFFB74D);
  static const Color secondaryDark = Color(0xFFF57C00);

  // Background Colors
  static const Color background = Color(0xFFF5F5F5); // Light gray for main background
  static const Color surface = Colors.white; // White for cards and elevated surfaces
  static const Color scaffoldBackground = Color(0xFFFAFAFA); // Slightly off-white for scaffold

  // Text Colors
  static const Color textPrimary = Color(0xFF212121); // Dark gray for primary text
  static const Color textSecondary = Color(0xFF757575); // Medium gray for secondary text
  static const Color textHint = Color(0xFF9E9E9E); // Light gray for hint text

  // Status Colors
  static const Color success = Color(0xFF4CAF50); // Green for success states
  static const Color error = Color(0xFFD32F2F); // Red for error states
  static const Color warning = Color(0xFFFFA000); // Orange for warning states
  static const Color info = Color(0xFF2196F3); // Blue for info states

  // Border Colors
  static const Color border = Color(0xFFE0E0E0); // Light gray for borders
  static const Color divider = Color(0xFFBDBDBD); // Medium gray for dividers

  // AppBar Colors
  static const Color appBarBackground = primary;
  static const Color appBarText = Colors.white;
  static const Color appBarIcon = Colors.white;

  // Button Colors
  static const Color buttonPrimary = primary;
  static const Color buttonPrimaryText = Colors.white;
  static const Color buttonSecondary = secondary;
  static const Color buttonSecondaryText = Colors.white;
  static const Color buttonDisabled = Color(0xFFBDBDBD);
  static const Color buttonDisabledText = Color(0xFF757575);

  // Card Colors
  static const Color cardBackground = Colors.white;
  static const Color cardBorder = border;
  static const Color cardShadow = Color(0x1A000000); // 10% opacity black

  // Input Field Colors
  static const Color inputBackground = Colors.white;
  static const Color inputBorder = border;
  static const Color inputFocusedBorder = primary;
  static const Color inputErrorBorder = error;

  // Rating Colors
  static const Color ratingStar = Color(0xFFFFD700); // Gold color for rating stars
  static const Color ratingStarEmpty = Color(0xFFE0E0E0); // Light gray for empty stars

  // Category Colors
  static const Color categoryBackground = Color(0xFFE8F5E9); // Light green for category backgrounds
  static const Color categoryText = primary;

  // Favorite Colors
  static const Color favorite = Color(0xFFE91E63); // Pink for favorite items
  static const Color favoriteEmpty = Color(0xFFBDBDBD); // Gray for unfavorited items
}
