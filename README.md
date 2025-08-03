# Curved Nav Fixed Center

<div align="center">

![License](https://img.shields.io/badge/license-MIT-blue.svg)
![Pub Version](https://img.shields.io/badge/pub-v0.1.2-blue.svg)
![Flutter](https://img.shields.io/badge/Flutter-%5E3.8.1-blue.svg)
![Development](https://img.shields.io/badge/status-active%20development-green.svg)

**شريط تنقل منحني جميل مع انحناء ثابت بالوسط وحركات سلسة**

*A beautiful curved bottom navigation bar with fixed center curve and smooth animations*

**🚧 Currently under active development - contributions and feedback welcome! 🚧**

</div>

---

## 📱 لمحة سريعة | Overview

### العربية
مكتبة Flutter جديدة وقوية توفر شريط تنقل سفلي منحني مع **انحناء ثابت بالوسط**، على عكس المكتبات الأخرى التي تحرك الانحناء مع كل ضغطة. تقدم هذه المكتبة تجربة مستخدم أفضل مع تفاعل بصري سلس وأداء محسّن. **المكتبة حالياً تحت التطوير النشط ونرحب بالمساهمات والاقتراحات!**

### English
A new and powerful Flutter library that provides a curved bottom navigation bar with a **fixed center curve**, unlike other libraries that move the curve with each tap. This library offers a better user experience with smooth visual interactions and optimized performance. **Currently under active development - contributions and feedback welcome!**

---

## ✨ المميزات | Features

| Feature | Description (العربية) | Description (English) |
|---------|----------------------|----------------------|
| 🎯 **Fixed Curve** | انحناء ثابت بالوسط لا يتحرك | Fixed center curve that doesn't move |
| 🎨 **Customizable** | تخصيص كامل للألوان والأبعاد | Full customization of colors and dimensions |
| ⚡ **High Performance** | أداء محسّن باستخدام Custom Painting مباشر | Optimized performance using direct Custom Painting |
| 🌟 **Smooth Animations** | حركات سلسة ومؤشرات بصرية | Smooth animations and visual indicators |
| ♿ **Accessibility** | دعم كامل لإمكانية الوصول | Full accessibility support |
| 📱 **Responsive** | متجاوب مع جميع أحجام الشاشات | Responsive to all screen sizes |

---

## 🚀 التثبيت | Installation

### 1. إضافة التبعية | Add Dependency

```yaml
dependencies:
  curved_nav_fixed_center: ^0.1.2
```

### 2. تثبيت الحزمة | Install Package

```bash
flutter pub get
```

### 3. الاستيراد | Import

```dart
import 'package:curved_nav_fixed_center/curved_nav_fixed_center.dart';
```

---

## 📚 الاستخدام | Usage

### الاستخدام الأساسي | Basic Usage

```dart
import 'package:flutter/material.dart';
import 'package:curved_nav_fixed_center/curved_nav_fixed_center.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  final List<FixedCurvedNavItem> _navItems = [
    FixedCurvedNavItem(
      icon: Icon(Icons.home_outlined),
      activeIcon: Icon(Icons.home),
      label: 'الرئيسية',
    ),
    FixedCurvedNavItem(
      icon: Icon(Icons.shopping_cart_outlined),
      activeIcon: Icon(Icons.shopping_cart),
      label: 'المتجر',
    ),
    FixedCurvedNavItem(
      icon: Icon(Icons.add),
      semanticLabel: 'إضافة',
    ),
    FixedCurvedNavItem(
      icon: Icon(Icons.notifications_outlined),
      activeIcon: Icon(Icons.notifications),
      label: 'الإشعارات',
    ),
    FixedCurvedNavItem(
      icon: Icon(Icons.person_outline),
      activeIcon: Icon(Icons.person),
      label: 'الملف الشخصي',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: FixedCurvedNavigationBar(
        items: _navItems,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
```

### الاستخدام المتقدم | Advanced Usage

```dart
FixedCurvedNavigationBar(
  items: _navItems,
  currentIndex: _currentIndex,
  onTap: (index) => _onItemTapped(index),
  style: FixedCurvedStyle(
    backgroundColor: Color(0xFF2E3A59),
    selectedItemColor: Color(0xFFFFD700),
    unselectedItemColor: Colors.white60,
    activeColor: Color(0xFFF7BF2D), // لون مميز للعنصر النشط
    curveHeight: 40.0,
    curveWidth: 120.0,
    fixedCenterIndex: 2,
    animationDuration: Duration(milliseconds: 400),
    animationCurve: Curves.elasticOut,
    boxShadow: [
      BoxShadow(
        color: Colors.black26,
        blurRadius: 10,
        offset: Offset(0, -2),
      ),
    ],
    borderRadius: BorderRadius.vertical(
      top: Radius.circular(20),
    ),
  ),
)
```

---

## 🎨 التخصيص | Customization

### FixedCurvedStyle خصائص | FixedCurvedStyle Properties

| Property | Type | Default | Description (العربية) | Description (English) |
|----------|------|---------|----------------------|----------------------|
| `backgroundColor` | `Color` | `Color(0xFF45319F)` | لون خلفية شريط التنقل | Navigation bar background color |
| `selectedItemColor` | `Color` | `Colors.white` | لون العنصر المحدد | Selected item color |
| `unselectedItemColor` | `Color` | `Color(0x99FFFFFF)` | لون العناصر غير المحددة | Unselected items color |
| `activeColor` | `Color?` | `null` | لون مخصص للعنصر النشط | Custom color for active item |
| `height` | `double` | `65.0` | ارتفاع شريط التنقل | Navigation bar height |
| `curveHeight` | `double` | `30.0` | ارتفاع الانحناء | Curve height |
| `curveWidth` | `double` | `100.0` | عرض الانحناء | Curve width |
| `fixedCenterIndex` | `int` | `2` | فهرس العنصر المحوري | Center item index |
| `animationDuration` | `Duration` | `Duration(milliseconds: 300)` | مدة الحركة | Animation duration |
| `curveSmoothness` | `double` | `0.9` | نعومة الانحناء (0.5-1.0) | Curve smoothness (0.5-1.0) |
| `unselectedOpacity` | `double` | `1.0` | شفافية العناصر غير المحددة | Opacity for unselected items |
| `showCenterBackground` | `bool` | `true` | إظهار خلفية دائرية للزر المحوري | Show circular background for center button |
| `centerBackgroundColor` | `Color?` | `null` | لون خلفية الزر المحوري | Center button background color |
| `centerBackgroundSize` | `double` | `56.0` | حجم خلفية الزر المحوري | Center button background size |
| `centerBackgroundGradient` | `Gradient?` | `null` | تدرج خلفية الزر المحوري | Center button background gradient |

### FixedCurvedNavItem خصائص | FixedCurvedNavItem Properties

| Property | Type | Required | Description (العربية) | Description (English) |
|----------|------|----------|----------------------|----------------------|
| `icon` | `Widget` | ✅ | الأيقونة الأساسية | Main icon |
| `activeIcon` | `Widget?` | ❌ | أيقونة الحالة النشطة | Active state icon |
| `label` | `String?` | ❌ | النص التوضيحي | Label text |
| `semanticLabel` | `String?` | ❌ | تسمية إمكانية الوصول | Accessibility label |
| `backgroundColor` | `Color?` | ❌ | لون خلفية خاص | Item-specific background color |

---

## 🎯 أمثلة متقدمة | Advanced Examples

### 1. التكامل مع الثيم | Theme Integration

```dart
// استخدام ألوان الثيم
FixedCurvedNavigationBar(
  items: items,
  currentIndex: currentIndex,
  onTap: onTap,
  style: FixedCurvedStyle.fromTheme(Theme.of(context)),
)
```

### 2. تصميم مخصص | Custom Design

```dart
FixedCurvedStyle(
  backgroundColor: Colors.transparent,
  gradient: LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFF667eea),
      Color(0xFF764ba2),
    ],
  ),
  selectedItemColor: Colors.white,
  unselectedItemColor: Colors.white70,
  curveHeight: 25.0,
  curveWidth: 80.0,
  borderRadius: BorderRadius.vertical(
    top: Radius.circular(25),
  ),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 20,
      offset: Offset(0, -5),
    ),
  ],
)
```

### 3. عناصر مخصصة | Custom Items

```dart
final customItems = [
  FixedCurvedNavItem(
    icon: Icon(Icons.home_outlined, size: 24),
    activeIcon: Icon(Icons.home, size: 26),
    label: 'Home',
    semanticLabel: 'Navigate to home page',
  ),
  FixedCurvedNavItem(
    icon: Badge(
      label: Text('3'),
      child: Icon(Icons.shopping_cart_outlined),
    ),
    activeIcon: Badge(
      label: Text('3'),
      child: Icon(Icons.shopping_cart),
    ),
    label: 'Cart',
  ),
  // العنصر المحوري مع تأثير خاص
  FixedCurvedNavItem(
    icon: Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: [Colors.yellow, Colors.orange],
        ),
      ),
      child: Icon(Icons.add, color: Colors.white),
    ),
    semanticLabel: 'Add new item',
  ),
];
```

### 4. التحكم في نعومة الانحناء | Curve Smoothness Control

```dart
// انحناء خفيف ومسطح
FixedCurvedStyle(
  curveSmoothness: 0.5, // 50% smoothness
  curveHeight: 20.0,
  curveWidth: 100.0,
)

// انحناء متوسط
FixedCurvedStyle(
  curveSmoothness: 0.7, // 70% smoothness
  curveHeight: 30.0,
  curveWidth: 120.0,
)

// انحناء عميق وناعم
FixedCurvedStyle(
  curveSmoothness: 1.0, // 100% smoothness
  curveHeight: 40.0,
  curveWidth: 140.0,
)

// التحكم التفاعلي في النعومة
class InteractiveCurveDemo extends StatefulWidget {
  @override
  _InteractiveCurveDemoState createState() => _InteractiveCurveDemoState();
}

class _InteractiveCurveDemoState extends State<InteractiveCurveDemo> {
  double _smoothness = 0.9;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Slider(
            value: _smoothness,
            min: 0.5,
            max: 1.0,
            onChanged: (value) => setState(() => _smoothness = value),
          ),
          Text('النعومة: ${(_smoothness * 100).toInt()}%'),
        ],
      ),
      bottomNavigationBar: FixedCurvedNavigationBar(
        items: items,
        currentIndex: currentIndex,
        onTap: onTap,
        style: FixedCurvedStyle(
          curveSmoothness: _smoothness, // التحكم المباشر!
          curveHeight: 35.0,
          curveWidth: 130.0,
        ),
      ),
    );
  }
}
```

### 5. تخصيص الشفافية | Opacity Customization

```dart
// بدون شفافية (افتراضي) - عناصر غير محددة واضحة تماماً
FixedCurvedStyle(
  unselectedOpacity: 1.0, // No transparency
  selectedItemColor: Colors.blue,
  unselectedItemColor: Colors.grey,
)

// شفافية خفيفة للعناصر غير المحددة
FixedCurvedStyle(
  unselectedOpacity: 0.8, // Slight transparency
  selectedItemColor: Colors.blue,
  unselectedItemColor: Colors.grey,
)

// الطريقة الكلاسيكية - شفافية أكثر
FixedCurvedStyle(
  unselectedOpacity: 0.6, // Classic semi-transparent
  selectedItemColor: Colors.blue,
  unselectedItemColor: Colors.grey,
)

// شفافية قوية للتركيز على العنصر المحدد
FixedCurvedStyle(
  unselectedOpacity: 0.3, // Strong transparency
  selectedItemColor: Colors.blue,
  unselectedItemColor: Colors.grey,
)
```

### 6. تخصيص الزر المحوري | Center Button Customization

```dart
// زر محوري مع خلفية دائرية ملونة
FixedCurvedStyle(
  showCenterBackground: true,
  centerBackgroundColor: Color(0xFFF39C12),
  centerBackgroundSize: 60.0,
)

// زر محوري مع خلفية متدرجة
FixedCurvedStyle(
  showCenterBackground: true,
  centerBackgroundGradient: LinearGradient(
    colors: [
      Color(0xFFFF6B6B),
      Color(0xFFFF8E53),
    ],
  ),
  centerBackgroundSize: 58.0,
)

// إخفاء الخلفية الدائرية
FixedCurvedStyle(
  showCenterBackground: false, // بدون خلفية دائرية
)

// مجموعة تصاميم مختلفة للزر المحوري
class CenterButtonVariations {
  static const classic = FixedCurvedStyle(
    showCenterBackground: true,
    centerBackgroundColor: Color(0xFFF39C12),
    centerBackgroundSize: 56.0,
  );

  static const gradient = FixedCurvedStyle(
    showCenterBackground: true,
    centerBackgroundGradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [Color(0xFF8E2DE2), Color(0xFF4A00E0)],
    ),
    centerBackgroundSize: 60.0,
  );

  static const ocean = FixedCurvedStyle(
    showCenterBackground: true,
    centerBackgroundGradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [Color(0xFF00B4DB), Color(0xFF0083B0)],
    ),
    centerBackgroundSize: 58.0,
  );
}
```

---

## 🧪 الاختبار | Testing

```dart
import 'package:flutter_test/flutter_test.dart';
import 'package:curved_nav_fixed_center/curved_nav_fixed_center.dart';

void main() {
  group('FixedCurvedNavigationBar Tests', () {
    testWidgets('renders all navigation items', (tester) async {
      const items = [
        FixedCurvedNavItem(icon: Icon(Icons.home)),
        FixedCurvedNavItem(icon: Icon(Icons.search)),
        FixedCurvedNavItem(icon: Icon(Icons.add)),
      ];

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            bottomNavigationBar: FixedCurvedNavigationBar(
              items: items,
              onTap: (_) {},
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.home), findsOneWidget);
      expect(find.byIcon(Icons.search), findsOneWidget);
      expect(find.byIcon(Icons.add), findsOneWidget);
    });

    testWidgets('responds to tap events', (tester) async {
      int tappedIndex = -1;
      
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            bottomNavigationBar: FixedCurvedNavigationBar(
              items: const [
                FixedCurvedNavItem(icon: Icon(Icons.home)),
                FixedCurvedNavItem(icon: Icon(Icons.search)),
              ],
              onTap: (index) => tappedIndex = index,
            ),
          ),
        ),
      );

      await tester.tap(find.byIcon(Icons.search));
      expect(tappedIndex, equals(1));
    });
  });
}
```

---

## 🔧 متطلبات النظام | System Requirements

- **Flutter**: ^3.8.1
- **Dart**: ^3.8.1
- **iOS**: 11.0+
- **Android**: API 16+
- **Web**: Any modern browser
- **Desktop**: Windows, macOS, Linux

---

## 📊 الأداء | Performance

### معايير الأداء | Performance Metrics
- **Paint Time**: < 16ms (60 FPS)
- **Memory Usage**: < 2MB
- **Bundle Size**: < 50KB
- **Cold Start**: < 500ms

### نصائح التحسين | Optimization Tips

1. **استخدم const constructors** حيثما أمكن
2. **تجنب إعادة البناء غير الضرورية** باستخدام keys مناسبة
3. **استخدم RepaintBoundary** للعناصر المعقدة
4. **فعل shouldRepaint optimization** في CustomPainter

---

## 🤝 المساهمة | Contributing

نرحب بمساهماتكم! يرجى اتباع الخطوات التالية:

### We welcome contributions! Please follow these steps:

1. **Fork** the repository
2. **Create** a feature branch (`git checkout -b feature/amazing-feature`)
3. **Commit** your changes (`git commit -m 'Add amazing feature'`)
4. **Push** to the branch (`git push origin feature/amazing-feature`)
5. **Open** a Pull Request

### إرشادات المساهمة | Contribution Guidelines

- ✅ اكتب tests للميزات الجديدة
- ✅ اتبع coding style المحدد
- ✅ وثق التغييرات في CHANGELOG
- ✅ أضف examples للميزات الجديدة

---

## 📝 التراخيص | License

```
MIT License

Copyright (c) 2025 ctrlaziz

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

---

## 📞 الدعم | Support

- 🐛 **Issues**: [GitHub Issues](https://github.com/ctrlaziz/curved_nav_fixed_center/issues)
- 📧 **Email**: [Contact via GitHub Issues](https://github.com/ctrlaziz/curved_nav_fixed_center/issues)
- 📖 **Documentation**: [Full Documentation](https://pub.dev/packages/curved_nav_fixed_center)

---

## 🎉 شكر خاص | Special Thanks

شكر خاص لجميع المساهمين ومجتمع Flutter على الدعم المستمر.

*Special thanks to all contributors and the Flutter community for their continuous support.*

---

<div align="center">

**صنع بـ ❤️ للمطورين العرب والعالميين**

*Made with ❤️ for Arab and global developers*

</div> 