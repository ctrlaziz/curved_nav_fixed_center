import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'curved_nav_painter.dart';
import 'models/fixed_curved_nav_item.dart';
import 'models/fixed_curved_style.dart';
import 'utils/position_calculator.dart';

/// A beautiful curved bottom navigation bar with fixed center curve.
///
/// This widget provides a customizable navigation bar where the curve
/// stays fixed at the center position, offering smooth animations
/// and excellent user experience.
class FixedCurvedNavigationBar extends StatefulWidget {
  /// Creates a curved navigation bar.
  ///
  /// The [items] and [onTap] parameters are required.
  /// The [currentIndex] defaults to 0.
  const FixedCurvedNavigationBar({
    super.key,
    required this.items,
    required this.onTap,
    this.currentIndex = 0,
    this.style = const FixedCurvedStyle(),
    this.enableHapticFeedback = true,
  });

  /// List of navigation items to display.
  final List<FixedCurvedNavItem> items;

  /// Callback function called when an item is tapped.
  final ValueChanged<int> onTap;

  /// Currently selected item index.
  final int currentIndex;

  /// Visual styling configuration.
  final FixedCurvedStyle style;

  /// Whether to enable haptic feedback on item tap.
  final bool enableHapticFeedback;

  @override
  State<FixedCurvedNavigationBar> createState() =>
      _FixedCurvedNavigationBarState();
}

