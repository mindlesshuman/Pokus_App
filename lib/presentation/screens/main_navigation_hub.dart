import 'package:flutter/material.dart';
import 'package:pokus/core/constants/app_colors.dart';
import 'package:pokus/presentation/screens/home/home_screen.dart';
import 'package:pokus/presentation/screens/habits/habits_screen.dart';
import 'package:pokus/presentation/screens/commute/commute_screen.dart';
import 'package:pokus/presentation/screens/family/family_screen.dart';
import 'package:pokus/presentation/screens/insights/insights_screen.dart';

/// Root shell widget that hosts the bottom navigation bar and an
/// [IndexedStack] of the five primary screens.
class MainNavigationHub extends StatefulWidget {
  const MainNavigationHub({super.key});

  @override
  State<MainNavigationHub> createState() => _MainNavigationHubState();
}

class _MainNavigationHubState extends State<MainNavigationHub> {
  int _currentIndex = 0;

  static const List<Widget> _screens = [
    HomeScreen(),
    HabitsScreen(),
    CommuteScreen(),
    FamilyScreen(),
    InsightsScreen(),
  ];

  static const List<_NavItem> _navItems = [
    _NavItem(
      icon: Icons.home_outlined,
      activeIcon: Icons.home,
      label: 'Home',
    ),
    _NavItem(
      icon: Icons.check_box_outlined,
      activeIcon: Icons.check_box,
      label: 'Habits',
    ),
    _NavItem(
      icon: Icons.directions_car_outlined,
      activeIcon: Icons.directions_car,
      label: 'Commute',
    ),
    _NavItem(
      icon: Icons.people_outline,
      activeIcon: Icons.people,
      label: 'Family',
    ),
    _NavItem(
      icon: Icons.bar_chart_outlined,
      activeIcon: Icons.bar_chart,
      label: 'Insights',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) {
          setState(() => _currentIndex = index);
        },
        destinations: _navItems
            .map(
              (item) => NavigationDestination(
                icon: Icon(item.icon),
                selectedIcon: Icon(item.activeIcon),
                label: item.label,
              ),
            )
            .toList(),
      ),
    );
  }
}

/// Lightweight model for a single nav-bar item.
class _NavItem {
  const _NavItem({
    required this.icon,
    required this.activeIcon,
    required this.label,
  });

  final IconData icon;
  final IconData activeIcon;
  final String label;
}
