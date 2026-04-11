import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/constansts/color_manger.dart';
import '../../../l10n/app_localizations.dart';
import '../viewmodel/bottom_nav_provider.dart';

class BottomNavBarScreen extends ConsumerWidget {
  const BottomNavBarScreen({super.key});

  /// List of screens for bottom navigation
  static const List<Widget> _screens = [
    Scaffold(body: Center(child: Text('Home'),),),
    Scaffold(body: Center(child: Text('Home'),),),
    Scaffold(body: Center(child: Text('Home'),),),
    Scaffold(body: Center(child: Text('Home'),),),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(bottomNavIndexProvider);
    final l10n = AppLocalizations.of(context)!;

    final navItems = [
      BottomNavigationBarItem(
        icon: const Icon(Icons.home_outlined),
        activeIcon: const Icon(Icons.home),
        label: l10n.home,
      ),
      BottomNavigationBarItem(
        icon: const Icon(Icons.search_outlined),
        activeIcon: const Icon(Icons.search),
        label: l10n.search,
      ),
      BottomNavigationBarItem(
        icon: const Icon(Icons.favorite_outline),
        activeIcon: const Icon(Icons.favorite),
        label: l10n.favorites,
      ),
      BottomNavigationBarItem(
        icon: const Icon(Icons.person_outline),
        activeIcon: const Icon(Icons.person),
        label: l10n.profile,
      ),
    ];

    return Scaffold(
      body: IndexedStack(index: currentIndex, children: _screens),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: ColorManager.shadowColor,
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            ref.read(bottomNavIndexProvider.notifier).setIndex(index);
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: ColorManager.whiteColor,
          selectedItemColor: ColorManager.primary,
          unselectedItemColor: ColorManager.textSecondary,
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 12,
          ),
          unselectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 12,
          ),
          elevation: 0,
          items: navItems,
        ),
      ),
    );
  }
}