class _FixedCurvedNavigationBarState extends State<FixedCurvedNavigationBar>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: widget.style.animationDuration,
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: widget.style.animationCurve,
    );
    _animationController.forward();
  }

  @override
  void didUpdateWidget(FixedCurvedNavigationBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.currentIndex != widget.currentIndex) {
      _animationController.forward(from: 0);
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => SizedBox(
    height: widget.style.height,
    child: Stack(
      clipBehavior: Clip.none,
      // Allow center button to extend beyond bounds
      children: [
        // Background with curve - uses navigationBarHeight
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          height: widget.style.navigationBarHeight,
          child: CustomPaint(painter: CurvedNavPainter(style: widget.style)),
        ),

        // Regular navigation items
        // (excluding center) - uses navigationBarHeight
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          height: widget.style.navigationBarHeight,
          child: Row(children: _buildRegularNavItems()),
        ),

        // Center button - positioned separately
        if (widget.style.showCenterBackground && _hasCenterItem)
          _buildCenterButton(),
      ],
    ),
  );

  /// Checks if there's a center item
  bool get _hasCenterItem =>
      widget.style.fixedCenterIndex < widget.items.length;

  /// Builds regular navigation items (excluding center button)
  List<Widget> _buildRegularNavItems() =>
      List.generate(widget.items.length, (index) {
        if (index == widget.style.fixedCenterIndex &&
            widget.style.showCenterBackground) {
          // Return empty expanded widget for center position
          return const Expanded(child: SizedBox.shrink());
        }
        return Expanded(child: _buildNavItem(widget.items[index], index));
      });

  /// Builds the center button separately
  Widget _buildCenterButton() {
    final centerIndex = widget.style.fixedCenterIndex;
    final centerItem = widget.items[centerIndex];
    final isSelected = widget.currentIndex == centerIndex;

    // Calculate center position
    final screenWidth = MediaQuery.of(context).size.width;
    final itemWidth = screenWidth / widget.items.length;
    final centerX =
        (centerIndex + 0.5) * itemWidth -
        (widget.style.centerBackgroundSize / 2);

    return Positioned(
      left: centerX,
      top: 0,
      child: GestureDetector(
        onTap: () => _onItemTapped(centerIndex),
        child: Container(
          width: widget.style.centerBackgroundSize,
          height: widget.style.centerBackgroundSize,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: widget.style.centerBackgroundGradient == null
                ? (widget.style.centerBackgroundColor ??
                      widget.style.selectedItemColor.withAlpha(40))
                : null,
            gradient: widget.style.centerBackgroundGradient,
            boxShadow: [
              BoxShadow(
                color:
                    (widget.style.centerBackgroundColor ??
                            widget.style.selectedItemColor)
                        .withAlpha(60),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Center(
            child: IconTheme(
              data: IconThemeData(
                color: widget.style.centerBackgroundGradient != null
                    ? Colors.white
                    : (isSelected
                          ? (widget.style.activeColor ??
                                widget.style.selectedItemColor)
                          : widget.style.unselectedItemColor),
                size: 28,
              ),
              child: centerItem.getIcon(isSelected: isSelected),
            ),
          ),
        ),
      ),
    );
  }

  /// Builds an icon with optional circular background for center item.
  Widget _buildIconWithBackground(
    FixedCurvedNavItem item,
    bool isSelected,
    bool isCenter,
  ) {
    final iconWidget = IconTheme(
      data: IconThemeData(
        color: isSelected
            ? (widget.style.activeColor ?? widget.style.selectedItemColor)
            : widget.style.unselectedItemColor,
        size: isCenter ? 28 : 24,
      ),
      child: item.getIcon(isSelected: isSelected),
    );

    // Add circular background for center item if enabled
    if (isCenter && widget.style.showCenterBackground) {
      final effectiveBackgroundColor =
          widget.style.centerBackgroundColor ??
          widget.style.selectedItemColor.withAlpha(40);

      return Container(
        width: widget.style.centerBackgroundSize,
        height: widget.style.centerBackgroundSize,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: widget.style.centerBackgroundGradient == null
              ? effectiveBackgroundColor
              : null,
          gradient: widget.style.centerBackgroundGradient,
          boxShadow: [
            BoxShadow(
              color:
                  (widget.style.centerBackgroundColor ??
                          widget.style.selectedItemColor)
                      .withAlpha(60),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Center(
          child: IconTheme(
            data: IconThemeData(
              color: widget.style.centerBackgroundGradient != null
                  ? Colors.white
                  : (isSelected
                        ? (widget.style.activeColor ??
                              widget.style.selectedItemColor)
                        : widget.style.unselectedItemColor),
              size: 28,
            ),
            child: item.getIcon(isSelected: isSelected),
          ),
        ),
      );
    }

    return iconWidget;
  }

  /// Builds a single navigation item with animations and interactions.
  Widget _buildNavItem(FixedCurvedNavItem item, int index) {
    final isSelected = widget.currentIndex == index;
    final isCenter = index == widget.style.fixedCenterIndex;

    final scale = PositionCalculator.calculateItemScale(
      itemIndex: index,
      selectedIndex: widget.currentIndex,
      style: widget.style,
    );

    final opacity = PositionCalculator.calculateItemOpacity(
      itemIndex: index,
      selectedIndex: widget.currentIndex,
      style: widget.style,
    );

    final verticalOffset = PositionCalculator.calculateItemVerticalOffset(
      itemIndex: index,
      style: widget.style,
    );

    // Keep container height reasonable
    // overflow will be handled by clipBehavior: Clip.none
    final containerHeight = widget.style.height - 10;

    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) => Transform.translate(
        offset: Offset(0, verticalOffset),
        child: AnimatedScale(
          duration: widget.style.animationDuration,
          scale: scale,
          child: AnimatedOpacity(
            duration: widget.style.animationDuration,
            opacity: opacity,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () => _onItemTapped(index),
                borderRadius: BorderRadius.circular(25),
                child: Container(
                  height: containerHeight,
                  padding: EdgeInsets.symmetric(
                    horizontal: isCenter ? 8 : 8, // Reduced center padding
                    vertical: isCenter
                        ? 2
                        : 4, // Reduced center vertical padding
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Icon with proper sizing
                      // and optional circular background for center
                      if (isCenter && widget.style.showCenterBackground)
                        // Center button with fixed size
                        SizedBox(
                          width: widget.style.centerBackgroundSize,
                          height: widget.style.centerBackgroundSize,
                          child: AnimatedSwitcher(
                            duration: widget.style.animationDuration,
                            child: _buildIconWithBackground(
                              item,
                              isSelected,
                              isCenter,
                            ),
                          ),
                        )
                      else
                        // Regular items with flex expansion
                        Expanded(
                          child: AnimatedSwitcher(
                            duration: widget.style.animationDuration,
                            child: _buildIconWithBackground(
                              item,
                              isSelected,
                              isCenter,
                            ),
                          ),
                        ),

                      // Label (if provided) with overflow protection
                      if (item.label != null && !isCenter) ...[
                        const SizedBox(height: 2),
                        Flexible(
                          child: Text(
                            item.label!,
                            style: TextStyle(
                              color: isSelected
                                  ? (widget.style.activeColor ??
                                        widget.style.selectedItemColor)
                                  : widget.style.unselectedItemColor,
                              fontSize: 10,
                              fontWeight: isSelected
                                  ? FontWeight.w600
                                  : FontWeight.w400,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Handles item tap events with haptic feedback and callbacks.
  void _onItemTapped(int index) {
    if (widget.enableHapticFeedback) {
      HapticFeedback.lightImpact();
    }

    widget.onTap(index);
  }
}
