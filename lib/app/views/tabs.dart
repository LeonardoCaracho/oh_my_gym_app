import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oh_my_gym_app/core/core.dart';

class ScaffoldWithNestedNavigation extends StatelessWidget {
  const ScaffoldWithNestedNavigation({
    required this.navigationShell,
    Key? key,
  }) : super(
          key: key ?? const ValueKey('ScaffoldWithNestedNavigation'),
        );

  final StatefulNavigationShell navigationShell;

  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        indicatorColor: Colors.transparent,
        destinations: [
          NavigationDestination(
            label: 'Workouts',
            selectedIcon: Icon(
              Icons.home,
              color: AppColors.primary,
            ),
            icon: const Icon(Icons.home),
          ),
          NavigationDestination(
            label: 'Exercises',
            icon: const Icon(Icons.read_more),
            selectedIcon: Icon(
              Icons.read_more,
              color: AppColors.primary,
            ),
          ),
          NavigationDestination(
            label: 'Performance',
            icon: const Icon(Icons.add_chart_rounded),
            selectedIcon: Icon(
              Icons.add_chart_rounded,
              color: AppColors.primary,
            ),
          ),
          NavigationDestination(
            label: 'Settings',
            icon: const Icon(Icons.settings),
            selectedIcon: Icon(
              Icons.settings,
              color: AppColors.primary,
            ),
          ),
        ],
        onDestinationSelected: _goBranch,
      ),
    );
  }
}
