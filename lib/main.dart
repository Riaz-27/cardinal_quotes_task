import 'package:cardinal_quotes_task/core/theme/app_theme.dart';
import 'package:cardinal_quotes_task/features/auth/view/pages/login_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cardinal Quotes',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightThemeMode,
      home: const LoginPage(),
    );
  }
}
