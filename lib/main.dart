import 'package:ecommerceapp/providers/homescreen_provider.dart';
import 'package:ecommerceapp/providers/productcard_provider.dart';
import 'package:ecommerceapp/providers/textform_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'onborading_screen/onboarding.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (_) => Textformprovider(),
    ),
    ChangeNotifierProvider(
      create: (_) => ProductcardProvider(),
    ),
    ChangeNotifierProvider(
      create: (_) => HomepageProvider(),
    )
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: const Color.fromARGB(
          255,
          251,
          48,
          82,
        ),
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          color: Colors.transparent,
        ),
        useMaterial3: true,
        textTheme: GoogleFonts.lexendTextTheme(),
      ),
      home: const OnBoardingScreen(),
    );
  }
}
