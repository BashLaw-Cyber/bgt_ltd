import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Color Palette — Deep Navy + Electric Cyan + Gold Accent
  static const Color navyDark = Color(0xFF040D1A);
  static const Color navyMid = Color(0xFF071428);
  static const Color navyLight = Color(0xFF0D2144);
  static const Color cyan = Color(0xFF00D4FF);
  static const Color cyanDark = Color(0xFF0099CC);
  static const Color gold = Color(0xFFFFBB44);
  static const Color goldLight = Color(0xFFFFD580);
  static const Color white = Color(0xFFFFFFFF);
  static const Color whiteOff = Color(0xFFE8EEF5);
  static const Color greyLight = Color(0xFF8899AA);
  static const Color cardBg = Color(0xFF0A1E3A);
  static const Color cardBorder = Color(0xFF1A3A60);

  static ThemeData get theme => ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: navyDark,
        colorScheme: const ColorScheme.dark(
          primary: cyan,
          secondary: gold,
          surface: navyMid,
        ),
        textTheme: TextTheme(
          displayLarge: GoogleFonts.rajdhani(
            fontSize: 72,
            fontWeight: FontWeight.w700,
            color: white,
            letterSpacing: -1,
          ),
          displayMedium: GoogleFonts.rajdhani(
            fontSize: 52,
            fontWeight: FontWeight.w700,
            color: white,
            letterSpacing: -0.5,
          ),
          displaySmall: GoogleFonts.rajdhani(
            fontSize: 38,
            fontWeight: FontWeight.w600,
            color: white,
          ),
          headlineMedium: GoogleFonts.rajdhani(
            fontSize: 28,
            fontWeight: FontWeight.w600,
            color: white,
          ),
          headlineSmall: GoogleFonts.rajdhani(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: white,
          ),
          bodyLarge: GoogleFonts.inter(
            fontSize: 16,
            color: whiteOff,
            height: 1.7,
          ),
          bodyMedium: GoogleFonts.inter(
            fontSize: 14,
            color: greyLight,
            height: 1.6,
          ),
          labelLarge: GoogleFonts.rajdhani(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: cyan,
            letterSpacing: 2,
          ),
        ),
      );
}

class AppConstants {
  static const String companyName = 'Bashlaw Global Technologies';
  static const String companyFullName = 'Bashlaw Global Technologies LTD';
  static const String companyTagline =
      'Engineering Tomorrow\'s Digital Future';
  static const String companySubTagline =
      'IT Solutions · Telecom Engineering · Cybersecurity · Cloud Computing';

  // Contact details — update these with real numbers/links
  static const String whatsappCEO =
      'https://wa.me/2348000000000?text=Hello%2C%20I%20would%20like%20to%20enquire%20about%20Bashlaw%20Global%20Technologies.';
  static const String whatsappHR =
      'https://wa.me/2348111111111?text=Hello%2C%20I%20am%20interested%20in%20opportunities%20at%20Bashlaw%20Global%20Technologies.';
  static const String phoneNumber = 'tel:+2348000000000';
  static const String emailAddress = 'mailto:info@bashlawglobal.com';
  static const String linkedIn =
      'https://www.linkedin.com/company/bashlawglobal';
  static const String twitter = 'https://twitter.com/bashlawglobal';
  static const String companyAddress =
      'Abuja, Federal Capital Territory, Nigeria';
}
