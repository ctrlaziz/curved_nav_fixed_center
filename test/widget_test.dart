import 'package:curved_nav_fixed_center/curved_nav_fixed_center.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('FixedCurvedNavigationBar Widget Tests', () {
    testWidgets('renders all navigation items correctly', (tester) async {
      const items = [
        FixedCurvedNavItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        FixedCurvedNavItem(
          icon: Icon(Icons.search),
          label: 'Search',
        ),
        FixedCurvedNavItem(
          icon: Icon(Icons.add),
        ),
        FixedCurvedNavItem(
          icon: Icon(Icons.notifications),
          label: 'Notifications',
        ),
        FixedCurvedNavItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
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

      // Verify all icons are rendered
      expect(find.byIcon(Icons.home), findsOneWidget);
      expect(find.byIcon(Icons.search), findsOneWidget);
      expect(find.byIcon(Icons.add), findsOneWidget);
      expect(find.byIcon(Icons.notifications), findsOneWidget);
      expect(find.byIcon(Icons.person), findsOneWidget);

      // Verify labels are rendered
      expect(find.text('Home'), findsOneWidget);
      expect(find.text('Search'), findsOneWidget);
      expect(find.text('Notifications'), findsOneWidget);
      expect(find.text('Profile'), findsOneWidget);
    });

    testWidgets('responds to tap events correctly', (tester) async {
      var tappedIndex = -1;
      
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
              onTap: (index) => tappedIndex = index,
            ),
          ),
        ),
      );

      // Tap on the search icon (index 1)
      await tester.tap(find.byIcon(Icons.search));
      await tester.pump();
      
      expect(tappedIndex, equals(1));

      // Tap on the add icon (index 2)
      await tester.tap(find.byIcon(Icons.add));
      await tester.pump();
      
      expect(tappedIndex, equals(2));
    });

    testWidgets('displays navigation items correctly', (tester) async {
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
              currentIndex: 1,
              onTap: (_) {},
            ),
          ),
        ),
      );

      // Check if all icons are present
      expect(find.byIcon(Icons.home), findsOneWidget);
      expect(find.byIcon(Icons.search), findsOneWidget);
      expect(find.byIcon(Icons.add), findsOneWidget);
    });

    testWidgets('changes current index correctly', (tester) async {
      var currentIndex = 0;
      
      const items = [
        FixedCurvedNavItem(
          icon: Icon(Icons.home_outlined),
          activeIcon: Icon(Icons.home),
        ),
        FixedCurvedNavItem(
          icon: Icon(Icons.search_outlined),
          activeIcon: Icon(Icons.search),
        ),
        FixedCurvedNavItem(icon: Icon(Icons.add)),
      ];

      await tester.pumpWidget(
        StatefulBuilder(
          builder: (context, setState) => MaterialApp(
              home: Scaffold(
                bottomNavigationBar: FixedCurvedNavigationBar(
                  items: items,
                  currentIndex: currentIndex,
                  onTap: (index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                ),
              ),
            ),
        ),
      );

      // Initially, home should be selected (filled version)
      // since currentIndex = 0
      expect(find.byIcon(Icons.home), findsOneWidget);
      expect(find.byIcon(Icons.search_outlined), findsOneWidget);

      // Find the InkWell widgets - should find at least 2
      final inkWells = find.byType(InkWell);
      expect(inkWells, findsWidgets); // Find any InkWells
      
      // Tap on the search icon directly
      await tester.tap(find.byIcon(Icons.search_outlined));
      await tester.pumpAndSettle();

      // Now search should be selected (filled version)
      expect(find.byIcon(Icons.search), findsOneWidget);
      expect(find.byIcon(Icons.home_outlined), findsOneWidget);
    });
  });

  group('FixedCurvedNavItem Tests', () {
    test('returns correct icon based on selection state', () {
      const item = FixedCurvedNavItem(
        icon: Icon(Icons.home_outlined),
        activeIcon: Icon(Icons.home),
      );

      // When not selected, should return regular icon
      final unselectedIcon = item.getIcon(isSelected: false);
      expect(unselectedIcon, equals(item.icon));

      // When selected, should return active icon
      final selectedIcon = item.getIcon(isSelected: true);
      expect(selectedIcon, equals(item.activeIcon));
    });

    test('returns regular icon when activeIcon is null', () {
      const item = FixedCurvedNavItem(
        icon: Icon(Icons.home),
      );

      // Should return regular icon for both states
      expect(item.getIcon(isSelected: false), equals(item.icon));
      expect(item.getIcon(isSelected: true), equals(item.icon));
    });

    test('returns effective semantic label correctly', () {
      const itemWithBoth = FixedCurvedNavItem(
        icon: Icon(Icons.home),
        label: 'Home',
        semanticLabel: 'Navigate to home',
      );
      expect(itemWithBoth.effectiveSemanticLabel, equals('Navigate to home'));

      const itemWithLabel = FixedCurvedNavItem(
        icon: Icon(Icons.home),
        label: 'Home',
      );
      expect(itemWithLabel.effectiveSemanticLabel, equals('Home'));

      const itemWithoutLabel = FixedCurvedNavItem(
        icon: Icon(Icons.home),
      );
      expect(itemWithoutLabel.effectiveSemanticLabel,
          equals('Navigation item'));
    });
  });

  group('FixedCurvedStyle Tests', () {
    test('copyWith returns modified style correctly', () {
      const originalStyle = FixedCurvedStyle(
        backgroundColor: Colors.blue,
        height: 70.0,
      );

      final modifiedStyle = originalStyle.copyWith(
        backgroundColor: Colors.red,
        curveHeight: 40.0,
      );

      expect(modifiedStyle.backgroundColor, equals(Colors.red));
      expect(modifiedStyle.curveHeight, equals(40.0));
      expect(modifiedStyle.height, equals(70.0)); // unchanged
    });

    test('fromTheme creates style from theme correctly', () {
      final theme = ThemeData(
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.purple,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
        ),
        colorScheme: const ColorScheme.light(
          secondary: Colors.orange,
          primary: Colors.blue,
        ),
      );

      final style = FixedCurvedStyle.fromTheme(theme);

      expect(style.backgroundColor, equals(Colors.purple));
      expect(style.selectedItemColor, equals(Colors.white));
      expect(style.unselectedItemColor, equals(Colors.grey));
      expect(style.centerBackgroundColor, equals(Colors.blue));
    });
  });
} 