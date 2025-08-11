import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:notes_app/controllers/theme_controller.dart';
import 'package:google_fonts/google_fonts.dart';

class FontsController extends GetxController {
  static FontsController get to => Get.find();

  // Observable current font
  var currentFont = 'Dancing Script'.obs;

  // List of available Google Fonts with their display names and categories
  final List<FontOption> _availableFonts = [
    // Handwriting fonts
    FontOption(
      name: 'Dancing Script',
      displayName: 'Dancing Script',
      category: 'Handwriting',
      preview: 'Elegant and flowing',
      isGoogleFont: true,
    ),
    FontOption(
      name: 'Great Vibes',
      displayName: 'Great Vibes',
      category: 'Handwriting',
      preview: 'Elegant and flowing',
      isGoogleFont: true,
    ),
    FontOption(
      name: 'Satisfy',
      displayName: 'Satisfy',
      category: 'Handwriting',
      preview: 'Casual and friendly',
      isGoogleFont: true,
    ),
    FontOption(
      name: 'Pacifico',
      displayName: 'Pacifico',
      category: 'Handwriting',
      preview: 'Fun and casual',
      isGoogleFont: true,
    ),
    FontOption(
      name: 'Indie Flower',
      displayName: 'Indie Flower',
      category: 'Handwriting',
      preview: 'Casual and friendly',
      isGoogleFont: true,
    ),
    FontOption(
      name: 'Architects Daughter',
      displayName: 'Architects Daughter',
      category: 'Handwriting',
      preview: 'Neat handwriting',
      isGoogleFont: true,
    ),
    FontOption(
      name: 'Kalam',
      displayName: 'Kalam',
      category: 'Handwriting',
      preview: 'Natural handwriting',
      isGoogleFont: true,
    ),

    // Modern fonts
    FontOption(
      name: 'Roboto',
      displayName: 'Roboto',
      category: 'Modern',
      preview: 'Clean and readable',
      isGoogleFont: true,
    ),
    FontOption(
      name: 'Open Sans',
      displayName: 'Open Sans',
      category: 'Modern',
      preview: 'Professional and clean',
      isGoogleFont: true,
    ),
    FontOption(
      name: 'Lato',
      displayName: 'Lato',
      category: 'Modern',
      preview: 'Friendly and warm',
      isGoogleFont: true,
    ),
    FontOption(
      name: 'Poppins',
      displayName: 'Poppins',
      category: 'Modern',
      preview: 'Geometric and modern',
      isGoogleFont: true,
    ),
    FontOption(
      name: 'Inter',
      displayName: 'Inter',
      category: 'Modern',
      preview: 'Optimized for screens',
      isGoogleFont: true,
    ),
    FontOption(
      name: 'Nunito',
      displayName: 'Nunito',
      category: 'Modern',
      preview: 'Rounded and friendly',
      isGoogleFont: true,
    ),
    FontOption(
      name: 'Montserrat',
      displayName: 'Montserrat',
      category: 'Modern',
      preview: 'Clean and geometric',
      isGoogleFont: true,
    ),
    FontOption(
      name: 'Raleway',
      displayName: 'Raleway',
      category: 'Modern',
      preview: 'Elegant and modern',
      isGoogleFont: true,
    ),
    FontOption(
      name: 'Ubuntu',
      displayName: 'Ubuntu',
      category: 'Modern',
      preview: 'Friendly and readable',
      isGoogleFont: true,
    ),

    // Display fonts
    FontOption(
      name: 'Bebas Neue',
      displayName: 'Bebas Neue',
      category: 'Display',
      preview: 'Bold and impactful',
      isGoogleFont: true,
    ),
    FontOption(
      name: 'Lobster',
      displayName: 'Lobster',
      category: 'Display',
      preview: 'Fun and playful',
      isGoogleFont: true,
    ),
    FontOption(
      name: 'Righteous',
      displayName: 'Righteous',
      category: 'Display',
      preview: 'Bold and energetic',
      isGoogleFont: true,
    ),
    FontOption(
      name: 'Bangers',
      displayName: 'Bangers',
      category: 'Display',
      preview: 'Comic book style',
      isGoogleFont: true,
    ),
    FontOption(
      name: 'Abril Fatface',
      displayName: 'Abril Fatface',
      category: 'Display',
      preview: 'Bold and dramatic',
      isGoogleFont: true,
    ),
    FontOption(
      name: 'Fredoka',
      displayName: 'Fredoka',
      category: 'Display',
      preview: 'Fun and rounded',
      isGoogleFont: true,
    ),
    FontOption(
      name: 'Bungee',
      displayName: 'Bungee',
      category: 'Display',
      preview: 'Bold and condensed',
      isGoogleFont: true,
    ),

    // Serif fonts
    FontOption(
      name: 'Crimson Text',
      displayName: 'Crimson Text',
      category: 'Serif',
      preview: 'Classic and readable',
      isGoogleFont: true,
    ),
    FontOption(
      name: 'Lora',
      displayName: 'Lora',
      category: 'Serif',
      preview: 'Modern serif with personality',
      isGoogleFont: true,
    ),
    FontOption(
      name: 'Libre Baskerville',
      displayName: 'Libre Baskerville',
      category: 'Serif',
      preview: 'Traditional and elegant',
      isGoogleFont: true,
    ),
    FontOption(
      name: 'Merriweather',
      displayName: 'Merriweather',
      category: 'Serif',
      preview: 'Warm and readable',
      isGoogleFont: true,
    ),
    FontOption(
      name: 'Playfair Display',
      displayName: 'Playfair Display',
      category: 'Serif',
      preview: 'Elegant and sophisticated',
      isGoogleFont: true,
    ),
    FontOption(
      name: 'Bodoni Moda',
      displayName: 'Bodoni Moda',
      category: 'Serif',
      preview: 'Classic and refined',
      isGoogleFont: true,
    ),
  ];

