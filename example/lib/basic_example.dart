import 'package:flutter/material.dart';
import 'package:curved_nav_fixed_center/curved_nav_fixed_center.dart';

/// Basic example demonstrating simple usage of FixedCurvedNavigationBar
class BasicExample extends StatefulWidget {
  const BasicExample({super.key});

  @override
  State<BasicExample> createState() => _BasicExampleState();
}

class _BasicExampleState extends State<BasicExample> {
  int _currentIndex = 0;

  final List<FixedCurvedNavItem> _navItems = const [
    FixedCurvedNavItem(
      icon: Icon(Icons.home_outlined),
      activeIcon: Icon(Icons.home),
      label: 'Home',
      semanticLabel: 'Navigate to home page',
    ),
    FixedCurvedNavItem(
      icon: Icon(Icons.search_outlined),
      activeIcon: Icon(Icons.search),
      label: 'Search',
      semanticLabel: 'Search for items',
    ),
    FixedCurvedNavItem(
      icon: Icon(Icons.add, size: 32),
      semanticLabel: 'Add new item',
      backgroundColor: Colors.amber,
    ),
    FixedCurvedNavItem(
      icon: Icon(Icons.favorite_border),
      activeIcon: Icon(Icons.favorite),
      label: 'Favorites',
      semanticLabel: 'View favorite items',
    ),
    FixedCurvedNavItem(
      icon: Icon(Icons.person_outline),
      activeIcon: Icon(Icons.person),
      label: 'Profile',
      semanticLabel: 'View user profile',
    ),
  ];

  final List<Widget> _pages = const [
    _PageContent(
      title: 'Home',
      icon: Icons.home,
      color: Colors.blue,
      description: 'Welcome to the home page',
    ),
    _PageContent(
      title: 'Search',
      icon: Icons.search,
      color: Colors.green,
      description: 'Search for anything you need',
    ),
    _PageContent(
      title: 'Add New',
      icon: Icons.add_circle,
      color: Colors.orange,
      description: 'Create something new',
    ),
    _PageContent(
      title: 'Favorites',
      icon: Icons.favorite,
      color: Colors.red,
      description: 'Your favorite items',
    ),
    _PageContent(
      title: 'Profile',
      icon: Icons.person,
      color: Colors.purple,
      description: 'Manage your profile',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Basic Example'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: FixedCurvedNavigationBar(
        items: _navItems,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        style: FixedCurvedStyle(
          backgroundColor: const Color(0xFF45319F),
          selectedItemColor: Colors.white,
          unselectedItemColor: const Color(0x99FFFFFF),
          activeColor: const Color(0xFFF7BF2D),
          borderRadius: BorderRadius.circular(20),
          curveHeight: 70.0, // More pronounced curve
          curveWidth: 200.0, // Wider curve for better visibility
          // Add circular background for center button
          showCenterBackground: true,
          centerBackgroundColor: const Color(0xFFF7BF2D),
          height: 125, // Total height (for clipping and safe area)
          navigationBarHeight: 90, // Background height (smaller to allow center button protrusion)
          centerBackgroundSize: 90.0, // تحكم بحجم دائرة الزر الأوسط
          boxShadow: const [
            BoxShadow(
              color: Color(0x26000000),
              blurRadius: 10,
              offset: Offset(0, -2),
            ),
          ],
        ),
      ),
    );
  }
}

class _PageContent extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final String description;

  const _PageContent({
    required this.title,
    required this.icon,
    required this.color,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 80,
              color: color,
            ),
            const SizedBox(height: 24),
            Text(
              title,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              description,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 32),
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Features Demonstrated:',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    const _FeatureItem(
                      icon: Icons.check_circle,
                      text: 'Fixed center curve position',
                    ),
                    const _FeatureItem(
                      icon: Icons.check_circle,
                      text: 'Smooth animations',
                    ),
                    const _FeatureItem(
                      icon: Icons.check_circle,
                      text: 'Active/inactive icon states',
                    ),
                    const _FeatureItem(
                      icon: Icons.check_circle,
                      text: 'Accessibility support',
                    ),
                    const _FeatureItem(
                      icon: Icons.check_circle,
                      text: 'Circular background for center button',
                    ),
                    const _FeatureItem(
                      icon: Icons.check_circle,
                      text: 'Custom active color for selected items',
                    ),
                    const _FeatureItem(
                      icon: Icons.check_circle,
                      text: 'Adjustable center button circle size',
                    ),
                    const _FeatureItem(
                      icon: Icons.check_circle,
                      text: 'Separate navigation bar height control',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FeatureItem extends StatelessWidget {
  final IconData icon;
  final String text;

  const _FeatureItem({
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Icon(
            icon,
            size: 16,
            color: Colors.green,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }
} 