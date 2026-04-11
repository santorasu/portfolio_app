import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/constansts/color_manger.dart';
import '../../../l10n/app_localizations.dart';

class PortfolioSection extends StatefulWidget {
  const PortfolioSection({super.key});

  @override
  State<PortfolioSection> createState() => _PortfolioSectionState();
}

class _PortfolioSectionState extends State<PortfolioSection> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  List<Map<String, dynamic>> _getProjects(AppLocalizations l10n) {
    return [
      {
        "numb": "01",
        "title": l10n.portfolioProject1Title,
        "desc": l10n.portfolioProject1Desc,
        "tech": "Flutter, Riverpod, Firebase, Google Maps, Stripe",
        "icon": Icons.local_shipping,
      },
      {
        "numb": "02",
        "title": l10n.portfolioProject2Title,
        "desc": l10n.portfolioProject2Desc,
        "tech": "Flutter, Riverpod, Clean Architecture, REST API, ML Kit",
        "icon": Icons.restaurant,
      },
      {
        "numb": "03",
        "title": l10n.portfolioProject3Title,
        "desc": l10n.portfolioProject3Desc,
        "tech": "Flutter, Socket.io, Firebase, JWT Auth",
        "icon": Icons.menu_book,
      },
      {
        "numb": "04",
        "title": l10n.portfolioProject4Title,
        "desc": l10n.portfolioProject4Desc,
        "tech": "Flutter, Riverpod, GoRouter, Stripe, Hive, AI Chatbot",
        "icon": Icons.food_bank,
      },
    ];
  }

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        bool isMobile = width <= 800;

        final l10n = AppLocalizations.of(context)!;
        return SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 16.0 : width * 0.06,
            vertical: 40.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    text: l10n.portfolioHeader1,
                    style: const TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: ColorManager.whiteColor),
                    children: [
                      TextSpan(
                        text: l10n.portfolioHeader2,
                        style: const TextStyle(color: ColorManager.primary),
                      ),
                    ]),
              ),
              const SizedBox(height: 8),
              Text(
                l10n.portfolioSubtitle,
                style: const TextStyle(
                    fontSize: 16, color: ColorManager.textSecondary),
              ),
              const SizedBox(height: 40),
              isMobile
                  ? Column(
                      children: [
                        _buildCarousel(isMobile, l10n),
                        const SizedBox(height: 30),
                        _buildProjectDetails(isMobile, l10n),
                      ],
                    )
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            flex: 5,
                            child: _buildProjectDetails(isMobile, l10n)),
                        const SizedBox(width: 40),
                        Expanded(
                            flex: 5, child: _buildCarousel(isMobile, l10n)),
                      ],
                    ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildProjectDetails(bool isMobile, AppLocalizations l10n) {
    final projects = _getProjects(l10n);
    final project = projects[_currentIndex];
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: Column(
        key: ValueKey(_currentIndex),
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            project['numb'],
            style: TextStyle(
              fontSize: isMobile ? 60 : 80,
              fontWeight: FontWeight.bold,
              color: ColorManager.whiteColor.withValues(alpha: 0.15),
              height: 1,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            project['title'],
            style: TextStyle(
                fontSize: isMobile ? 24 : 30,
                fontWeight: FontWeight.bold,
                color: ColorManager.whiteColor),
          ),
          const SizedBox(height: 16),
          Text(
            project['desc'],
            style: TextStyle(
                fontSize: isMobile ? 13 : 15,
                color: ColorManager.textSecondary,
                height: 1.6),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children:
                (project['tech'] as String).split(', ').map((tech) {
              return Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: ColorManager.primary.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                      color: ColorManager.primary.withValues(alpha: 0.4)),
                ),
                child: Text(
                  tech,
                  style: const TextStyle(
                      fontSize: 12, color: ColorManager.primary),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              _buildActionChip(Icons.code, "GitHub", () {
                _launchUrl('https://github.com/santorasu');
              }),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionChip(
      IconData icon, String label, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(30),
      child: Container(
        padding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: ColorManager.secondBg,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: ColorManager.whiteColor, size: 18),
            const SizedBox(width: 8),
            Text(label,
                style: const TextStyle(
                    color: ColorManager.whiteColor, fontSize: 14)),
          ],
        ),
      ),
    );
  }

  Widget _buildCarousel(bool isMobile, AppLocalizations l10n) {
    final projects = _getProjects(l10n);
    return Column(
      children: [
        Container(
          height: isMobile ? 250 : 350,
          width: double.infinity,
          decoration: BoxDecoration(
            color: ColorManager.secondBg,
            borderRadius: BorderRadius.circular(16),
          ),
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() => _currentIndex = index);
            },
            itemCount: projects.length,
            itemBuilder: (context, index) {
              final project = projects[index];
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(project['icon'] as IconData,
                        size: 80,
                        color: ColorManager.primary
                            .withValues(alpha: 0.4)),
                    const SizedBox(height: 16),
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 24),
                      child: Text(
                        project['title'],
                        style: TextStyle(
                          fontSize: 16,
                          color: ColorManager.whiteColor
                              .withValues(alpha: 0.5),
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 16),
        // Pagination dots + arrows
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: _currentIndex > 0
                  ? () => _pageController.previousPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut)
                  : null,
              icon: Icon(
                Icons.chevron_left,
                color: _currentIndex > 0
                    ? ColorManager.primary
                    : ColorManager.textSecondary,
                size: 32,
              ),
            ),
            const SizedBox(width: 8),
            ...List.generate(projects.length, (i) {
              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: _currentIndex == i ? 28 : 10,
                height: 10,
                decoration: BoxDecoration(
                  color: _currentIndex == i
                      ? ColorManager.primary
                      : ColorManager.secondBg,
                  borderRadius: BorderRadius.circular(5),
                ),
              );
            }),
            const SizedBox(width: 8),
            IconButton(
              onPressed: _currentIndex < projects.length - 1
                  ? () => _pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut)
                  : null,
              icon: Icon(
                Icons.chevron_right,
                color: _currentIndex < projects.length - 1
                    ? ColorManager.primary
                    : ColorManager.textSecondary,
                size: 32,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
