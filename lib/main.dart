import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/view/splash_screen.dart';
import 'package:notes_app/controllers/theme_controller.dart';
import 'package:notes_app/controllers/fonts_controller.dart';
import 'package:notes_app/controllers/update_controller.dart';
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

  // Initialize controllers
  Get.put(ThemeController());
  Get.put(FontsController());
  Get.put(UpdateController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(
      builder: (themeController) {
        return GetBuilder<FontsController>(
          builder: (fontsController) {
            // Get the current theme with the current font applied
            final currentTheme = themeController.getCurrentTheme();

            // Print debug info to see what's happening
            print(
              'Building MyApp with font: ${fontsController.currentFont.value}',
            );
            print('Theme brightness: ${currentTheme.brightness}');

            return GetMaterialApp(
              debugShowCheckedModeBanner: false,
              theme: currentTheme,
              darkTheme: currentTheme,
              themeMode: themeController.isDarkMode.value
                  ? ThemeMode.dark
                  : ThemeMode.light,
              home: const SplashScreen(),
            );
          },
        );
      },
    );
  }
}
