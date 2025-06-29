import 'package:flutter/material.dart';

/// Represents a single navigation item in the curved navigation bar.
///
/// Each item can have different icons for active/inactive states,
/// custom labels, and accessibility support.
class FixedCurvedNavItem {
  /// Creates a navigation item.
  ///
  /// The [icon] parameter is required.
  const FixedCurvedNavItem({
    required this.icon,
    this.activeIcon,
    this.label,
    this.semanticLabel,
    this.backgroundColor,
  });

  /// The icon to display when the item is not selected.
  final Widget icon;

  /// The icon to display when the item is selected.
  /// If null, the regular [icon] will be used.
  final Widget? activeIcon;

  /// Optional label text to display below the icon.
  final String? label;

  /// Semantic label for accessibility purposes.
  /// If null, [label] will be used.
  final String? semanticLabel;

  /// Background color for this specific item.
  /// If null, the global style color will be used.
  final Color? backgroundColor;

  /// Returns the effective semantic label for accessibility.
  String get effectiveSemanticLabel =>
      semanticLabel ?? label ?? 'Navigation item';

  /// Returns the appropriate icon based on selection state.
  Widget getIcon({required bool isSelected}) =>
      isSelected && activeIcon != null ? activeIcon! : icon;
}
