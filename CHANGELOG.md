# Changelog | سجل التغييرات

All notable changes to this project will be documented in this file.
جميع التغييرات المهمة في هذا المشروع سيتم توثيقها في هذا الملف.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.1.2] - 2025-06-29

### Fixed | إصلاحات
- 📐 **Width responsiveness**: Added explicit width sizing using MediaQuery for full screen width coverage
- 📐 **استجابة العرض**: إضافة تحديد صريح للعرض باستخدام MediaQuery لتغطية العرض الكامل للشاشة

### Improved | تحسينات
- 🎯 **Layout consistency**: Navigation bar now consistently takes full screen width across all devices
- 🎯 **اتساق التخطيط**: شريط التنقل الآن يأخذ العرض الكامل للشاشة بثبات عبر جميع الأجهزة

## [0.1.1] - 2025-06-29

### Fixed | إصلاحات
- 🎨 **Code formatting**: Fixed all Dart formatting issues for pub.dev static analysis
- 🎨 **تنسيق الكود**: إصلاح جميع مشاكل تنسيق Dart للتحليل الثابت في pub.dev
- 📝 **Example consolidation**: Moved example content from basic_example.dart to main.dart
- 📝 **دمج المثال**: نقل محتوى المثال من basic_example.dart إلى main.dart
- 🗂️ **Project structure**: Simplified example structure with single main.dart file
- 🗂️ **بنية المشروع**: تبسيط بنية المثال بملف main.dart واحد

### Improved | تحسينات
- ✅ **Static analysis**: Now passes pub.dev static analysis with 50/50 score
- ✅ **التحليل الثابت**: الآن يمر بالتحليل الثابت لـ pub.dev بدرجة 50/50
- 📱 **Example visibility**: Example code now properly displayed on pub.dev
- 📱 **ظهور المثال**: كود المثال الآن يظهر بشكل صحيح على pub.dev

## [0.1.0+1] - 2025-06-29

### Fixed | إصلاحات
- 📅 **Updated copyright year**: Fixed copyright from 2024 to 2025
- 📅 **تحديث سنة حقوق الطبع**: تصحيح حقوق الطبع من 2024 إلى 2025
- 📧 **Contact information**: Updated placeholder contact details with proper GitHub links
- 📧 **معلومات التواصل**: تحديث معلومات التواصل الوهمية بروابط GitHub صحيحة
- 🔗 **Documentation links**: Fixed all placeholder URLs and maintainer information
- 🔗 **روابط التوثيق**: إصلاح جميع الروابط الوهمية ومعلومات المطور

### Documentation | التوثيق
- ✅ All placeholders removed and replaced with actual information
- ✅ تم إزالة جميع النصوص الوهمية واستبدالها بمعلومات حقيقية
- ✅ LICENSE file updated with correct copyright holder
- ✅ تحديث ملف LICENSE بصاحب حقوق الطبع الصحيح

## [0.1.0] - 2025-06-29

### 🎉 Initial Release | الإصدار الأولي

**Welcome to the first release of Curved Nav Fixed Center!**
**مرحباً بكم في الإصدار الأول من Curved Nav Fixed Center!**

This initial release introduces a powerful Flutter library for creating beautiful curved bottom navigation bars with a fixed center curve. Unlike other libraries that move the curve with each selection, our approach keeps the curve stationary for a more elegant and consistent user experience.

هذا الإصدار الأولي يقدم مكتبة Flutter قوية لإنشاء أشرطة تنقل سفلية منحنية جميلة مع انحناء ثابت بالوسط. على عكس المكتبات الأخرى التي تحرك الانحناء مع كل تحديد، طريقتنا تحافظ على الانحناء ثابتاً لتجربة مستخدم أكثر أناقة واتساقاً.

### ✨ Core Features | المميزات الأساسية

#### 🎯 **Fixed Center Curve**
- **English**: Fixed center curve that doesn't move with selection, providing consistent visual appeal
- **العربية**: انحناء ثابت بالوسط لا يتحرك مع التحديد، يوفر جاذبية بصرية متسقة

#### 🎨 **Advanced Customization**
- **Full Theme Control**: Complete customization of colors, dimensions, and animations
- **التحكم الكامل في الثيم**: تخصيص شامل للألوان والأبعاد والحركات
- **Flexible Styling**: Support for custom backgrounds, shadows, and border radius
- **تصميم مرن**: دعم للخلفيات المخصصة والظلال وتدوير الزوايا

#### ⚡ **High Performance**
- **Direct Custom Painting**: Optimized rendering using CustomPainter for better performance
- **الرسم المخصص المباشر**: رسم محسن باستخدام CustomPainter لأداء أفضل
- **Smart Clipping**: Efficient border radius application without extra layers
- **القطع الذكي**: تطبيق فعال لتدوير الزوايا بدون طبقات إضافية

