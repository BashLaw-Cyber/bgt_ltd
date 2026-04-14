import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';
import '../theme/app_theme.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 900;

    return Container(
      width: double.infinity,
      color: AppTheme.navyDark,
      padding: EdgeInsets.symmetric(
        horizontal: isWide ? 80 : 24,
        vertical: 100,
      ),
      child: isWide
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex: 5, child: _LeftContent()),
                const SizedBox(width: 80),
                Expanded(flex: 4, child: _RightContent()),
              ],
            )
          : Column(
              children: [
                _LeftContent(),
                const SizedBox(height: 48),
                _RightContent(),
              ],
            ),
    );
  }
}

class _LeftContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      duration: const Duration(milliseconds: 700),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'WHO WE ARE',
            style: GoogleFonts.inter(
              fontSize: 12,
              color: AppTheme.cyan,
              fontWeight: FontWeight.w700,
              letterSpacing: 4,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'About Bashlaw\nGlobal Technologies',
            style: GoogleFonts.rajdhani(
              fontSize: 44,
              fontWeight: FontWeight.w700,
              color: AppTheme.white,
              height: 1.05,
              letterSpacing: -0.5,
            ),
          ),
          const SizedBox(height: 24),
          Container(
            width: 60,
            height: 3,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [AppTheme.cyan, AppTheme.gold],
              ),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 28),
          Text(
            'Bashlaw Global Technologies LTD is a forward-thinking technology company registered in Nigeria, dedicated to delivering world-class information technology and telecommunication solutions to businesses, governmental bodies, and private organisations.',
            style: GoogleFonts.inter(
              fontSize: 15,
              color: AppTheme.whiteOff.withOpacity(0.85),
              height: 1.8,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'We combine deep technical expertise with an understanding of the unique business environment in Nigeria and across Africa — helping organisations unlock their full digital potential through innovative, reliable, and cost-effective solutions.',
            style: GoogleFonts.inter(
              fontSize: 15,
              color: AppTheme.greyLight,
              height: 1.8,
            ),
          ),
          const SizedBox(height: 40),
          _ValuePill(icon: Icons.verified_rounded, label: 'CAC Registered — RC No. 9342384', color: AppTheme.cyan),
          const SizedBox(height: 12),
          _ValuePill(icon: Icons.location_on_rounded, label: 'Headquartered in Abuja, Nigeria', color: AppTheme.gold),
          const SizedBox(height: 12),
          _ValuePill(icon: Icons.public_rounded, label: 'Serving Nigeria & Beyond', color: const Color(0xFF7C6FF7)),
        ],
      ),
    );
  }
}

class _ValuePill extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  const _ValuePill({required this.icon, required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: color, size: 18),
        ),
        const SizedBox(width: 14),
        Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 14,
            color: AppTheme.whiteOff,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class _RightContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final objectives = [
      'Information Technology Solutions & Software Development',
      'Telecommunication Engineering (Installation, Maintenance & Management)',
      'Cybersecurity Services & Cloud Computing',
      'Consultancy, Training & Advisory Services in IT & Telecom',
      'Hardware & Software Design, Supply & Maintenance',
      'Digital Transformation Services for all sectors',
    ];

    return FadeInRight(
      duration: const Duration(milliseconds: 700),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(
              color: AppTheme.cardBg,
              border: Border.all(color: AppTheme.cardBorder, width: 1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Company Objectives',
                  style: GoogleFonts.rajdhani(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: AppTheme.white,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Our core areas of operation:',
                  style: GoogleFonts.inter(
                    fontSize: 13,
                    color: AppTheme.greyLight,
                  ),
                ),
                const SizedBox(height: 24),
                ...objectives.asMap().entries.map(
                      (e) => Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 2),
                              width: 24,
                              height: 24,
                              decoration: BoxDecoration(
                                color: AppTheme.cyan.withOpacity(0.12),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Center(
                                child: Text(
                                  String.fromCharCode(65 + e.key),
                                  style: GoogleFonts.rajdhani(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w800,
                                    color: AppTheme.cyan,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                e.value,
                                style: GoogleFonts.inter(
                                  fontSize: 13,
                                  color: AppTheme.whiteOff.withOpacity(0.85),
                                  height: 1.6,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
