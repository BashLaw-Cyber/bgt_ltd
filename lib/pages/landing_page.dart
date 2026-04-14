import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/navbar.dart';
import '../widgets/hero_section.dart';
import '../widgets/services_section.dart';
import '../widgets/about_section.dart';
import '../widgets/contact_section.dart';
import '../widgets/footer_section.dart';
import '../theme/app_theme.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final ScrollController _scrollController = ScrollController();

  final GlobalKey _homeKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _servicesKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollTo(GlobalKey key) {
    final ctx = key.currentContext;
    if (ctx != null) {
      Scrollable.ensureVisible(
        ctx,
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.navyDark,
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                // Spacer for fixed navbar
                SizedBox(
                  key: _homeKey,
                  height: 0,
                ),
                HeroSection(
                  onContactPressed: () => _scrollTo(_contactKey),
                  onServicesPressed: () => _scrollTo(_servicesKey),
                ),
                SizedBox(key: _aboutKey, height: 0),
                const AboutSection(),
                SizedBox(key: _servicesKey, height: 0),
                const ServicesSection(),
                SizedBox(key: _contactKey, height: 0),
                const ContactSection(),
                const FooterSection(),
              ],
            ),
          ),
          // Fixed NavBar overlay
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: NavBar(
              scrollController: _scrollController,
              onHomePressed: () => _scrollTo(_homeKey),
              onAboutPressed: () => _scrollTo(_aboutKey),
              onServicesPressed: () => _scrollTo(_servicesKey),
              onContactPressed: () => _scrollTo(_contactKey),
            ),
          ),
          // Floating WhatsApp button
          Positioned(
            bottom: 32,
            right: 32,
            child: _FloatingWhatsApp(),
          ),
          // Floating call button
          Positioned(
            bottom: 96,
            right: 32,
            child: _FloatingCall(),
          ),
        ],
      ),
    );
  }
}

class _FloatingWhatsApp extends StatefulWidget {
  @override
  State<_FloatingWhatsApp> createState() => _FloatingWhatsAppState();
}

class _FloatingWhatsAppState extends State<_FloatingWhatsApp>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late Animation<double> _scale;
  bool _hovered = false;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat(reverse: true);
    _scale = Tween<double>(begin: 1.0, end: 1.1).animate(
      CurvedAnimation(parent: _ctrl, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) {
        setState(() => _hovered = true);
        _ctrl.stop();
      },
      onExit: (_) {
        setState(() => _hovered = false);
        _ctrl.repeat(reverse: true);
      },
      child: GestureDetector(
        onTap: () => launchUrl(
          Uri.parse(AppConstants.whatsappCEO),
          mode: LaunchMode.externalApplication,
        ),
        child: AnimatedBuilder(
          animation: _scale,
          builder: (_, child) => Transform.scale(
            scale: _hovered ? 1.1 : _scale.value,
            child: child,
          ),
          child: Tooltip(
            message: 'Chat on WhatsApp',
            child: Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: const Color(0xFF25D366),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF25D366).withOpacity(0.5),
                    blurRadius: 20,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: const Icon(Icons.chat_rounded,
                  color: Colors.white, size: 26),
            ),
          ),
        ),
      ),
    );
  }
}

class _FloatingCall extends StatefulWidget {
  @override
  State<_FloatingCall> createState() => _FloatingCallState();
}

class _FloatingCallState extends State<_FloatingCall> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: () => launchUrl(
          Uri.parse('tel:+2347034191508'),
          mode: LaunchMode.externalApplication,
        ),
        child: Tooltip(
          message: 'Call Us',
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: _hovered
                  ? AppTheme.cyan
                  : AppTheme.navyLight,
              shape: BoxShape.circle,
              border: Border.all(color: AppTheme.cyan, width: 1.5),
              boxShadow: [
                BoxShadow(
                  color: AppTheme.cyan.withOpacity(0.3),
                  blurRadius: 16,
                ),
              ],
            ),
            child: Icon(
              Icons.phone_rounded,
              color: _hovered ? AppTheme.navyDark : AppTheme.cyan,
              size: 22,
            ),
          ),
        ),
      ),
    );
  }
}

class AppConstants {
  static const String whatsappCEO =
      'https://wa.me/2347034191508?text=Hello%2C%20I%20would%20like%20to%20enquire%20about%20Bashlaw%20Global%20Technologies.';
}
