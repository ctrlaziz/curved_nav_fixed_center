import 'package:flutter/material.dart';

/// Defines the visual styling for the curved navigation bar.
///
/// This class contains all customization options including colors,
/// dimensions, animations, and visual effects.
class FixedCurvedStyle {
  /// Creates a curved navigation style.
  const FixedCurvedStyle({
    this.backgroundColor = const Color(0xFF45319F),
    this.selectedItemColor = Colors.white,
    this.unselectedItemColor = const Color(0x99FFFFFF),
    this.activeColor, // Special color for the active/selected item
    this.height = 75.0, // Increased height to prevent overflow
    this.navigationBarHeight = 75.0, // Increased height to prevent overflow
    this.curveHeight = 30.0,
    this.curveWidth = 100.0,
    this.fixedCenterIndex = 2,
    this.animationDuration = const Duration(milliseconds: 300),
    this.animationCurve = Curves.easeInOut,
    this.showIndicator = false,
    this.indicatorColor = const Color(0xFFF7BF2D),
    this.indicatorSize = 6.0,
    this.boxShadow,
    this.borderRadius,
    this.gradient,
    this.curveSmoothness = 0.9, // Controls curve smoothness (0.5-1.0)
    this.showCenterBackground = true, // Show center circular background
    this.centerBackgroundColor, // Uses selectedItemColor if null
    this.centerBackgroundSize = 56.0, // Material Design FAB size
    this.centerBackgroundGradient, // Optional gradient for center background
    this.unselectedOpacity = 1.0, // Full opacity by default (no transparency)
  });

  /// Creates a style based on the current theme.
  ///
  /// This factory method extracts colors and styling from the provided
  /// [ThemeData] to create a style that matches the app's theme.
  factory FixedCurvedStyle.fromTheme(ThemeData theme) => FixedCurvedStyle(
    backgroundColor:
        theme.bottomNavigationBarTheme.backgroundColor ??
        theme.colorScheme.surface,
    selectedItemColor:
        theme.bottomNavigationBarTheme.selectedItemColor ??
        theme.colorScheme.primary,
    unselectedItemColor:
        theme.bottomNavigationBarTheme.unselectedItemColor ??
        theme.colorScheme.onSurface.withAlpha(150),
    activeColor: theme.colorScheme.primary,
    indicatorColor: theme.colorScheme.secondary,
    centerBackgroundColor: theme.colorScheme.primary,
  );

  /// Background color of the navigation bar.
  final Color backgroundColor;

  /// Color of the selected navigation item.
  final Color selectedItemColor;

  /// Color of unselected navigation items.
  final Color unselectedItemColor;

  /// Special color for the active/selected item.
  /// If null, uses selectedItemColor.
  final Color? activeColor;

  /// Total height of the navigation bar.
  final double height;

  /// Height of the navigation bar.
  final double navigationBarHeight;

  /// Height of the center curve.
  final double curveHeight;

  /// Width of the center curve.
  final double curveWidth;

  /// Index of the item that should be positioned at the center curve.
  /// Usually the middle item (index 2 for 5 items).
  final int fixedCenterIndex;

  /// Duration of animations (item selection, indicator movement).
  final Duration animationDuration;

  /// Animation curve for transitions.
  final Curve animationCurve;

  /// Whether to show the selection indicator.
  final bool showIndicator;

  /// Color of the selection indicator.
  final Color indicatorColor;

  /// Size of the selection indicator.
  final double indicatorSize;

  /// Shadow effects for the navigation bar.
  final List<BoxShadow>? boxShadow;

  /// Border radius for the navigation bar.
  final BorderRadius? borderRadius;

  /// Optional gradient overlay for the background.
  final Gradient? gradient;

  /// Controls the smoothness and depth of the curve (0.5-1.0).
  ///
  /// Higher values create deeper, more pronounced curves.
  /// Lower values create flatter, more subtle curves.
  /// Default is 0.9 for optimal smoothness.
  final double curveSmoothness;

  /// Whether to show circular background for the center item.
  /// Default is true.
  final bool showCenterBackground;

  /// Background color for the center item.
  /// If null, uses selectedItemColor with opacity.
  final Color? centerBackgroundColor;

  /// Size of the center item circular background.
  /// Default is 56.0 (Material Design FAB size).
  final double centerBackgroundSize;

  /// Gradient for the center item background.
  /// If provided, overrides centerBackgroundColor.
  final Gradient? centerBackgroundGradient;

  /// Opacity for unselected navigation items.
  ///
  /// Controls the transparency of unselected items.
  /// - 1.0 = fully opaque (no transparency) - default
  /// - 0.6 = semi-transparent (old behavior)
  /// - 0.0 = fully transparent
  final double unselectedOpacity;

  /// Creates a copy of this style with the given fields replaced.
  FixedCurvedStyle copyWith({
    Color? backgroundColor,
    Color? selectedItemColor,
    Color? unselectedItemColor,
    Color? activeColor,
    double? height,
    double? navigationBarHeight,
    double? curveHeight,
    double? curveWidth,
    int? fixedCenterIndex,
    Duration? animationDuration,
    Curve? animationCurve,
    bool? showIndicator,
    Color? indicatorColor,
    double? indicatorSize,
    List<BoxShadow>? boxShadow,
    BorderRadius? borderRadius,
    Gradient? gradient,
    double? curveSmoothness,
    bool? showCenterBackground,
    Color? centerBackgroundColor,
    double? centerBackgroundSize,
    Gradient? centerBackgroundGradient,
    double? unselectedOpacity,
  }) => FixedCurvedStyle(
    backgroundColor: backgroundColor ?? this.backgroundColor,
    selectedItemColor: selectedItemColor ?? this.selectedItemColor,
    unselectedItemColor: unselectedItemColor ?? this.unselectedItemColor,
    activeColor: activeColor ?? this.activeColor,
    height: height ?? this.height,
    navigationBarHeight: navigationBarHeight ?? this.navigationBarHeight,
    curveHeight: curveHeight ?? this.curveHeight,
    curveWidth: curveWidth ?? this.curveWidth,
    fixedCenterIndex: fixedCenterIndex ?? this.fixedCenterIndex,
    animationDuration: animationDuration ?? this.animationDuration,
    animationCurve: animationCurve ?? this.animationCurve,
    showIndicator: showIndicator ?? this.showIndicator,
    indicatorColor: indicatorColor ?? this.indicatorColor,
    indicatorSize: indicatorSize ?? this.indicatorSize,
    boxShadow: boxShadow ?? this.boxShadow,
    borderRadius: borderRadius ?? this.borderRadius,
    gradient: gradient ?? this.gradient,
    curveSmoothness: curveSmoothness ?? this.curveSmoothness,
    showCenterBackground: showCenterBackground ?? this.showCenterBackground,
    centerBackgroundColor: centerBackgroundColor ?? this.centerBackgroundColor,
    centerBackgroundSize: centerBackgroundSize ?? this.centerBackgroundSize,
    centerBackgroundGradient:
        centerBackgroundGradient ?? this.centerBackgroundGradient,
    unselectedOpacity: unselectedOpacity ?? this.unselectedOpacity,
  );
}
