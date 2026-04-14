import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/app_theme.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 900;

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
                  'GET IN TOUCH',
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    color: AppTheme.cyan,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 4,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'Contact Us',
                  style: GoogleFonts.rajdhani(
                    fontSize: isWide ? 52 : 36,
                    fontWeight: FontWeight.w700,
                    color: AppTheme.white,
                    letterSpacing: -0.5,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Ready to transform your business? Reach out to our team today.',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    fontSize: 15,
                    color: AppTheme.greyLight,
                    height: 1.7,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 64),
          // Quick Contact Cards
          LayoutBuilder(builder: (context, constraints) {
            final cols = constraints.maxWidth > 700 ? 3 : 1;
            return GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: cols,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              childAspectRatio: cols == 1 ? 3.5 : 1.3,
              children: [
                FadeInUp(
                  delay: const Duration(milliseconds: 100),
                  child: _ContactCard(
                    icon: Icons.phone_rounded,
                    title: 'Call Us',
                    subtitle: '+234 703 419 1508',
                    accent: AppTheme.cyan,
                    onTap: () => _launch('tel:+2347034191508'),
                  ),
                ),
                FadeInUp(
                  delay: const Duration(milliseconds: 200),
                  child: _ContactCard(
                    icon: Icons.email_rounded,
                    title: 'Email Us',
                    subtitle: 'bashlawglobaltechnologies@gmail.com',
                    accent: AppTheme.gold,
                    onTap: () =>
                        _launch('mailto:bashlawglobaltechnologies@gmail.com'),
                  ),
                ),
                FadeInUp(
                  delay: const Duration(milliseconds: 300),
                  child: _ContactCard(
                    icon: Icons.location_on_rounded,
                    title: 'Our Office',
                    subtitle: 'Minna, Niger State, Nigeria',
                    accent: const Color(0xFF7C6FF7),
                    onTap: () => _launch(
                        'https://maps.google.com/?q=Minna+Niger+State+Nigeria'),
                  ),
                ),
              ],
            );
          }),
          const SizedBox(height: 48),
          // WhatsApp section
          FadeInUp(
            delay: const Duration(milliseconds: 300),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(36),
              decoration: BoxDecoration(
                color: AppTheme.cardBg,
                border: Border.all(
                    color: const Color(0xFF25D366).withOpacity(0.3)),
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppTheme.cardBg,
                    const Color(0xFF25D366).withOpacity(0.05),
                  ],
                ),
              ),
              child: isWide
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        _WhatsAppIcon(),
                        const SizedBox(width: 32),
                        Expanded(child: _WhatsAppText()),
                        const SizedBox(width: 32),
                        SizedBox(width: 180, child: _WhatsAppButtons()),
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _WhatsAppIcon(),
                        const SizedBox(height: 20),
                        _WhatsAppText(),
                        const SizedBox(height: 24),
                        _WhatsAppButtons(),
                      ],
                    ),
            ),
          ),
          const SizedBox(height: 48),
          // Contact form
          FadeInUp(
            delay: const Duration(milliseconds: 400),
            child: _ContactForm(isWide: isWide),
          ),
        ],
      ),
    );
  }

  void _launch(String url) async {
    await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
  }
}

class _ContactCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color accent;
  final VoidCallback onTap;
  const _ContactCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.accent,
    required this.onTap,
  });

  @override
  State<_ContactCard> createState() => _ContactCardState();
}

class _ContactCardState extends State<_ContactCard> {
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
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color:
                _hovered ? AppTheme.navyLight : AppTheme.cardBg,
            border: Border.all(
              color: _hovered
                  ? widget.accent.withOpacity(0.5)
                  : AppTheme.cardBorder,
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
             mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: widget.accent.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(widget.icon,
                    color: widget.accent, size: 26),
              ),
              const SizedBox(height: 10),
              Flexible(
                child: Text(
                  widget.title,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.rajdhani(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: AppTheme.white,
                  ),
                ),
              ),
              const SizedBox(height: 6),
              Flexible(
                child: Text(
                  widget.subtitle,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    fontSize: 13,
                    color: AppTheme.greyLight,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _WhatsAppIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 72,
      height: 72,
      decoration: BoxDecoration(
        color: const Color(0xFF25D366).withOpacity(0.15),
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Icon(
        Icons.chat_rounded,
        color: Color(0xFF25D366),
        size: 36,
      ),
    );
  }
}

class _WhatsAppText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Chat With Us on WhatsApp',
          style: GoogleFonts.rajdhani(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: AppTheme.white,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Reach our CEO or HR directly on WhatsApp for quick enquiries, partnership opportunities, or career information.',
          style: GoogleFonts.inter(
            fontSize: 14,
            color: AppTheme.greyLight,
            height: 1.6,
          ),
        ),
      ],
    );
  }
}

class _WhatsAppButtons extends StatelessWidget {
  void _launch(String url) async {
    await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _WABtn(
          label: 'Chat with CEO',
          onTap: () => _launch(
              'https://wa.me/2347034191508?text=Hello%20CEO%2C%20I%20am%20reaching%20out%20regarding%20Bashlaw%20Global%20Technologies.'),
        ),
        const SizedBox(height: 12),
        _WABtn(
          label: 'Chat with HR',
          onTap: () => _launch(
              'https://wa.me/2348050219269?text=Hello%2C%20I%20am%20interested%20in%20opportunities%20at%20Bashlaw%20Global%20Technologies.'),
          outlined: true,
        ),
      ],
    );
  }
}

