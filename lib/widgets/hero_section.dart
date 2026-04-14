import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/app_theme.dart';

class HeroSection extends StatefulWidget {
  final VoidCallback onContactPressed;
  final VoidCallback onServicesPressed;

  const HeroSection({
    super.key,
    required this.onContactPressed,
    required this.onServicesPressed,
  });

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _pulseController;
  late Animation<double> _pulseAnim;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);
    _pulseAnim =
        Tween<double>(begin: 0.5, end: 1.0).animate(_pulseController);
  }

  @override
  void dispose() {
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isWide = size.width > 900;

    return Container(
      width: double.infinity,
      constraints: BoxConstraints(minHeight: size.height),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppTheme.navyDark,
            Color(0xFF041428),
            AppTheme.navyMid,
          ],
        ),
      ),
      child: Stack(
        children: [
          // Animated grid background
          Positioned.fill(child: _GridBackground(anim: _pulseAnim)),
          // Cyan glow orb
          Positioned(
            right: -100,
            top: 100,
            child: AnimatedBuilder(
              animation: _pulseAnim,
              builder: (_, __) => Container(
                width: 500,
                height: 500,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: AppTheme.cyan
                          .withOpacity(0.04 * _pulseAnim.value),
                      blurRadius: 200,
                      spreadRadius: 80,
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Gold orb bottom left
          Positioned(
            left: -80,
            bottom: 50,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: AppTheme.gold.withOpacity(0.05),
                    blurRadius: 150,
                    spreadRadius: 50,
                  ),
                ],
              ),
            ),
          ),
          // Main content
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isWide ? 80 : 24,
                vertical: 120,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: isWide
                    ? CrossAxisAlignment.start
                    : CrossAxisAlignment.center,
                children: [
                  FadeInDown(
                    duration: const Duration(milliseconds: 600),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: AppTheme.cyan.withOpacity(0.4), width: 1),
                        borderRadius: BorderRadius.circular(30),
                        color: AppTheme.cyan.withOpacity(0.06),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 8,
                            height: 8,
                            decoration: const BoxDecoration(
                              color: AppTheme.cyan,
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            'RC NO. 9342384 · CAC REGISTERED · NIGERIA',
                            style: GoogleFonts.inter(
                              fontSize: 11,
                              color: AppTheme.cyan,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  FadeInDown(
                    delay: const Duration(milliseconds: 200),
                    duration: const Duration(milliseconds: 700),
                    child: Text(
                      'Engineering\nTomorrow\'s\nDigital Future',
                      textAlign:
                          isWide ? TextAlign.left : TextAlign.center,
                      style: GoogleFonts.rajdhani(
                        fontSize: isWide ? 78 : 48,
                        fontWeight: FontWeight.w800,
                        color: AppTheme.white,
                        height: 0.95,
                        letterSpacing: -1,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  FadeInDown(
                    delay: const Duration(milliseconds: 300),
                    child: Text(
                      'BASHLAW GLOBAL TECHNOLOGIES LTD',
                      textAlign:
                          isWide ? TextAlign.left : TextAlign.center,
                      style: GoogleFonts.rajdhani(
                        fontSize: isWide ? 22 : 16,
                        fontWeight: FontWeight.w500,
                        color: AppTheme.gold,
                        letterSpacing: 4,
                      ),
                    ),
                  ),
                  const SizedBox(height: 28),
                  FadeInUp(
                    delay: const Duration(milliseconds: 400),
                    child: SizedBox(
                      width: isWide ? 560 : double.infinity,
                      child: Text(
                        'Your trusted partner in Information Technology, Telecommunication Engineering, Cybersecurity, Cloud Computing, and Digital Transformation — delivering excellence to commercial, governmental and private organisations across Nigeria and beyond.',
                        textAlign:
                            isWide ? TextAlign.left : TextAlign.center,
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          color: AppTheme.whiteOff.withOpacity(0.8),
                          height: 1.8,
                          letterSpacing: 0.2,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 48),
                  FadeInUp(
                    delay: const Duration(milliseconds: 500),
                    child: Wrap(
                      spacing: 16,
                      runSpacing: 16,
                      alignment: isWide
                          ? WrapAlignment.start
                          : WrapAlignment.center,
                      children: [
                        _HeroButton(
                          label: 'Explore Services',
                          isPrimary: true,
                          onTap: widget.onServicesPressed,
                        ),
                        _HeroButton(
                          label: 'Contact Us',
                          isPrimary: false,
                          onTap: widget.onContactPressed,
                        ),
                        _WhatsAppButton(
                          label: 'Chat on WhatsApp',
                          onTap: () async {
                            await launchUrl(
                              Uri.parse(AppConstants.whatsappCEO),
                              mode: LaunchMode.externalApplication,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 72),
                  FadeInUp(
                    delay: const Duration(milliseconds: 600),
                    child: _StatsRow(isWide: isWide),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _GridBackground extends StatelessWidget {
  final Animation<double> anim;
  const _GridBackground({required this.anim});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: anim,
      builder: (_, __) => CustomPaint(
        painter: _GridPainter(opacity: anim.value * 0.06),
      ),
    );
  }
}

class _GridPainter extends CustomPainter {
  final double opacity;
  _GridPainter({required this.opacity});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppTheme.cyan.withOpacity(opacity)
      ..strokeWidth = 0.5;
    const step = 60.0;
    for (double x = 0; x < size.width; x += step) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }
    for (double y = 0; y < size.height; y += step) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(_GridPainter old) => old.opacity != opacity;
}

class _HeroButton extends StatefulWidget {
  final String label;
  final bool isPrimary;
  final VoidCallback onTap;
  const _HeroButton(
      {required this.label, required this.isPrimary, required this.onTap});

  @override
  State<_HeroButton> createState() => _HeroButtonState();
}

class _HeroButtonState extends State<_HeroButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding:
              const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          decoration: BoxDecoration(
            gradient: widget.isPrimary
                ? LinearGradient(
                    colors: _hovered
                        ? [AppTheme.gold, AppTheme.goldLight]
                        : [AppTheme.cyan, AppTheme.cyanDark],
                  )
                : null,
            border: widget.isPrimary
                ? null
                : Border.all(
                    color: _hovered
                        ? AppTheme.white
                        : AppTheme.whiteOff.withOpacity(0.4),
                    width: 1.5,
                  ),
            borderRadius: BorderRadius.circular(8),
            boxShadow: widget.isPrimary && _hovered
                ? [
                    BoxShadow(
                      color: AppTheme.cyan.withOpacity(0.4),
                      blurRadius: 24,
                      spreadRadius: 0,
                    )
                  ]
                : [],
          ),
          child: Text(
            widget.label,
            style: GoogleFonts.rajdhani(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: widget.isPrimary ? AppTheme.navyDark : AppTheme.white,
              letterSpacing: 1,
            ),
          ),
        ),
      ),
    );
  }
}

class _WhatsAppButton extends StatefulWidget {
  final String label;
  final VoidCallback onTap;
  const _WhatsAppButton({required this.label, required this.onTap});

  @override
  State<_WhatsAppButton> createState() => _WhatsAppButtonState();
}

class _WhatsAppButtonState extends State<_WhatsAppButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding:
              const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          decoration: BoxDecoration(
            color: _hovered
                ? const Color(0xFF25D366)
                : const Color(0xFF25D366).withOpacity(0.12),
            border: Border.all(
              color: const Color(0xFF25D366).withOpacity(0.6),
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.chat_bubble_outline,
                size: 16,
                color: _hovered
                    ? AppTheme.white
                    : const Color(0xFF25D366),
              ),
              const SizedBox(width: 8),
              Text(
                widget.label,
                style: GoogleFonts.rajdhani(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: _hovered
                      ? AppTheme.white
                      : const Color(0xFF25D366),
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StatsRow extends StatelessWidget {
  final bool isWide;
  const _StatsRow({required this.isWide});

  @override
  Widget build(BuildContext context) {
    final stats = [
      ('IT Solutions', 'Full-Stack'),
      ('Telecom', 'Engineering'),
      ('Cybersecurity', 'Services'),
      ('Cloud', 'Computing'),
    ];
    return Wrap(
      spacing: isWide ? 48 : 24,
      runSpacing: 20,
      alignment: isWide ? WrapAlignment.start : WrapAlignment.center,
      children: stats
          .map((s) => Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    s.$1,
                    style: GoogleFonts.rajdhani(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: AppTheme.cyan,
                    ),
                  ),
                  Text(
                    s.$2,
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      color: AppTheme.greyLight,
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              ))
          .toList(),
    );
  }
}

class AppConstants {
  static const String whatsappCEO =
      'https://wa.me/2348000000000?text=Hello%2C%20I%20would%20like%20to%20enquire%20about%20Bashlaw%20Global%20Technologies.';
}
