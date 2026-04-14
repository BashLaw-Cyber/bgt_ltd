import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';

class NavBar extends StatefulWidget {
  final ScrollController scrollController;
  final VoidCallback onHomePressed;
  final VoidCallback onAboutPressed;
  final VoidCallback onServicesPressed;
  final VoidCallback onContactPressed;

  const NavBar({
    super.key,
    required this.scrollController,
    required this.onHomePressed,
    required this.onAboutPressed,
    required this.onServicesPressed,
    required this.onContactPressed,
  });

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  bool _scrolled = false;

  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (widget.scrollController.offset > 50 && !_scrolled) {
      setState(() => _scrolled = true);
    } else if (widget.scrollController.offset <= 50 && _scrolled) {
      setState(() => _scrolled = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 900;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
      decoration: BoxDecoration(
        color: _scrolled
            ? AppTheme.navyDark.withOpacity(0.97)
            : Colors.transparent,
        border: _scrolled
            ? Border(
                bottom: BorderSide(
                  color: AppTheme.cyan.withOpacity(0.15),
                  width: 1,
                ),
              )
            : null,
        boxShadow: _scrolled
            ? [
                BoxShadow(
                  color: Colors.black.withOpacity(0.4),
                  blurRadius: 20,
                  offset: const Offset(0, 4),
                ),
              ]
            : [],
      ),
      child: Row(
        children: [
          // Logo
          GestureDetector(
            onTap: widget.onHomePressed,
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [AppTheme.cyan, AppTheme.cyanDark],
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      'BG',
                      style: GoogleFonts.rajdhani(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                        color: AppTheme.navyDark,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'BASHLAW',
                      style: GoogleFonts.rajdhani(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: AppTheme.white,
                        letterSpacing: 3,
                      ),
                    ),
                    Text(
                      'GLOBAL TECHNOLOGIES',
                      style: GoogleFonts.inter(
                        fontSize: 8,
                        fontWeight: FontWeight.w500,
                        color: AppTheme.cyan,
                        letterSpacing: 2,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Spacer(),
          if (isWide) ...[
            _NavLink('Home', widget.onHomePressed),
            _NavLink('About', widget.onAboutPressed),
            _NavLink('Services', widget.onServicesPressed),
            _NavLink('Contact', widget.onContactPressed),
            const SizedBox(width: 20),
            _CTAButton(onTap: widget.onContactPressed),
          ] else
            _MobileMenuButton(
              onHome: widget.onHomePressed,
              onAbout: widget.onAboutPressed,
              onServices: widget.onServicesPressed,
              onContact: widget.onContactPressed,
            ),
        ],
      ),
    );
  }
}

class _NavLink extends StatefulWidget {
  final String label;
  final VoidCallback onTap;
  const _NavLink(this.label, this.onTap);

  @override
  State<_NavLink> createState() => _NavLinkState();
}

class _NavLinkState extends State<_NavLink> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.label,
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: _hovered ? AppTheme.cyan : AppTheme.whiteOff,
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: 2),
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                height: 2,
                width: _hovered ? 20 : 0,
                decoration: BoxDecoration(
                  color: AppTheme.cyan,
                  borderRadius: BorderRadius.circular(1),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CTAButton extends StatefulWidget {
  final VoidCallback onTap;
  const _CTAButton({required this.onTap});

  @override
  State<_CTAButton> createState() => _CTAButtonState();
}

class _CTAButtonState extends State<_CTAButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
          decoration: BoxDecoration(
            color: _hovered ? AppTheme.cyan : Colors.transparent,
            border: Border.all(color: AppTheme.cyan, width: 1.5),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Text(
            'Get In Touch',
            style: GoogleFonts.rajdhani(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: _hovered ? AppTheme.navyDark : AppTheme.cyan,
              letterSpacing: 1,
            ),
          ),
        ),
      ),
    );
  }
}

class _MobileMenuButton extends StatefulWidget {
  final VoidCallback onHome;
  final VoidCallback onAbout;
  final VoidCallback onServices;
  final VoidCallback onContact;
  const _MobileMenuButton(
      {required this.onHome,
      required this.onAbout,
      required this.onServices,
      required this.onContact});

  @override
  State<_MobileMenuButton> createState() => _MobileMenuButtonState();
}

class _MobileMenuButtonState extends State<_MobileMenuButton> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      color: AppTheme.navyLight,
      icon: const Icon(Icons.menu, color: AppTheme.white),
      onSelected: (val) {
        switch (val) {
          case 'home':
            widget.onHome();
            break;
          case 'about':
            widget.onAbout();
            break;
          case 'services':
            widget.onServices();
            break;
          case 'contact':
            widget.onContact();
            break;
        }
      },
      itemBuilder: (_) => [
        _popItem('home', 'Home'),
        _popItem('about', 'About'),
        _popItem('services', 'Services'),
        _popItem('contact', 'Contact'),
      ],
    );
  }

  PopupMenuItem<String> _popItem(String val, String label) {
    return PopupMenuItem(
      value: val,
      child: Text(
        label,
        style: GoogleFonts.inter(color: AppTheme.white, fontSize: 14),
      ),
    );
  }
}
