import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:notes_app/view/home_screen.dart';
import 'package:notes_app/view/notes_screen.dart';
import 'package:notes_app/view/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  // Ensure Flutter is properly initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Pre-initialize SharedPreferences to avoid plugin issues
  try {
    await SharedPreferences.getInstance();
  } catch (e) {
    print('SharedPreferences initialization warning: $e');
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, fontFamily: 'Caveat'),
      home: const SplashScreen(),
    );
  }
}
