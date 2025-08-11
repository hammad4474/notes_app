import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:notes_app/controllers/fonts_controller.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeController extends GetxController {
  static ThemeController get to => Get.find();

  // Observable theme mode
  var isDarkMode = false.obs;

  // Theme data
  late ThemeData lightTheme;
  late ThemeData darkTheme;

  @override
  void onInit() {
    super.onInit();
    _initializeThemes();
    _loadThemePreference();
  }

  void _initializeThemes() {
    // Light Theme
    lightTheme = ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: Colors.grey[50],
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black87),
        titleTextStyle: GoogleFonts.dancingScript(
          fontSize: 35,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
      cardTheme: CardThemeData(
        color: Colors.white,
        elevation: 2,
        shadowColor: Colors.black.withOpacity(0.1),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      textTheme: GoogleFonts.dancingScriptTextTheme(
        const TextTheme(
          bodyLarge: TextStyle(color: Colors.black87),
          bodyMedium: TextStyle(color: Colors.black87),
          titleLarge: TextStyle(color: Colors.black87),
        ),
      ),
      iconTheme: const IconThemeData(color: Colors.black87),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Colors.black87,
        foregroundColor: Colors.white,
      ),
    );

    // Dark Theme
    darkTheme = ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: const Color(0xFF121212),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        titleTextStyle: GoogleFonts.dancingScript(
          fontSize: 35,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      cardTheme: CardThemeData(
        color: const Color(0xFF1E1E1E),
        elevation: 2,
        shadowColor: Colors.black.withOpacity(0.3),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      textTheme: GoogleFonts.dancingScriptTextTheme(
        const TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white70),
          titleLarge: TextStyle(color: Colors.white),
        ),
      ),
      iconTheme: const IconThemeData(color: Colors.white),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
      ),
    );
  }

  // Get current theme with dynamic Google Fonts
  ThemeData getCurrentTheme() {
    try {
      final fontsController = Get.find<FontsController>();
      final currentFont = fontsController.currentFont.value;

      // Get the Google Font text theme for the current font
      TextTheme getGoogleFontTextTheme() {
        switch (currentFont) {
          case 'Dancing Script':
            return GoogleFonts.dancingScriptTextTheme();
          case 'Great Vibes':
            return GoogleFonts.greatVibesTextTheme();
          case 'Satisfy':
            return GoogleFonts.satisfyTextTheme();
          case 'Pacifico':
            return GoogleFonts.pacificoTextTheme();
          case 'Indie Flower':
            return GoogleFonts.indieFlowerTextTheme();
          case 'Architects Daughter':
            return GoogleFonts.architectsDaughterTextTheme();
          case 'Kalam':
            return GoogleFonts.kalamTextTheme();
          case 'Roboto':
            return GoogleFonts.robotoTextTheme();
          case 'Open Sans':
            return GoogleFonts.openSansTextTheme();
          case 'Lato':
            return GoogleFonts.latoTextTheme();
          case 'Poppins':
            return GoogleFonts.poppinsTextTheme();
          case 'Inter':
            return GoogleFonts.interTextTheme();
          case 'Nunito':
            return GoogleFonts.nunitoTextTheme();
          case 'Montserrat':
            return GoogleFonts.montserratTextTheme();
          case 'Raleway':
            return GoogleFonts.ralewayTextTheme();
          case 'Ubuntu':
            return GoogleFonts.ubuntuTextTheme();
          case 'Bebas Neue':
            return GoogleFonts.bebasNeueTextTheme();
          case 'Lobster':
            return GoogleFonts.lobsterTextTheme();
          case 'Righteous':
            return GoogleFonts.righteousTextTheme();
          case 'Bangers':
            return GoogleFonts.bangersTextTheme();
          case 'Abril Fatface':
            return GoogleFonts.abrilFatfaceTextTheme();
          case 'Fredoka':
            return GoogleFonts.fredokaTextTheme();
          case 'Bungee':
            return GoogleFonts.bungeeTextTheme();
          case 'Crimson Text':
            return GoogleFonts.crimsonTextTextTheme();
          case 'Lora':
            return GoogleFonts.loraTextTheme();
          case 'Libre Baskerville':
            return GoogleFonts.libreBaskervilleTextTheme();
          case 'Merriweather':
            return GoogleFonts.merriweatherTextTheme();
          case 'Playfair Display':
            return GoogleFonts.playfairDisplayTextTheme();
          case 'Bodoni Moda':
            return GoogleFonts.bodoniModaTextTheme();
          default:
            return GoogleFonts.dancingScriptTextTheme();
        }
      }

      // Get the Google Font for app bar title
      TextStyle getGoogleFontTitleStyle(Color color) {
        switch (currentFont) {
          case 'Dancing Script':
            return GoogleFonts.dancingScript(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color: color,
            );
          case 'Great Vibes':
            return GoogleFonts.greatVibes(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color: color,
            );
          case 'Satisfy':
            return GoogleFonts.satisfy(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color: color,
            );
          case 'Pacifico':
            return GoogleFonts.pacifico(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color: color,
            );
          case 'Indie Flower':
            return GoogleFonts.indieFlower(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color: color,
            );
          case 'Architects Daughter':
            return GoogleFonts.architectsDaughter(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color: color,
            );
          case 'Kalam':
            return GoogleFonts.kalam(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color: color,
            );
          case 'Roboto':
            return GoogleFonts.roboto(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color: color,
            );
          case 'Open Sans':
            return GoogleFonts.openSans(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color: color,
            );
          case 'Lato':
            return GoogleFonts.lato(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color: color,
            );
          case 'Poppins':
            return GoogleFonts.poppins(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color: color,
            );
          case 'Inter':
            return GoogleFonts.inter(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color: color,
            );
          case 'Nunito':
            return GoogleFonts.nunito(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color: color,
            );
          case 'Montserrat':
            return GoogleFonts.montserrat(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color: color,
            );
          case 'Raleway':
            return GoogleFonts.raleway(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color: color,
            );
          case 'Ubuntu':
            return GoogleFonts.ubuntu(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color: color,
            );
          case 'Bebas Neue':
            return GoogleFonts.bebasNeue(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color: color,
            );
          case 'Lobster':
            return GoogleFonts.lobster(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color: color,
            );
          case 'Righteous':
            return GoogleFonts.righteous(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color: color,
            );
          case 'Bangers':
            return GoogleFonts.bangers(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color: color,
            );
          case 'Abril Fatface':
            return GoogleFonts.abrilFatface(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color: color,
            );
          case 'Fredoka':
            return GoogleFonts.fredoka(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color: color,
            );
          case 'Bungee':
            return GoogleFonts.bungee(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color: color,
            );
          case 'Crimson Text':
            return GoogleFonts.crimsonText(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color: color,
            );
          case 'Lora':
            return GoogleFonts.lora(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color: color,
            );
          case 'Libre Baskerville':
            return GoogleFonts.libreBaskerville(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color: color,
            );
          case 'Merriweather':
            return GoogleFonts.merriweather(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color: color,
            );
          case 'Playfair Display':
            return GoogleFonts.playfairDisplay(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color: color,
            );
          case 'Bodoni Moda':
            return GoogleFonts.bodoniModa(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color: color,
            );
          default:
            return GoogleFonts.dancingScript(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color: color,
            );
        }
      }

      if (isDarkMode.value) {
        return darkTheme.copyWith(
          // Apply Google Fonts text theme
          textTheme: getGoogleFontTextTheme().copyWith(
            bodyLarge: getGoogleFontTextTheme().bodyLarge?.copyWith(
              color: Colors.white,
            ),
            bodyMedium: getGoogleFontTextTheme().bodyMedium?.copyWith(
              color: Colors.white70,
            ),
            titleLarge: getGoogleFontTextTheme().titleLarge?.copyWith(
              color: Colors.white,
            ),
          ),
          primaryTextTheme: getGoogleFontTextTheme(),
          // Don't override appBar title style - let individual widgets set their own font
        );
      } else {
        return lightTheme.copyWith(
          // Apply Google Fonts text theme
          textTheme: getGoogleFontTextTheme().copyWith(
            bodyLarge: getGoogleFontTextTheme().bodyLarge?.copyWith(
              color: Colors.black87,
            ),
            bodyMedium: getGoogleFontTextTheme().bodyMedium?.copyWith(
              color: Colors.black87,
            ),
            titleLarge: getGoogleFontTextTheme().titleLarge?.copyWith(
              color: Colors.black87,
            ),
          ),
          primaryTextTheme: getGoogleFontTextTheme(),
          // Don't override appBar title style - let individual widgets set their own font
        );
      }
    } catch (e) {
      // Fallback to default themes if fonts controller not available
      return isDarkMode.value ? darkTheme : lightTheme;
    }
  }

  // Load saved theme preference
  Future<void> _loadThemePreference() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      isDarkMode.value = prefs.getBool('isDarkMode') ?? false;
    } catch (e) {
      print('Error loading theme preference: $e');
    }
  }

  // Save theme preference
  Future<void> _saveThemePreference() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isDarkMode', isDarkMode.value);
    } catch (e) {
      print('Error saving theme preference: $e');
    }
  }

  // Toggle theme
  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    _saveThemePreference();
    update(); // Notify GetBuilder to rebuild
  }

  // Get current theme
  ThemeData get currentTheme => getCurrentTheme();

  // Get current brightness
  Brightness get currentBrightness =>
      isDarkMode.value ? Brightness.dark : Brightness.light;

  // Get text color based on current theme
  Color get textColor => isDarkMode.value ? Colors.white : Colors.black87;

  // Get background color based on current theme
  Color get backgroundColor =>
      isDarkMode.value ? const Color(0xFF121212) : Colors.grey[50]!;

  // Get card color based on current theme
  Color get cardColor =>
      isDarkMode.value ? const Color(0xFF1E1E1E) : Colors.white;

  // Get icon color based on current theme
  Color get iconColor => isDarkMode.value ? Colors.white : Colors.black87;
}
