import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/app_theme.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  void _launch(String url) async {
    await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 900;

    return Container(
      width: double.infinity,
      color: AppTheme.navyDark,
      child: Column(
        children: [
          // Top gradient divider
          Container(
            height: 1,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.transparent,
                  AppTheme.cyan,
                  AppTheme.gold,
                  Colors.transparent,
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isWide ? 80 : 24,
              vertical: 60,
            ),
            child: isWide
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(flex: 3, child: _FooterBrand()),
                      const SizedBox(width: 60),
                      Expanded(flex: 2, child: _FooterLinks()),
                      const SizedBox(width: 40),
                      Expanded(flex: 2, child: _FooterContact(launch: _launch)),
                    ],
                  )
                : Column(
                    children: [
                      _FooterBrand(),
                      const SizedBox(height: 40),
                      _FooterLinks(),
                      const SizedBox(height: 40),
                      _FooterContact(launch: _launch),
                    ],
                  ),
          ),
          Container(
            height: 1,
            color: AppTheme.cardBorder.withOpacity(0.5),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '© ${DateTime.now().year} Bashlaw Global Technologies LTD. All rights reserved.',
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    color: AppTheme.greyLight,
                  ),
                ),
                if (isWide)
                  Row(
                    children: [
                      _SocialBtn(
                        icon: Icons.link,
                        tooltip: 'LinkedIn',
                        onTap: () => _launch('https://linkedin.com/in/abdulsalam-bashir-aa2b18246  '
                            //'https://linkedin.com/company/bashlawglobal'
                            ),
                      ),
                      const SizedBox(width: 12),
                      _SocialBtn(
                        icon: Icons.alternate_email,
                        tooltip: 'Twitter/X',
                        onTap: () =>
                            _launch('https://x.com/Bash_Law_'),
                      ),
                      const SizedBox(width: 12),
                      _SocialBtn(
                        icon: Icons.chat_rounded,
                        tooltip: 'WhatsApp',
                        onTap: () => _launch(
                            'https://wa.me/2348000000000'),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _FooterBrand extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [AppTheme.cyan, AppTheme.cyanDark],
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  'BG',
                  style: GoogleFonts.rajdhani(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: AppTheme.navyDark,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 14),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
        const SizedBox(height: 20),
        Text(
          'Engineering Tomorrow\'s Digital Future. Your trusted partner in IT, Telecom, Cybersecurity, and Cloud Computing across Nigeria and beyond.',
          style: GoogleFonts.inter(
            fontSize: 13,
            color: AppTheme.greyLight,
            height: 1.7,
          ),
        ),
        const SizedBox(height: 20),
        Container(
          padding:
              const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            border: Border.all(
                color: AppTheme.gold.withOpacity(0.4)),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Text(
            'RC NO. 9342384 · CAC REGISTERED · NIGERIA',
            style: GoogleFonts.inter(
              fontSize: 11,
              color: AppTheme.gold,
              fontWeight: FontWeight.w600,
              letterSpacing: 1,
            ),
          ),
        ),
      ],
    );
  }
}

class _FooterLinks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final links = [
      'IT Solutions & Software',
      'Telecom Engineering',
      'Cybersecurity',
      'Cloud Computing',
      'Consultancy & Training',
      'Hardware & Software Supply',
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Services',
          style: GoogleFonts.rajdhani(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: AppTheme.white,
            letterSpacing: 1,
          ),
        ),
        const SizedBox(height: 20),
        ...links.map((l) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(                
                children: [
                  Container(
                    width: 4,
                    height: 4,
                    decoration: const BoxDecoration(
                      color: AppTheme.cyan,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    l,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.inter(
                      fontSize: 13,
                      color: AppTheme.greyLight,
                    ),
                  ),
                ],
              ),
            )),
      ],
    );
  }
}

class _FooterContact extends StatelessWidget {
  final Function(String) launch;
  const _FooterContact({required this.launch});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Contact',          
          style: GoogleFonts.rajdhani(            
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: AppTheme.white,
            letterSpacing: 1,
          ),
        ),
        const SizedBox(height: 20),
        _ContactItem(
            icon: Icons.location_on_rounded,
            text: 'Minna, Niger State, Nigeria',
            onTap: null),
        _ContactItem(
            icon: Icons.phone_rounded,
            text: '+234 703 419 1508',
            onTap: () => launch('tel:+2347034191508')),
        _ContactItem(
            icon: Icons.email_rounded,
            text: 'bashlawglobaltechnologies@gmail.com',
            onTap: () => launch('mailto:bashlawglobaltechnologies@gmail.com')),
        _ContactItem(
            icon: Icons.chat_rounded,
            text: 'WhatsApp: CEO / HR',
            onTap: () => launch(
                'https://wa.me/2347034191508')),
      ],
    );
  }
}

class _ContactItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback? onTap;
  const _ContactItem(
      {required this.icon, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 14),
        child: Row(
          children: [
            Icon(icon, color: AppTheme.cyan, size: 16),
            const SizedBox(width: 10),
            Text(
              text,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.inter(
                fontSize: 13,
                color: onTap != null
                    ? AppTheme.whiteOff
                    : AppTheme.greyLight,
                decoration: onTap != null
                    ? TextDecoration.none
                    : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SocialBtn extends StatefulWidget {
  final IconData icon;
  final String tooltip;
  final VoidCallback onTap;
  const _SocialBtn(
      {required this.icon, required this.tooltip, required this.onTap});

  @override
  State<_SocialBtn> createState() => _SocialBtnState();
}

class _SocialBtnState extends State<_SocialBtn> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: widget.tooltip,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() => _hovered = true),
        onExit: (_) => setState(() => _hovered = false),
        child: GestureDetector(
          onTap: widget.onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: _hovered
                  ? AppTheme.cyan.withOpacity(0.2)
                  : AppTheme.cardBg,
              border: Border.all(
                color: _hovered
                    ? AppTheme.cyan
                    : AppTheme.cardBorder,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(widget.icon,
                color: _hovered ? AppTheme.cyan : AppTheme.greyLight,
                size: 18),
          ),
        ),
      ),
    );
  }
}
