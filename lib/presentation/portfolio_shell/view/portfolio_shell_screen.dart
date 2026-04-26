import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/constansts/color_manger.dart';
import '../../../l10n/app_localizations.dart';
import '../../../main.dart';
import '../viewmodel/portfolio_shell_provider.dart';
import '../../home/view/home_section.dart';
import '../../services/view/services_section.dart';
import '../../resume/view/resume_section.dart';
import '../../portfolio_projects/view/portfolio_section.dart';
import '../../contact/view/contact_section.dart';

class PortfolioShellScreen extends ConsumerWidget {
  const PortfolioShellScreen({super.key});

  static const List<Widget> _sections = [
    HomeSection(),
    ServicesSection(),
    ResumeSection(),
    PortfolioSection(),
    ContactSection(),
  ];

  List<String> _getSectionNames(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return [
      l10n.home,
      l10n.services,
      l10n.resume,
      l10n.portfolio,
      l10n.contact,
    ];
  }

  static const List<IconData> _sectionIcons = [
    Icons.home_outlined,
    Icons.miscellaneous_services_outlined,
    Icons.folder_shared_outlined,
    Icons.work_outline,
    Icons.contact_mail_outlined,
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(portfolioNavIndexProvider);
    final locale = ref.watch(localeProvider);

    return LayoutBuilder(
      builder: (context, constraints) {
        bool isWeb = constraints.maxWidth > 800;

        return Scaffold(
          backgroundColor: ColorManager.background,
          appBar: isWeb
              ? _buildWebAppBar(context, ref, currentIndex, locale)
              : _buildMobileAppBar(ref, locale),
          drawer: isWeb ? null : _buildMobileDrawer(context, ref, currentIndex),
          body: IndexedStack(index: currentIndex, children: _sections),
          bottomNavigationBar: isWeb
              ? null
              : _buildBottomNavigationBar(context, ref, currentIndex),
        );
      },
    );
  }

  // ─── Language toggle button ─────────────────────────────
  Widget _buildLanguageToggle(
    WidgetRef ref,
    Locale locale, {
    bool isMobile = false,
  }) {
    return Tooltip(
      message: locale.languageCode == 'en'
          ? 'Switch to বাংলা'
          : 'Switch to English',
      child: GestureDetector(
        onTap: () => ref.read(localeProvider.notifier).toggleLocale(),

        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 6 : 12,
            vertical: isMobile ? 2 : 6,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: ColorManager.primary,
              width: isMobile ? 1.0 : 1.5,
            ),
            borderRadius: BorderRadius.circular(isMobile ? 14 : 20),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.language,
                color: ColorManager.primary,
                size: isMobile ? 14 : 18,
              ),
              SizedBox(width: isMobile ? 4 : 6),
              Text(
                locale.languageCode == 'en' ? 'BN' : 'EN',
                style: TextStyle(
                  color: ColorManager.primary,
                  fontSize: isMobile ? 11 : 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ─── Web AppBar ─────────────────────────────────────────
  PreferredSizeWidget _buildWebAppBar(
    BuildContext context,
    WidgetRef ref,
    int currentIndex,
    Locale locale,
  ) {
    return AppBar(
      backgroundColor: ColorManager.background,
      elevation: 0,
      toolbarHeight: 64,
      title: Row(
        children: [
          const SizedBox(width: 20),
          InkWell(
            onTap: () =>
                ref.read(portfolioNavIndexProvider.notifier).setIndex(0),
            child: const Text(
              'Rashedul.',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: ColorManager.whiteColor,
              ),
            ),
          ),
          const Spacer(),
          ...List.generate(_getSectionNames(context).length, (index) {
            bool isActive = currentIndex == index;
            final sectionNames = _getSectionNames(context);
            return InkWell(
              onTap: () =>
                  ref.read(portfolioNavIndexProvider.notifier).setIndex(index),
              borderRadius: BorderRadius.circular(8),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: Text(
                  sectionNames[index],
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
                    color: isActive
                        ? ColorManager.primary
                        : ColorManager.whiteColor,
                  ),
                ),
              ),
            );
          }),
          const SizedBox(width: 16),
          _buildLanguageToggle(ref, locale, isMobile: false),
          const SizedBox(width: 20),
        ],
      ),
    );
  }

  // ─── Mobile AppBar ──────────────────────────────────────
  PreferredSizeWidget _buildMobileAppBar(WidgetRef ref, Locale locale) {
    return AppBar(
      backgroundColor: ColorManager.background,
      elevation: 0,
      title: const Text(
        'Rashedul.',
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: ColorManager.whiteColor,
        ),
      ),
      iconTheme: const IconThemeData(color: ColorManager.whiteColor),
      actions: [
        Center(
          child: Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: _buildLanguageToggle(ref, locale, isMobile: true),
          ),
        ),
      ],
    );
  }

  // ─── Drawer ─────────────────────────────────────────────
  Widget _buildMobileDrawer(
    BuildContext context,
    WidgetRef ref,
    int currentIndex,
  ) {
    return Drawer(
      backgroundColor: ColorManager.background,
      child: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 32),
            const Text(
              'Rashedul.',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: ColorManager.whiteColor,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Flutter Developer',
              style: TextStyle(fontSize: 14, color: ColorManager.primary),
            ),
            const SizedBox(height: 32),
            const Divider(color: ColorManager.borderColor),
            ...List.generate(_getSectionNames(context).length, (index) {
              bool isActive = currentIndex == index;
              final sectionNames = _getSectionNames(context);
              return ListTile(
                leading: Icon(
                  _sectionIcons[index],
                  color: isActive
                      ? ColorManager.primary
                      : ColorManager.whiteColor,
                  size: 22,
                ),
                title: Text(
                  sectionNames[index],
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
                    color: isActive
                        ? ColorManager.primary
                        : ColorManager.whiteColor,
                  ),
                ),
                selected: isActive,
                selectedTileColor: ColorManager.primary.withValues(alpha: 0.1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                onTap: () {
                  ref.read(portfolioNavIndexProvider.notifier).setIndex(index);
                  Navigator.of(context).pop();
                },
              );
            }),
          ],
        ),
      ),
    );
  }

  // ─── Bottom Nav ─────────────────────────────────────────
  Widget _buildBottomNavigationBar(
    BuildContext context,
    WidgetRef ref,
    int currentIndex,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: ColorManager.background,
        border: Border(top: BorderSide(color: ColorManager.secondBg, width: 1)),
      ),
      child: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          ref.read(portfolioNavIndexProvider.notifier).setIndex(index);
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: ColorManager.background,
        selectedItemColor: ColorManager.primary,
        unselectedItemColor: ColorManager.textSecondary,
        selectedFontSize: 11,
        unselectedFontSize: 11,
        elevation: 0,
        items: List.generate(_getSectionNames(context).length, (i) {
          final sectionNames = _getSectionNames(context);
          return BottomNavigationBarItem(
            icon: Icon(_sectionIcons[i]),
            label: sectionNames[i],
          );
        }),
      ),
    );
  }
}
