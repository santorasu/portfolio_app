import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/constansts/color_manger.dart';
import '../../../l10n/app_localizations.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

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
          child: isMobile
              ? Column(
                  children: [
                    _buildContactInfo(isMobile, l10n),
                    const SizedBox(height: 40),
                    _buildContactForm(isMobile, l10n),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: _buildContactInfo(isMobile, l10n)),
                    const SizedBox(width: 40),
                    Expanded(child: _buildContactForm(isMobile, l10n)),
                  ],
                ),
        );
      },
    );
  }

  Widget _buildContactInfo(bool isMobile, AppLocalizations l10n) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.contactHeader1,
          style: TextStyle(
            fontSize: isMobile ? 32 : 40,
            fontWeight: FontWeight.bold,
            color: ColorManager.whiteColor,
          ),
          textAlign: TextAlign.left,
        ),
        const SizedBox(height: 16),
        Text(
          l10n.contactDesc1,
          style: TextStyle(
            fontSize: 14,
            color: ColorManager.textSecondary,
            height: 1.6,
          ),
          textAlign: TextAlign.left,
        ),
        const SizedBox(height: 30),
        _buildContactDetail(
            Icons.phone, l10n.contactLabelPhone, "+880 1785-412308", "tel:+8801785412308"),
        _buildContactDetail(Icons.email, l10n.contactLabelEmail,
            "rashedul.cse.engineer@gmail.com", "mailto:rashedul.cse.engineer@gmail.com"),
        _buildContactDetail(
            Icons.location_on, l10n.contactLabelAddress, l10n.contactAddressVal, null),
        _buildContactDetail(Icons.language, l10n.contactLabelPortfolio,
            "rashedul-portfolio.netlify.app", "https://rashedul-portfolio.netlify.app"),
        const SizedBox(height: 24),
        // Social links row
        Wrap(
          alignment: WrapAlignment.start,
          spacing: 12,
          runSpacing: 12,
          children: [
            _buildSocialChip("LinkedIn", Icons.business_center,
                "https://linkedin.com/in/md-rashedul-islam-diu"),
            _buildSocialChip(
                "GitHub", Icons.code, "https://github.com/santorasu"),
            _buildSocialChip("Facebook", Icons.facebook,
                "https://fb.com/santorasu2003"),
            _buildSocialChip("YouTube", Icons.play_circle,
                "https://www.youtube.com/c/santorasu4140"),
          ],
        ),
      ],
    );
  }

  Widget _buildSocialChip(String label, IconData icon, String url) {
    return InkWell(
      onTap: () => _launchUrl(url),
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: ColorManager.secondBg,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: ColorManager.primary.withValues(alpha: 0.3)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: ColorManager.primary, size: 16),
            const SizedBox(width: 6),
            Text(label,
                style: const TextStyle(
                    color: ColorManager.whiteColor, fontSize: 13)),
          ],
        ),
      ),
    );
  }

  Widget _buildContactDetail(
      IconData icon, String title, String value, String? url) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: InkWell(
        onTap: url != null ? () => _launchUrl(url) : null,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: ColorManager.secondBg,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, color: ColorManager.primary, size: 24),
            ),
            const SizedBox(width: 16),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: const TextStyle(
                          color: ColorManager.primary, fontSize: 13)),
                  const SizedBox(height: 2),
                  Text(value,
                      style: const TextStyle(
                          color: ColorManager.whiteColor, fontSize: 14)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactForm(bool isMobile, AppLocalizations l10n) {
    return Container(
      padding: EdgeInsets.all(isMobile ? 20 : 30),
      decoration: BoxDecoration(
        color: ColorManager.secondBg,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Form(
        child: Column(
          children: [
            RichText(
              text: TextSpan(
                  text: l10n.contactFormHeader1,
                  style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: ColorManager.whiteColor),
                  children: [
                    TextSpan(
                        text: l10n.contactFormHeader2,
                        style: const TextStyle(color: ColorManager.primary))
                  ]),
            ),
            const SizedBox(height: 24),
            isMobile
                ? Column(
                    children: [
                      _buildTextField(l10n.contactHintName),
                      const SizedBox(height: 12),
                      _buildTextField(l10n.contactHintEmail),
                      const SizedBox(height: 12),
                      _buildTextField(l10n.contactHintPhone),
                      const SizedBox(height: 12),
                      _buildTextField(l10n.contactHintSubject),
                    ],
                  )
                : Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                              child: _buildTextField(l10n.contactHintName)),
                          const SizedBox(width: 12),
                          Expanded(
                              child: _buildTextField(l10n.contactHintEmail)),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Expanded(
                              child: _buildTextField(l10n.contactHintPhone)),
                          const SizedBox(width: 12),
                          Expanded(
                              child: _buildTextField(l10n.contactHintSubject)),
                        ],
                      ),
                    ],
                  ),
            const SizedBox(height: 12),
            _buildTextField(l10n.contactHintMessage, maxLines: 5),
            const SizedBox(height: 20),
            SizedBox(
               width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorManager.primary,
                  foregroundColor: ColorManager.background,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation: 0,
                ),
                child: Text(l10n.contactBtnSend,
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String hint, {int maxLines = 1}) {
    return TextFormField(
      maxLines: maxLines,
      style: const TextStyle(color: ColorManager.whiteColor, fontSize: 14),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle:
            TextStyle(color: ColorManager.whiteColor.withValues(alpha: 0.4)),
        filled: true,
        fillColor: ColorManager.background,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide:
              const BorderSide(color: ColorManager.primary, width: 2),
        ),
      ),
    );
  }
}