  // Public getter
  List<FontOption> get availableFonts => _availableFonts;

  @override
  void onInit() {
    super.onInit();
    _loadFontPreference();

    // Validate saved font; if missing, fall back to first available
    final hasSaved = _availableFonts.any((f) => f.name == currentFont.value);
    if (!hasSaved) {
      currentFont.value = _availableFonts.first.name;
      _saveFontPreference();
    }

    // Debug info
    print('Available fonts: ${_availableFonts.map((f) => f.name).join(', ')}');
    print('Current font: ${currentFont.value}');
  }

  // Load font preference
  Future<void> _loadFontPreference() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final saved = prefs.getString('selectedFont');
      if (saved != null && saved.isNotEmpty) {
        currentFont.value = saved;
      }
    } catch (e) {
      // ignore
    }
  }

  // Save font preference
  Future<void> _saveFontPreference() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('selectedFont', currentFont.value);
    } catch (e) {
      // ignore
    }
  }

  // Change font
  void changeFont(String fontName) {
    if (_availableFonts.any((font) => font.name == fontName)) {
      currentFont.value = fontName;
      _saveFontPreference();

      // Force theme update to apply new font
      try {
        final themeController = Get.find<ThemeController>();
        themeController.update();
      } catch (_) {}

      // Force app rebuild
      update();
      Get.forceAppUpdate();
    }
  }

  // Safe getter
  FontOption get currentFontOption => _availableFonts.firstWhere(
    (font) => font.name == currentFont.value,
    orElse: () => _availableFonts.first,
  );

  // Get fonts by category
  List<FontOption> getFontsByCategory(String category) {
    return _availableFonts.where((font) => font.category == category).toList();
  }

  // Get all categories
  List<String> get categories =>
      _availableFonts.map((font) => font.category).toSet().toList();

  // Get font style for a specific font name using Google Fonts
  TextStyle? getFontStyle(
    String fontName, {
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    double? height,
  }) {
    try {
      // Check if font exists in available fonts
      _availableFonts.firstWhere((font) => font.name == fontName);

      // Use Google Fonts to get the actual font style
      switch (fontName) {
        case 'Dancing Script':
          return GoogleFonts.dancingScript(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: color,
            height: height,
          );
        case 'Great Vibes':
          return GoogleFonts.greatVibes(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: color,
            height: height,
          );
        case 'Satisfy':
          return GoogleFonts.satisfy(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: color,
            height: height,
          );
        case 'Pacifico':
          return GoogleFonts.pacifico(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: color,
            height: height,
          );
        case 'Indie Flower':
          return GoogleFonts.indieFlower(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: color,
            height: height,
          );
        case 'Architects Daughter':
          return GoogleFonts.architectsDaughter(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: color,
            height: height,
          );
        case 'Kalam':
          return GoogleFonts.kalam(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: color,
            height: height,
          );
        case 'Roboto':
          return GoogleFonts.roboto(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: color,
            height: height,
          );
        case 'Open Sans':
          return GoogleFonts.openSans(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: color,
            height: height,
          );
        case 'Lato':
          return GoogleFonts.lato(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: color,
            height: height,
          );
        case 'Poppins':
          return GoogleFonts.poppins(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: color,
            height: height,
          );
        case 'Inter':
          return GoogleFonts.inter(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: color,
            height: height,
          );
        case 'Nunito':
          return GoogleFonts.nunito(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: color,
            height: height,
          );
        case 'Montserrat':
          return GoogleFonts.montserrat(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: color,
            height: height,
          );
        case 'Raleway':
          return GoogleFonts.raleway(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: color,
            height: height,
          );
        case 'Ubuntu':
          return GoogleFonts.ubuntu(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: color,
            height: height,
          );
        case 'Source Sans Pro':
          return GoogleFonts.sourceSans3(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: color,
            height: height,
          );
        case 'Bebas Neue':
          return GoogleFonts.bebasNeue(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: color,
            height: height,
          );
        case 'Lobster':
          return GoogleFonts.lobster(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: color,
            height: height,
          );
        case 'Righteous':
          return GoogleFonts.righteous(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: color,
            height: height,
          );
        case 'Bangers':
          return GoogleFonts.bangers(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: color,
            height: height,
          );
        case 'Abril Fatface':
          return GoogleFonts.abrilFatface(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: color,
            height: height,
          );
        case 'Fredoka':
          return GoogleFonts.fredoka(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: color,
            height: height,
          );
        case 'Bungee':
          return GoogleFonts.bungee(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: color,
            height: height,
          );
        case 'Crimson Text':
          return GoogleFonts.crimsonText(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: color,
            height: height,
          );
        case 'Lora':
          return GoogleFonts.lora(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: color,
            height: height,
          );
        case 'Libre Baskerville':
          return GoogleFonts.libreBaskerville(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: color,
            height: height,
          );
        case 'Merriweather':
          return GoogleFonts.merriweather(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: color,
            height: height,
          );
        case 'Playfair Display':
          return GoogleFonts.playfairDisplay(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: color,
            height: height,
          );
        case 'Bodoni Moda':
          return GoogleFonts.bodoniModa(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: color,
            height: height,
          );
        case 'Source Serif Pro':
          return GoogleFonts.sourceSerif4(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: color,
            height: height,
          );
        default:
          // Fallback to system font
          return TextStyle(
            fontFamily: fontName,
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: color,
            height: height,
          );
      }
    } catch (e) {
      return null;
    }
  }
}

class FontOption {
  final String name;
  final String displayName;
  final String category;
  final String preview;
  final bool isGoogleFont;

  FontOption({
    required this.name,
    required this.displayName,
    required this.category,
    required this.preview,
    required this.isGoogleFont,
  });
}
