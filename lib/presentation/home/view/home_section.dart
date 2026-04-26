import 'dart:async';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:portfolio_app/core/constansts/image_manager.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/constansts/color_manger.dart';
import '../../../l10n/app_localizations.dart';
import 'pdf_view_screen.dart';

class HomeSection extends StatefulWidget {
  const HomeSection({super.key});

  @override
  State<HomeSection> createState() => _HomeSectionState();
}

class _HomeSectionState extends State<HomeSection> {
  List<String> _getRoles(AppLocalizations l10n) {
    return [l10n.homeRole1, l10n.homeRole2, l10n.homeRole3, l10n.homeRole4];
  }

  int _roleIndex = 0;
  String _currentText = "";
  int _charIndex = 0;
  bool _isDeleting = false;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTyping();
  }

  void _startTyping() {
    _timer = Timer.periodic(const Duration(milliseconds: 80), (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }

      // We fetch target text inside setState to access context safely

      setState(() {
        if (!mounted) return;
        final l10n = AppLocalizations.of(context)!;
        final roles = _getRoles(l10n);
        String targetText = roles[_roleIndex % roles.length];

        if (!_isDeleting) {
          if (_charIndex < targetText.length) {
            _charIndex++;
            _currentText = targetText.substring(0, _charIndex);
          } else {
            _isDeleting = true;
            timer.cancel();
            Future.delayed(const Duration(seconds: 2), () {
              if (mounted) _startTyping();
            });
            return;
          }
        } else {
          if (_charIndex > 0) {
            _charIndex--;
            _currentText = targetText.substring(0, _charIndex);
          } else {
            _isDeleting = false;
            _roleIndex = (_roleIndex + 1) % roles.length;
          }
        }
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  void _openResumePdf(BuildContext context) {
    if (kIsWeb) {
      // On web, open the asset PDF in a new browser tab
      launchUrl(Uri.parse('assets/files/md-rashedul-islam-resume.pdf'));
    } else {
      // On mobile/desktop, navigate to in-app PDF viewer
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const PdfViewScreen()),
      );
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
            horizontal: isMobile ? 20.0 : width * 0.08,
            vertical: 40.0,
          ),
          child: isMobile
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildProfileImage(isMobile, width),
                    const SizedBox(height: 30),
                    _buildTextContent(isMobile, l10n),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(flex: 3, child: _buildTextContent(isMobile, l10n)),
                    const SizedBox(width: 40),
                    Expanded(
                      flex: 2,
                      child: _buildProfileImage(isMobile, width),
                    ),
                  ],
                ),
        );
      },
    );
  }

  Widget _buildTextContent(bool isMobile, AppLocalizations l10n) {
    return Column(
      crossAxisAlignment: isMobile
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        Text(
          l10n.homeTitle,
          style: TextStyle(
            fontSize: isMobile ? 28 : 48,
            fontWeight: FontWeight.bold,
            color: ColorManager.whiteColor,
          ),
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
        ),
        const SizedBox(height: 12),
        Wrap(
          alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
          children: [
            Text(
              l10n.homeImA,
              style: TextStyle(
                fontSize: isMobile ? 20 : 28,
                fontWeight: FontWeight.w600,
                color: ColorManager.whiteColor,
              ),
            ),
            Text(
              _currentText,
              style: TextStyle(
                fontSize: isMobile ? 20 : 28,
                fontWeight: FontWeight.w600,
                color: ColorManager.primary,
              ),
            ),
            Text(
              "|",
              style: TextStyle(
                fontSize: isMobile ? 20 : 28,
                fontWeight: FontWeight.w300,
                color: ColorManager.primary,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Text(
          l10n.homeDesc,
          style: TextStyle(
            fontSize: isMobile ? 14 : 16,
            color: ColorManager.textSecondary,
            height: 1.7,
          ),
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
        ),
        const SizedBox(height: 30),
        Wrap(
          alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
          spacing: 12,
          runSpacing: 12,
          children: [
            ElevatedButton.icon(
              onPressed: () => _openResumePdf(context),
              icon: const Icon(Icons.download, size: 18),
              label: Text(l10n.downloadCv),
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorManager.primary,
                foregroundColor: ColorManager.background,
                padding: EdgeInsets.symmetric(
                  horizontal: isMobile ? 28 : 20,
                  vertical: isMobile ? 14 : 10,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                textStyle: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            _buildSocialIcon(
              Icons.code,
              'https://github.com/santorasu',
              'GitHub',
            ),
            _buildSocialIcon(
              Icons.business_center,
              'https://linkedin.com/in/md-rashedul-islam-diu',
              'LinkedIn',
            ),
            _buildSocialIcon(
              Icons.facebook,
              'https://fb.com/santorasu2003',
              'Facebook',
            ),
          ],
        ),
        const SizedBox(height: 30),
        // Stats row
        Wrap(
          alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
          spacing: 30,
          runSpacing: 16,
          children: [
            _buildStat("20+", l10n.statAppsBuilt),
            _buildStat("1+", l10n.statYearsPro),
            _buildStat("160+", l10n.statScreens),
            _buildStat("1st", l10n.statRank),
          ],
        ),
      ],
    );
  }

  Widget _buildStat(String number, String label) {
    return Column(
      children: [
        Text(
          number,
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: ColorManager.primary,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 13,
            color: ColorManager.textSecondary,
          ),
        ),
      ],
    );
  }

  Widget _buildProfileImage(bool isMobile, double screenWidth) {
    double size = isMobile
        ? (screenWidth * 0.55).clamp(180.0, 280.0)
        : (screenWidth * 0.22).clamp(250.0, 380.0);

    return Center(
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              ColorManager.primary.withValues(alpha: 0.3),
              ColorManager.secondBg,
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: ColorManager.primary.withValues(alpha: 0.25),
              blurRadius: 40,
              spreadRadius: 5,
            ),
          ],
        ),
        child: ClipOval(
          child: Container(
            margin: const EdgeInsets.all(4),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: ColorManager.secondBg,
            ),
            child: ClipOval(
              child: Image.asset(
                ImageManager.profile,
                width: size - 8,
                height: size - 8,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSocialIcon(IconData icon, String url, String tooltip) {
    return Tooltip(
      message: tooltip,
      child: InkWell(
        onTap: () => _launchUrl(url),
        borderRadius: BorderRadius.circular(50),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: ColorManager.primary, width: 2),
          ),
          child: Icon(icon, color: ColorManager.primary, size: 20),
        ),
      ),
    );
  }
}
