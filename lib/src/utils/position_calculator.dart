import 'dart:math' as math;
import '../models/fixed_curved_style.dart';

/// Utility class for calculating positions of navigation items and indicators.
///
/// This class handles the complex calculations needed to properly position
/// items around the curved center section.
class PositionCalculator {
  /// Calculates the horizontal position for a navigation item.
  ///
  /// Provides equal distribution of items across the navigation bar.
  static double calculateItemPosition({
    required int itemIndex,
    required int totalItems,
    required double totalWidth,
    required FixedCurvedStyle style,
  }) {
    if (totalItems <= 1) {
      return totalWidth / 2;
    }

    // Simple equal distribution - no complex adjustments
    final itemWidth = totalWidth / totalItems;
    return (itemIndex + 0.5) * itemWidth;
  }

  /// Calculates the vertical offset for an item based on its position.
  ///
  /// Items near the center curve may need vertical adjustment
  /// to maintain visual balance.
  static double calculateItemVerticalOffset({
    required int itemIndex,
    required FixedCurvedStyle style,
  }) {
    if (itemIndex == style.fixedCenterIndex && style.showCenterBackground) {
      // Center item gets moderate elevation to maintain balance
      // Calculate modest elevation based on center button size
      final baseElevation = style.curveHeight * 0.4;
      final sizeBasedElevation = (style.centerBackgroundSize - 56.0) * 0.15;
      final totalElevation = baseElevation + sizeBasedElevation;
      // Limit elevation to prevent overflow
      return -math.min(totalElevation, style.height * 0.3);
    }

    return 0.0;
  }

  /// Calculates the position for the selection indicator.
  ///
  /// The indicator smoothly moves between items with accurate positioning.
  static double calculateIndicatorPosition({
    required int selectedIndex,
    required int totalItems,
    required double totalWidth,
    required FixedCurvedStyle style,
  }) {
    if (!style.showIndicator) {
      return 0.0;
    }

    // Simple and accurate calculation based on equal distribution
    final itemWidth = totalWidth / totalItems;
    final itemCenterX = (selectedIndex + 0.5) * itemWidth;

    // Center the indicator under the item without complex adjustments
    return itemCenterX - (style.indicatorSize / 2);
  }

  /// Calculates the scale factor for an item based on its selection state
  /// and position relative to the center curve.
  static double calculateItemScale({
    required int itemIndex,
    required int selectedIndex,
    required FixedCurvedStyle style,
  }) {
    final isSelected = itemIndex == selectedIndex;
    final isCenter = itemIndex == style.fixedCenterIndex;

    if (isSelected) {
      return isCenter ? 1.2 : 1.1; // Larger scale for center item
    }

    return 1.0;
  }

  /// Calculates the opacity for an item based on its selection state.
  static double calculateItemOpacity({
    required int itemIndex,
    required int selectedIndex,
    required FixedCurvedStyle style,
  }) => itemIndex == selectedIndex ? 1.0 : style.unselectedOpacity;
}
