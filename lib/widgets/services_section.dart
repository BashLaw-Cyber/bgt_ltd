import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';
import '../theme/app_theme.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 900;

    final services = [
      _ServiceData(
        icon: Icons.code_rounded,
        title: 'IT Solutions & Software Development',
        description:
            'End-to-end software development, system design, and digital transformation services tailored for modern enterprises. We build robust, scalable applications across web, mobile, and enterprise platforms.',
        tags: ['Software Dev', 'System Design', 'Digital Transformation'],
        accent: AppTheme.cyan,
      ),
      _ServiceData(
        icon: Icons.cell_tower_rounded,
        title: 'Telecommunication Engineering',
        description:
            'Expert installation, maintenance, and management of telecom infrastructure including fiber optics, wireless communication systems, networking systems, and cutting-edge telecom technologies.',
        tags: ['Fiber Optics', 'Wireless Comm', 'Networking', 'Telecom Infra'],
        accent: AppTheme.gold,
      ),
      _ServiceData(
        icon: Icons.security_rounded,
        title: 'Cybersecurity Services',
        description:
            'Comprehensive cybersecurity solutions to protect your digital assets. From threat assessment, penetration testing, to ongoing security monitoring and incident response.',
        tags: ['Threat Assessment', 'Pen Testing', 'Incident Response'],
        accent: const Color(0xFFFF6B6B),
      ),
      _ServiceData(
        icon: Icons.cloud_rounded,
        title: 'Cloud Computing',
        description:
            'Strategic cloud adoption, migration, and management services. We help businesses harness the power of AWS, Azure, and GCP for optimal performance, security, and cost efficiency.',
        tags: ['Cloud Migration', 'AWS/Azure/GCP', 'Cloud Management'],
        accent: const Color(0xFF7C6FF7),
      ),
      _ServiceData(
        icon: Icons.support_agent_rounded,
        title: 'Consultancy & Technical Support',
        description:
            'Professional IT and telecom consultancy, technical support, training, and advisory services to help your team and organisation achieve peak performance.',
        tags: ['IT Consulting', 'Training', 'Technical Support'],
        accent: const Color(0xFF4ECDC4),
      ),
      _ServiceData(
        icon: Icons.devices_rounded,
        title: 'Hardware & Software Systems',
        description:
            'Design, development, supply, and maintenance of hardware and software systems for commercial, governmental, and private organisations. From procurement to deployment and support.',
        tags: ['Hardware Supply', 'System Maintenance', 'Govt & Private'],
        accent: const Color(0xFFFF9F43),
      ),
    ];

    return Container(
      width: double.infinity,
      color: AppTheme.navyMid,
      padding: EdgeInsets.symmetric(
        horizontal: isWide ? 80 : 24,
        vertical: 100,
      ),
      child: Column(
        children: [
          FadeInDown(
            child: Column(
              children: [
                Text(
                  'WHAT WE DO',
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    color: AppTheme.cyan,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 4,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'Our Services',
                  style: GoogleFonts.rajdhani(
                    fontSize: isWide ? 52 : 36,
                    fontWeight: FontWeight.w700,
                    color: AppTheme.white,
                    letterSpacing: -0.5,
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: 520,
                  child: Text(
                    'From IT infrastructure to cybersecurity and telecom engineering — we deliver comprehensive technology solutions that drive business growth.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      fontSize: 15,
                      color: AppTheme.greyLight,
                      height: 1.7,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 64),
          LayoutBuilder(builder: (context, constraints) {
            final crossAxis = constraints.maxWidth > 900 ? 3 : (constraints.maxWidth > 600 ? 2 : 1);
            return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxis,
                mainAxisSpacing: 24,
                crossAxisSpacing: 24,
                childAspectRatio: crossAxis == 1 ? 1.4 : 0.85,
              ),
              itemCount: services.length,
              itemBuilder: (context, i) => FadeInUp(
                delay: Duration(milliseconds: 100 * i),
                child: _ServiceCard(data: services[i]),
              ),
            );
          }),
        ],
      ),
    );
  }
}

class _ServiceData {
  final IconData icon;
  final String title;
  final String description;
  final List<String> tags;
  final Color accent;

  const _ServiceData({
    required this.icon,
    required this.title,
    required this.description,
    required this.tags,
    required this.accent,
  });
}

class _ServiceCard extends StatefulWidget {
  final _ServiceData data;
  const _ServiceCard({required this.data});

  @override
  State<_ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<_ServiceCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: const EdgeInsets.all(28),
        decoration: BoxDecoration(
          color: _hovered ? AppTheme.cardBg : AppTheme.navyLight.withOpacity(0.4),
          border: Border.all(
            color: _hovered
                ? widget.data.accent.withOpacity(0.5)
                : AppTheme.cardBorder.withOpacity(0.5),
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(16),
          boxShadow: _hovered
              ? [
                  BoxShadow(
                    color: widget.data.accent.withOpacity(0.12),
                    blurRadius: 30,
                    spreadRadius: 0,
                    offset: const Offset(0, 8),
                  )
                ]
              : [],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: widget.data.accent.withOpacity(_hovered ? 0.2 : 0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(widget.data.icon,
                  color: widget.data.accent, size: 28),
            ),
            const SizedBox(height: 20),
            Text(
              widget.data.title,
              style: GoogleFonts.rajdhani(
                fontSize: 19,
                fontWeight: FontWeight.w700,
                color: AppTheme.white,
                height: 1.2,
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: Text(
                widget.data.description,
                style: GoogleFonts.inter(
                  fontSize: 13,
                  color: AppTheme.greyLight,
                  height: 1.7,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: widget.data.tags
                  .map((tag) => Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: widget.data.accent.withOpacity(0.08),
                          border: Border.all(
                            color: widget.data.accent.withOpacity(0.25),
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          tag,
                          style: GoogleFonts.inter(
                            fontSize: 11,
                            color: widget.data.accent,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.3,
                          ),
                        ),
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
