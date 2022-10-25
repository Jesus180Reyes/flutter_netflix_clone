import 'package:flutter/material.dart';
import 'package:netflix_clone/pages/details_page.dart';
import 'package:netflix_clone/pages/home_page.dart';
import 'package:netflix_clone/themes/apptheme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    cambiarStatusLight();
    cambiarColorStatus();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Netflix Clone App',
      initialRoute: 'home',
      theme: AppTheme.lightTheme,
      routes: {
        "home": (_) => const HomePage(),
        "details": (_) => const DetailsPage(),
      },
    );
  }
}