class _WABtn extends StatefulWidget {
  final String label;
  final VoidCallback onTap;
  final bool outlined;
  const _WABtn(
      {required this.label, required this.onTap, this.outlined = false});

  @override
  State<_WABtn> createState() => _WABtnState();
}

class _WABtnState extends State<_WABtn> {
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
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          decoration: BoxDecoration(
            color: widget.outlined
                ? Colors.transparent
                : (_hovered
                    ? const Color(0xFF1DB954)
                    : const Color(0xFF25D366)),
            border: Border.all(
              color: const Color(0xFF25D366),
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.chat_bubble_rounded,
                size: 16,
                color: widget.outlined
                    ? (_hovered
                        ? AppTheme.white
                        : const Color(0xFF25D366))
                    : AppTheme.white,
              ),
              const SizedBox(width: 8),
              Text(
                widget.label,
                style: GoogleFonts.rajdhani(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: widget.outlined
                      ? (_hovered
                          ? AppTheme.white
                          : const Color(0xFF25D366))
                      : AppTheme.white,
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

class _ContactForm extends StatefulWidget {
  final bool isWide;
  const _ContactForm({required this.isWide});

  @override
  State<_ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<_ContactForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _msgCtrl = TextEditingController();
  bool _submitted = false;

  @override
  void dispose() {
    _nameCtrl.dispose();
    _emailCtrl.dispose();
    _msgCtrl.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      // Launch mail with pre-filled content
      final subject =
          Uri.encodeComponent('Enquiry from ${_nameCtrl.text}');
      final body = Uri.encodeComponent(
          'Name: ${_nameCtrl.text}\nEmail: ${_emailCtrl.text}\n\nMessage:\n${_msgCtrl.text}');
      launchUrl(
        Uri.parse('mailto:bashlawglobaltechnologies@gmail.com?subject=$subject&body=$body'),
        mode: LaunchMode.externalApplication,
      );
      setState(() => _submitted = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        color: AppTheme.cardBg,
        border: Border.all(color: AppTheme.cardBorder),
        borderRadius: BorderRadius.circular(20),
      ),
      child: _submitted
          ? Column(
              children: [
                const Icon(Icons.check_circle_rounded,
                    color: AppTheme.cyan, size: 56),
                const SizedBox(height: 16),
                Text(
                  'Message Sent!',
                  style: GoogleFonts.rajdhani(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    color: AppTheme.white,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Your email client has been opened. We\'ll get back to you shortly.',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                      fontSize: 14, color: AppTheme.greyLight),
                ),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: () => setState(() => _submitted = false),
                  child: Text(
                    'Send Another',
                    style: GoogleFonts.inter(color: AppTheme.cyan),
                  ),
                ),
              ],
            )
          : Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Send Us a Message',
                    style: GoogleFonts.rajdhani(
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      color: AppTheme.white,
                    ),
                  ),
                  const SizedBox(height: 32),
                  if (widget.isWide)
                    Row(
                      children: [
                        Expanded(child: _buildField('Your Name', _nameCtrl, false)),
                        const SizedBox(width: 20),
                        Expanded(child: _buildField('Email Address', _emailCtrl, false, isEmail: true)),
                      ],
                    )
                  else ...[
                    _buildField('Your Name', _nameCtrl, false),
                    const SizedBox(height: 16),
                    _buildField('Email Address', _emailCtrl, false, isEmail: true),
                  ],
                  const SizedBox(height: 16),
                  _buildField('Your Message', _msgCtrl, true),
                  const SizedBox(height: 28),
                  _SubmitButton(onTap: _submit),
                ],
              ),
            ),
    );
  }

  Widget _buildField(
      String label, TextEditingController ctrl, bool isMultiline,
      {bool isEmail = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 13,
            color: AppTheme.greyLight,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: ctrl,
          maxLines: isMultiline ? 5 : 1,
          style: GoogleFonts.inter(fontSize: 14, color: AppTheme.white),
          decoration: InputDecoration(
            filled: true,
            fillColor: AppTheme.navyLight.withOpacity(0.5),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:
                  const BorderSide(color: AppTheme.cardBorder),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:
                  const BorderSide(color: AppTheme.cardBorder),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: AppTheme.cyan, width: 1.5),
            ),
            hintText: label,
            hintStyle: GoogleFonts.inter(
                fontSize: 13,
                color: AppTheme.greyLight.withOpacity(0.5)),
            contentPadding: const EdgeInsets.all(16),
          ),
          validator: (val) {
            if (val == null || val.isEmpty) return 'Required';
            if (isEmail && !val.contains('@')) return 'Invalid email';
            return null;
          },
        ),
      ],
    );
  }
}

class _SubmitButton extends StatefulWidget {
  final VoidCallback onTap;
  const _SubmitButton({required this.onTap});

  @override
  State<_SubmitButton> createState() => _SubmitButtonState();
}

class _SubmitButtonState extends State<_SubmitButton> {
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
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: _hovered
                  ? [AppTheme.gold, AppTheme.goldLight]
                  : [AppTheme.cyan, AppTheme.cyanDark],
            ),
            borderRadius: BorderRadius.circular(10),
            boxShadow: _hovered
                ? [
                    BoxShadow(
                      color: AppTheme.cyan.withOpacity(0.3),
                      blurRadius: 20,
                    )
                  ]
                : [],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Send Message',
                style: GoogleFonts.rajdhani(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: AppTheme.navyDark,
                  letterSpacing: 1,
                ),
              ),
              const SizedBox(width: 8),
              const Icon(Icons.send_rounded,
                  color: AppTheme.navyDark, size: 18),
            ],
          ),
        ),
      ),
    );
  }
}
