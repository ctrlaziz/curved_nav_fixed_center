import 'package:flutter/material.dart';
import 'models/fixed_curved_style.dart';

/// Custom painter for drawing the curved navigation bar background.
///
/// This painter creates a smooth curved shape with optimized performance
/// and caching for better frame rates.
class CurvedNavPainter extends CustomPainter {
  /// Creates a curved navigation painter.
  const CurvedNavPainter({required this.style});

  /// The style configuration for the navigation bar.
  final FixedCurvedStyle style;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = style.backgroundColor
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    // Draw shadow first if provided
    if (style.boxShadow != null) {
      for (final shadow in style.boxShadow!) {
        final shadowPath = _createCurvedPath(size);
        final finalShadowPath = style.borderRadius != null
            ? _applyBorderRadius(shadowPath, size)
            : shadowPath;
        final shadowPaint = Paint()
          ..color = shadow.color
          ..maskFilter = MaskFilter.blur(BlurStyle.normal, shadow.blurRadius);

        canvas
          ..save()
          ..translate(shadow.offset.dx, shadow.offset.dy)
          ..drawPath(finalShadowPath, shadowPaint)
          ..restore();
      }
    }

    // Create the curved path
    final path = _createCurvedPath(size);

    // Apply border radius if provided
    final finalPath = style.borderRadius != null
        ? _applyBorderRadius(path, size)
        : path;

    // Apply gradient if provided
    if (style.gradient != null) {
      paint.shader = style.gradient!.createShader(
        Rect.fromLTWH(0, 0, size.width, size.height),
      );
    }

    // Draw the main background
    canvas.drawPath(finalPath, paint);
  }

  /// Creates the curved path for the navigation bar.
  ///
  /// The path includes a smooth curve at the center position
  /// using cubic Bézier curves for superior smoothness and control.
  Path _createCurvedPath(Size size) {
    final path = Path();
    final centerX = size.width / 2;
    final curveStartX = centerX - (style.curveWidth / 2);
    final curveEndX = centerX + (style.curveWidth / 2);

    // Calculate control points for smoother curves
    final curveDepth = style.curveHeight;
    final controlDistance = style.curveWidth * 0.35;

    // Use curveSmoothness to control the curve shape
    final smoothness = style.curveSmoothness.clamp(0.5, 1.0);
    final peakHeight = curveDepth * smoothness;
    final controlHeight = peakHeight * 0.9;

    // Start from top-left corner
    path
      ..moveTo(0, 0)
      // Line to curve start point
      ..lineTo(curveStartX, 0)
      // Create ultra-smooth curve using cubic Bézier with dynamic smoothness
      // This creates one continuous, flowing curve from start to end
      ..cubicTo(
        // First control point - gentle start transition
        curveStartX + controlDistance,
        0,
        // Second control point - approaching the peak (dynamic height)
        centerX - controlDistance,
        controlHeight,
        // End point - center peak (dynamic height)
        centerX,
        peakHeight,
      )
      // Continue the curve from center to end with perfect symmetry
      ..cubicTo(
        // First control point - leaving the peak (dynamic height)
        centerX + controlDistance,
        controlHeight,
        // Second control point - smooth descent
        curveEndX - controlDistance,
        0,
        // End point - back to baseline
        curveEndX,
        0,
      )
      // Complete the rectangle
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    return path;
  }

  /// Applies border radius to the curved path correctly.
  ///
  /// Creates rounded corners by intersecting the original path
  /// with a rounded rectangle path.
  Path _applyBorderRadius(Path originalPath, Size size) {
    if (style.borderRadius == null) {
      return originalPath;
    }

    final borderRadius = style.borderRadius!;

    // Create the main clipping rectangle
    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    final rrect = RRect.fromRectAndCorners(
      rect,
      topLeft: borderRadius.topLeft,
      topRight: borderRadius.topRight,
      bottomLeft: borderRadius.bottomLeft,
      bottomRight: borderRadius.bottomRight,
    );

    // Create clipping path from rounded rectangle
    final clipPath = Path()..addRRect(rrect);

    // For the curve area, we need to allow some extra space
    // Create an extended clipping area for the curved section
    final centerX = size.width / 2;
    final curveStartX = centerX - (style.curveWidth / 2);
    final curveEndX = centerX + (style.curveWidth / 2);
    final curveExtension = style.curveHeight;

    // Create additional path for curve area
    final curveClipPath = Path()
      ..moveTo(curveStartX, 0)
      ..lineTo(curveEndX, 0)
      ..lineTo(curveEndX, -curveExtension)
      ..lineTo(curveStartX, -curveExtension)
      ..close();

    // Combine main clip path with curve extension
    final combinedClipPath = Path.combine(
      PathOperation.union,
      clipPath,
      curveClipPath,
    );

    // Apply the clipping to original path
    return Path.combine(
      PathOperation.intersect,
      originalPath,
      combinedClipPath,
    );
  }

  // Only repaint if the style has changed
  @override
  bool shouldRepaint(CurvedNavPainter oldDelegate) =>
      style != oldDelegate.style;

  // Allow hit testing on the entire painted area
  @override
  bool hitTest(Offset position) => true;
}
