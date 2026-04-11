import 'package:flutter/material.dart';
import '../../../core/constansts/color_manger.dart';
import '../../../l10n/app_localizations.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  List<Map<String, dynamic>> _getServices(AppLocalizations l10n) {
    return [
      {
        "title": l10n.serviceTitle1,
        "icon": Icons.phone_android,
        "desc": l10n.serviceDesc1
      },
      {
        "title": l10n.serviceTitle2,
        "icon": Icons.account_tree,
        "desc": l10n.serviceDesc2
      },
      {
        "title": l10n.serviceTitle3,
        "icon": Icons.cloud_sync,
        "desc": l10n.serviceDesc3
      },
      {
        "title": l10n.serviceTitle4,
        "icon": Icons.map,
        "desc": l10n.serviceDesc4
      },
      {
        "title": l10n.serviceTitle5,
        "icon": Icons.payment,
        "desc": l10n.serviceDesc5
      },
      {
        "title": l10n.serviceTitle6,
        "icon": Icons.auto_awesome,
        "desc": l10n.serviceDesc6
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        bool isMobile = width <= 600;
        bool isTablet = width > 600 && width <= 1024;

        int crossAxisCount = isMobile ? 1 : (isTablet ? 2 : 3);
        double childAspectRatio = isMobile ? 2.0 : (isTablet ? 1.3 : 1.1);

        final l10n = AppLocalizations.of(context)!;
        final servicesList = _getServices(l10n);

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
                    text: l10n.servicesHeader1,
                    style: const TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: ColorManager.whiteColor),
                    children: [
                      TextSpan(
                        text: l10n.servicesHeader2,
                        style: const TextStyle(color: ColorManager.primary),
                      ),
                    ]),
              ),
              const SizedBox(height: 12),
              Text(
                l10n.servicesSubtitle,
                style: const TextStyle(
                  fontSize: 16,
                  color: ColorManager.textSecondary,
                ),
              ),
              const SizedBox(height: 40),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: childAspectRatio,
                ),
                itemCount: servicesList.length,
                itemBuilder: (context, index) {
                  return _ServiceCard(service: servicesList[index]);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

class _ServiceCard extends StatefulWidget {
  final Map<String, dynamic> service;
  const _ServiceCard({required this.service});

  @override
  State<_ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<_ServiceCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.all(22),
        decoration: BoxDecoration(
          color: ColorManager.secondBg,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: _isHovered ? ColorManager.primary : ColorManager.secondBg,
            width: 2,
          ),
          boxShadow: _isHovered
              ? [
                  BoxShadow(
                    color: ColorManager.primary.withValues(alpha: 0.15),
                    blurRadius: 20,
                    spreadRadius: 2,
                  )
                ]
              : [],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  child: Icon(
                    widget.service['icon'],
                    size: 36,
                    color: _isHovered
                        ? ColorManager.primary
                        : ColorManager.whiteColor,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: _isHovered
                        ? ColorManager.primary
                        : ColorManager.whiteColor,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.arrow_forward,
                      size: 16, color: ColorManager.background),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              widget.service['title'],
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: _isHovered
                    ? ColorManager.primary
                    : ColorManager.whiteColor,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Text(
                widget.service['desc'],
                style: const TextStyle(
                  fontSize: 13,
                  color: ColorManager.textSecondary,
                  height: 1.5,
                ),
                overflow: TextOverflow.fade,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