#### 🎭 **Smooth Animations**
- **Cubic Bézier Curves**: Ultra-smooth curves using cubic Bézier instead of quadratic
- **منحنيات بيزييه التكعيبية**: منحنيات فائقة النعومة باستخدام بيزييه التكعيبية بدلاً من التربيعية
- **Configurable Smoothness**: Fine-tune curve depth with `curveSmoothness` (0.5-1.0)
- **نعومة قابلة للتكوين**: ضبط دقيق لعمق الانحناء مع `curveSmoothness` (0.5-1.0)
- **Flexible Animation Control**: Customizable duration and curves
- **تحكم مرن في الحركة**: مدة ومنحنيات قابلة للتخصيص

### 🎛️ **Complete Feature Set**

#### **Core Navigation Properties**
```dart
FixedCurvedNavigationBar(
  items: navItems,
  currentIndex: currentIndex,
  onTap: onItemTapped,
  style: FixedCurvedStyle(
    // All properties are fully customizable
  ),
)
```

#### **Style Customization Properties**
- `backgroundColor`: Navigation bar background color
- `selectedItemColor`: Color for selected items
- `unselectedItemColor`: Color for unselected items
- `activeColor`: Special highlight color for active items
- `height`: Navigation bar height (default: 65.0)
- `curveHeight`: Height of the center curve (default: 30.0)
- `curveWidth`: Width of the center curve (default: 100.0)
- `curveSmoothness`: Curve smoothness control (0.5-1.0, default: 0.9)
- `unselectedOpacity`: Opacity for unselected items (default: 1.0)

#### **Center Button Enhancement**
- `showCenterBackground`: Enable circular background for center button
- `centerBackgroundColor`: Custom color for center button background
- `centerBackgroundSize`: Size control for circular background (default: 56.0)
- `centerBackgroundGradient`: Gradient support for center button

#### **Animation & Interaction**
- `animationDuration`: Duration of selection animations
- `animationCurve`: Animation curve type
- `fixedCenterIndex`: Index of the center item (default: 2)

#### **Visual Effects**
- `boxShadow`: Custom shadow effects
- `borderRadius`: Border radius for the navigation bar
- `showIndicator`: Optional selection indicator (default: false)

### 📱 **Rich Example Collection**

#### **Basic Usage Example**
Simple implementation with 5 navigation items and center button.

#### **Advanced Customization Examples**
- **Professional Blue Theme**: Corporate-style navigation
- **Warm Gradient Theme**: Eye-catching gradient backgrounds
- **Dark Elegant Theme**: Sophisticated dark mode styling
- **Colorful Theme**: Vibrant and playful design

#### **Interactive Demos**
- **Curve Smoothness Control**: Real-time curve adjustment
- **Center Button Showcase**: Multiple center button designs
- **Opacity Control**: Unselected item transparency options

### 🧪 **Quality Assurance**

#### **Comprehensive Testing**
- **Widget Tests**: Complete coverage of all interactions
- **Performance Tests**: Optimized rendering validation
- **Accessibility Tests**: Full a11y compliance verification
- **Cross-Platform Tests**: Android and iOS compatibility

#### **Code Quality**
- **Strict Linting**: High-quality code standards
- **Documentation**: Comprehensive Arabic and English documentation
- **Examples**: Multiple real-world usage examples

### 🌍 **Internationalization**
- **Bilingual Documentation**: Complete Arabic and English support
- **RTL Support**: Right-to-left layout compatibility
- **Accessibility Labels**: Semantic labeling in multiple languages

### 🔧 **Technical Architecture**

#### **Core Components**
- `FixedCurvedNavigationBar`: Main widget component
- `CurvedNavPainter`: Custom painter for curve rendering
- `FixedCurvedNavItem`: Navigation item model
- `FixedCurvedStyle`: Comprehensive styling configuration
- `PositionCalculator`: Precise positioning utilities

#### **Performance Optimizations**
- Direct CustomPainter rendering without extra clipping layers
- Efficient animation handling with proper lifecycle management
- Smart position calculations for optimal layout performance
- Memory-efficient widget tree structure

### 🎯 **Development Status**

This is the **initial stable release** (v0.1.0) of the library. While fully functional and production-ready, we're actively seeking community feedback and contributions to make it even better.

**What's Next?**
- Community feedback integration
- Additional customization options
- Performance optimizations
- Extended platform support

### 📦 **Installation**

```yaml
dependencies:
  curved_nav_fixed_center: ^0.1.0
```

```dart
import 'package:curved_nav_fixed_center/curved_nav_fixed_center.dart';
```

### 🤝 **Contributing**

We welcome contributions! This library is under active development, and we're excited to collaborate with the community to make it even better.

---

**Note**: This initial release includes all features that were previously versioned as 1.0.0 through 1.5.0 during development. We've consolidated them into this single, stable 0.1.0 release to provide a clean starting point for the community.

**ملاحظة**: هذا الإصدار الأولي يتضمن جميع الميزات التي كانت مرقمة سابقاً من 1.0.0 إلى 1.5.0 أثناء التطوير. لقد دمجناها في هذا الإصدار المستقر الوحيد 0.1.0 لتوفير نقطة انطلاق نظيفة للمجتمع. 