import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'theme/app_theme.dart';
import 'pages/landing_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ),
  );
  runApp(const BashlawApp());
}

class BashlawApp extends StatelessWidget {
  const BashlawApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bashlaw Global Technologies LTD',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      home: const LandingPage(),
    );
  }
}
