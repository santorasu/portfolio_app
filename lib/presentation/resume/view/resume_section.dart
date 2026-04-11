import 'package:flutter/material.dart';
import '../../../core/constansts/color_manger.dart';
import '../../../l10n/app_localizations.dart';

class ResumeSection extends StatefulWidget {
  const ResumeSection({super.key});

  @override
  State<ResumeSection> createState() => _ResumeSectionState();
}

class _ResumeSectionState extends State<ResumeSection> {
  int _activeTabIndex = 0;

  List<String> _getTabs(AppLocalizations l10n) {
    return [
      l10n.resumeTabExperience,
      l10n.resumeTabEducation,
      l10n.resumeTabSkills,
      l10n.resumeTabAboutMe
    ];
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        bool isMobile = width <= 800;

        return SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 16.0 : width * 0.06,
            vertical: 40.0,
          ),
          child: isMobile
              ? Column(
                  children: [
                    _buildLeftSide(isMobile, AppLocalizations.of(context)!),
                    const SizedBox(height: 30),
                    _buildRightSide(isMobile, AppLocalizations.of(context)!),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 280,
                      child: _buildLeftSide(isMobile, AppLocalizations.of(context)!),
                    ),
                    const SizedBox(width: 40),
                    Expanded(child: _buildRightSide(isMobile, AppLocalizations.of(context)!)),
                  ],
                ),
        );
      },
    );
  }

  Widget _buildLeftSide(bool isMobile, AppLocalizations l10n) {
    final tabs = _getTabs(l10n);
    return Column(
      crossAxisAlignment:
          isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Text(
          l10n.resumeHeader1,
          style: const TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            color: ColorManager.whiteColor,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          l10n.resumeDesc1,
          style: const TextStyle(
            fontSize: 14,
            color: ColorManager.textSecondary,
            height: 1.6,
          ),
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
        ),
        const SizedBox(height: 24),
        isMobile
            ? Wrap(
                spacing: 10,
                runSpacing: 10,
                alignment: WrapAlignment.center,
                children: List.generate(tabs.length, (index) => _buildTabButton(index, tabs)),
              )
            : Column(
                children: List.generate(tabs.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: _buildTabButton(index, tabs),
                  );
                }),
              ),
      ],
    );
  }

  Widget _buildTabButton(int index, List<String> tabs) {
    bool isActive = _activeTabIndex == index;
    return SizedBox(
      width: 260,
      height: 48,
      child: ElevatedButton(
        onPressed: () => setState(() => _activeTabIndex = index),
        style: ElevatedButton.styleFrom(
          backgroundColor:
              isActive ? ColorManager.primary : ColorManager.secondBg,
          foregroundColor:
              isActive ? ColorManager.background : ColorManager.whiteColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(
              color: isActive ? ColorManager.primary : ColorManager.secondBg,
              width: 2,
            ),
          ),
          elevation: 0,
        ),
        child: Text(
          tabs[index],
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

  Widget _buildRightSide(bool isMobile, AppLocalizations l10n) {
    switch (_activeTabIndex) {
      case 0:
        return _buildExperienceTab(isMobile, l10n);
      case 1:
        return _buildEducationTab(isMobile, l10n);
      case 2:
        return _buildSkillsTab(isMobile, l10n);
      case 3:
        return _buildAboutMeTab(isMobile, l10n);
      default:
        return const SizedBox();
    }
  }

  // ─── Experience ─────────────────────────────────────────
  Widget _buildExperienceTab(bool isMobile, AppLocalizations l10n) {
    final items = [
      {
        "year": "July 2024 – April 2025",
        "title": "Flutter Developer",
        "company": "Softvence Delta",
        "desc":
            "Developed and delivered 20+ Flutter applications including client-based production apps. Converted business requirements into scalable, user-friendly mobile solutions. Worked with Google Maps, Geolocation, Riverpod, GetX, and Clean Architecture."
      },
    ];
    return _buildCardList(l10n.resumeMyExperience1, l10n.resumeMyExperience2,
        l10n.resumeMyExperienceDesc,
        items, isMobile);
  }

  // ─── Education ──────────────────────────────────────────
  Widget _buildEducationTab(bool isMobile, AppLocalizations l10n) {
    final items = [
      {
        "year": "2024",
        "title": "App Dev with Flutter (Batch-9)",
        "company": "Ostad — Ranked 1st Position 🥇",
        "desc":
            "Intensive Flutter & Dart course covering Clean Architecture, Riverpod, REST APIs, Firebase, and production app development."
      },
      {
        "year": "2021 – 2025",
        "title": "BSc in Computer Science & Engineering",
        "company": "Daffodil International University",
        "desc":
            "Core studies in software engineering, data structures, algorithms, mobile development, and database management."
      },
      {
        "year": "2018 – 2020",
        "title": "Higher Secondary Certificate",
        "company": "Santhia Govt. Degree College",
        "desc":
            "Completed HSC with a focus on science, building a strong foundation for a career in technology."
      },
    ];
    return _buildCardList(l10n.resumeMyEducation1, l10n.resumeMyEducation2,
        l10n.resumeMyEducationDesc, items, isMobile);
  }

  Widget _buildCardList(String titleWord1, String titleWord2, String subtitle,
      List<Map<String, String>> items, bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
              text: '$titleWord1 ',
              style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: ColorManager.whiteColor),
              children: [
                TextSpan(
                    text: titleWord2,
                    style: const TextStyle(color: ColorManager.primary)),
              ]),
        ),
        const SizedBox(height: 8),
        Text(subtitle,
            style: const TextStyle(
                fontSize: 14, color: ColorManager.textSecondary)),
        const SizedBox(height: 20),
        ...items.map((item) => _buildResumeCard(item)),
      ],
    );
  }

  Widget _buildResumeCard(Map<String, String> item) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: ColorManager.secondBg,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(item['year']!,
              style: const TextStyle(
                  color: ColorManager.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 14)),
          const SizedBox(height: 8),
          Text(item['title']!,
              style: const TextStyle(
                  fontSize: 18,
                  color: ColorManager.whiteColor,
                  fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Row(
            children: [
              Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                      color: ColorManager.primary, shape: BoxShape.circle)),
              const SizedBox(width: 10),
              Flexible(
                  child: Text(item['company']!,
                      style: const TextStyle(
                          color: ColorManager.subtitleText, fontSize: 14))),
            ],
          ),
          const SizedBox(height: 12),
          Text(item['desc']!,
              style: TextStyle(
                  color: ColorManager.textSecondary, fontSize: 13, height: 1.5)),
        ],
      ),
    );
  }

  // ─── Skills ─────────────────────────────────────────────
  Widget _buildSkillsTab(bool isMobile, AppLocalizations l10n) {
    final skillCategories = [
      {
        "category": "Core",
        "skills": ["Flutter", "Dart", "Android", "iOS", "Web"]
      },
      {
        "category": "State Mgmt",
        "skills": ["Riverpod", "GetX", "Provider", "Bloc"]
      },
      {
        "category": "Architecture",
        "skills": ["Clean Arch", "MVVM", "MVP", "Repository"]
      },
      {
        "category": "Backend",
        "skills": ["Firebase", "REST API", "Dio", "JWT", "Socket.io"]
      },
      {
        "category": "Tools",
        "skills": ["Git", "GitHub", "VS Code", "Android Studio", "Postman", "FVM"]
      },
      {
        "category": "Other",
        "skills": ["Google Maps", "Stripe", "Hive", "OCR", "ML Kit", "FCM"]
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
              text: l10n.resumeMySkills1,
              style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: ColorManager.whiteColor),
              children: [
                TextSpan(
                    text: l10n.resumeMySkills2,
                    style: const TextStyle(color: ColorManager.primary))
              ]),
        ),
        const SizedBox(height: 8),
        Text(
          l10n.resumeMySkillsDesc,
          style: const TextStyle(fontSize: 14, color: ColorManager.textSecondary),
        ),
        const SizedBox(height: 24),
        ...skillCategories.map((cat) => _buildSkillCategory(
            cat['category'] as String, cat['skills'] as List<String>)),
      ],
    );
  }

  Widget _buildSkillCategory(String category, List<String> skills) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            category,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: ColorManager.primary,
            ),
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: skills.map((skill) {
              return Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                decoration: BoxDecoration(
                  color: ColorManager.secondBg,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                      color: ColorManager.secondBg, width: 1),
                ),
                child: Text(
                  skill,
                  style: const TextStyle(
                      color: ColorManager.whiteColor, fontSize: 13),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  // ─── About Me ───────────────────────────────────────────
  Widget _buildAboutMeTab(bool isMobile, AppLocalizations l10n) {
    final details = [
      {"label": l10n.resumeAboutLabelName, "value": "Md. Rashedul Islam"},
      {"label": l10n.resumeAboutLabelRole, "value": "Flutter Developer"},
      {"label": l10n.resumeAboutLabelExp, "value": l10n.resumeAboutValExp},
      {"label": l10n.resumeAboutLabelCompany, "value": l10n.resumeAboutValCompany},
      {"label": l10n.resumeAboutLabelLocation, "value": l10n.resumeAboutValLocation},
      {"label": l10n.resumeAboutLabelNationality, "value": l10n.resumeAboutValNationality},
      {"label": l10n.resumeAboutLabelPhone, "value": "+880 1785-412308"},
      {"label": l10n.resumeAboutLabelEmail, "value": "rashedul.cse.engineer@gmail.com"},
      {"label": l10n.resumeAboutLabelPortfolio, "value": "rashedul-portfolio.netlify.app"},
      {"label": l10n.resumeAboutLabelAvailability, "value": l10n.resumeAboutValAvailability},
      {"label": l10n.resumeAboutLabelLanguages, "value": l10n.resumeAboutValLanguages},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
              text: l10n.resumeAboutMe1,
              style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: ColorManager.whiteColor),
              children: [
                TextSpan(
                    text: l10n.resumeAboutMe2,
                    style: const TextStyle(color: ColorManager.primary))
              ]),
        ),
        const SizedBox(height: 8),
        Text(
          l10n.resumeAboutMeDesc,
          style: const TextStyle(fontSize: 14, color: ColorManager.textSecondary),
        ),
        const SizedBox(height: 20),
        ...details.map((detail) {
          return Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            margin: const EdgeInsets.only(bottom: 8),
            decoration: BoxDecoration(
              color: ColorManager.secondBg,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Wrap(
              spacing: 8,
              children: [
                Text(
                  "${detail['label']}:",
                  style: const TextStyle(
                      color: ColorManager.primary,
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  detail['value']!,
                  style: const TextStyle(
                      color: ColorManager.whiteColor, fontSize: 14),
                ),
              ],
            ),
          );
        }),
      ],
    );
  }
}
