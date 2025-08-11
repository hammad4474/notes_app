import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/view/notes_adding.dart';
import 'package:notes_app/view/notes_screen.dart';
import 'package:notes_app/view/notes_editing.dart';
import 'package:notes_app/view/font_picker_screen.dart';
import 'package:notes_app/controllers/adding_notes_controller.dart';
import 'package:notes_app/controllers/theme_controller.dart';
import 'package:notes_app/controllers/fonts_controller.dart';
import 'package:notes_app/controllers/update_controller.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final NotesController notesController = Get.put(NotesController());
  final ThemeController themeController = Get.find<ThemeController>();
  final FontsController fontsController = Get.find<FontsController>();
  final UpdateController updateController = Get.find<UpdateController>();

  // Colors for note cards
  List<Color> cardColors = [
    const Color.fromARGB(255, 255, 223, 186), // Light orange
    const Color.fromARGB(255, 186, 225, 255), // Light blue
    const Color.fromARGB(255, 228, 189, 189), // Light pink
    const Color.fromARGB(255, 200, 230, 201), // Light green
    const Color.fromARGB(255, 230, 200, 230), // Light purple
    const Color.fromARGB(255, 255, 249, 196), // Light yellow
  ];

  // Dark theme card colors
  List<Color> darkCardColors = [
    const Color.fromARGB(255, 80, 60, 40), // Dark orange
    const Color.fromARGB(255, 40, 60, 80), // Dark blue
    const Color.fromARGB(255, 80, 40, 40), // Dark pink
    const Color.fromARGB(255, 40, 80, 40), // Dark green
    const Color.fromARGB(255, 80, 40, 80), // Dark purple
    const Color.fromARGB(255, 80, 80, 40), // Dark yellow
  ];

  // Get Google Font style for app bar title
  TextStyle getAppBarTitleStyle() {
    final currentFont = fontsController.currentFont.value;
    final textColor = themeController.textColor;

    switch (currentFont) {
      case 'Dancing Script':
        return GoogleFonts.dancingScript(
          fontSize: 35,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Great Vibes':
        return GoogleFonts.greatVibes(
          fontSize: 35,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Satisfy':
        return GoogleFonts.satisfy(
          fontSize: 35,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Pacifico':
        return GoogleFonts.pacifico(
          fontSize: 35,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Indie Flower':
        return GoogleFonts.indieFlower(
          fontSize: 35,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Architects Daughter':
        return GoogleFonts.architectsDaughter(
          fontSize: 35,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Kalam':
        return GoogleFonts.kalam(
          fontSize: 35,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Roboto':
        return GoogleFonts.roboto(
          fontSize: 35,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Open Sans':
        return GoogleFonts.openSans(
          fontSize: 35,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Lato':
        return GoogleFonts.lato(
          fontSize: 35,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Poppins':
        return GoogleFonts.poppins(
          fontSize: 35,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Inter':
        return GoogleFonts.inter(
          fontSize: 35,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Nunito':
        return GoogleFonts.nunito(
          fontSize: 35,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Montserrat':
        return GoogleFonts.montserrat(
          fontSize: 35,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Raleway':
        return GoogleFonts.raleway(
          fontSize: 35,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Ubuntu':
        return GoogleFonts.ubuntu(
          fontSize: 35,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Bebas Neue':
        return GoogleFonts.bebasNeue(
          fontSize: 35,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Lobster':
        return GoogleFonts.lobster(
          fontSize: 35,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Righteous':
        return GoogleFonts.righteous(
          fontSize: 35,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Bangers':
        return GoogleFonts.bangers(
          fontSize: 35,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Abril Fatface':
        return GoogleFonts.abrilFatface(
          fontSize: 35,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Fredoka':
        return GoogleFonts.fredoka(
          fontSize: 35,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Bungee':
        return GoogleFonts.bungee(
          fontSize: 35,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Crimson Text':
        return GoogleFonts.crimsonText(
          fontSize: 35,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Lora':
        return GoogleFonts.lora(
          fontSize: 35,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Libre Baskerville':
        return GoogleFonts.libreBaskerville(
          fontSize: 35,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Merriweather':
        return GoogleFonts.merriweather(
          fontSize: 35,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Playfair Display':
        return GoogleFonts.playfairDisplay(
          fontSize: 35,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Bodoni Moda':
        return GoogleFonts.bodoniModa(
          fontSize: 35,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      default:
        return GoogleFonts.dancingScript(
          fontSize: 35,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
    }
  }

  // Get Google Font style for loading and empty state text
  TextStyle getInfoTextStyle({
    double fontSize = 16,
    FontWeight fontWeight = FontWeight.normal,
  }) {
    final currentFont = fontsController.currentFont.value;
    final textColor = themeController.textColor;

    switch (currentFont) {
      case 'Dancing Script':
        return GoogleFonts.dancingScript(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: textColor,
        );
      case 'Great Vibes':
        return GoogleFonts.greatVibes(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: textColor,
        );
      case 'Satisfy':
        return GoogleFonts.satisfy(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: textColor,
        );
      case 'Pacifico':
        return GoogleFonts.pacifico(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: textColor,
        );
      case 'Indie Flower':
        return GoogleFonts.indieFlower(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: textColor,
        );
      case 'Architects Daughter':
        return GoogleFonts.architectsDaughter(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: textColor,
        );
      case 'Kalam':
        return GoogleFonts.kalam(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: textColor,
        );
      case 'Roboto':
        return GoogleFonts.roboto(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: textColor,
        );
      case 'Open Sans':
        return GoogleFonts.openSans(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: textColor,
        );
      case 'Lato':
        return GoogleFonts.lato(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: textColor,
        );
      case 'Poppins':
        return GoogleFonts.poppins(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: textColor,
        );
      case 'Inter':
        return GoogleFonts.inter(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: textColor,
        );
      case 'Nunito':
        return GoogleFonts.nunito(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: textColor,
        );
      case 'Montserrat':
        return GoogleFonts.montserrat(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: textColor,
        );
      case 'Raleway':
        return GoogleFonts.raleway(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: textColor,
        );
      case 'Ubuntu':
        return GoogleFonts.ubuntu(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: textColor,
        );
      case 'Bebas Neue':
        return GoogleFonts.bebasNeue(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: textColor,
        );
      case 'Lobster':
        return GoogleFonts.lobster(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: textColor,
        );
      case 'Righteous':
        return GoogleFonts.righteous(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: textColor,
        );
      case 'Bangers':
        return GoogleFonts.bangers(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: textColor,
        );
      case 'Abril Fatface':
        return GoogleFonts.abrilFatface(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: textColor,
        );
      case 'Fredoka':
        return GoogleFonts.fredoka(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: textColor,
        );
      case 'Bungee':
        return GoogleFonts.bungee(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: textColor,
        );
      case 'Crimson Text':
        return GoogleFonts.crimsonText(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: textColor,
        );
      case 'Lora':
        return GoogleFonts.lora(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: textColor,
        );
      case 'Libre Baskerville':
        return GoogleFonts.libreBaskerville(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: textColor,
        );
      case 'Merriweather':
        return GoogleFonts.merriweather(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: textColor,
        );
      case 'Playfair Display':
        return GoogleFonts.playfairDisplay(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: textColor,
        );
      case 'Bodoni Moda':
        return GoogleFonts.bodoniModa(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: textColor,
        );
      default:
        return GoogleFonts.dancingScript(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: textColor,
        );
    }
  }

  // Get Google Font style for note card title
  TextStyle getNoteCardTitleStyle() {
    final currentFont = fontsController.currentFont.value;
    final textColor = themeController.isDarkMode.value
        ? Colors.white
        : Colors.black87;

    switch (currentFont) {
      case 'Dancing Script':
        return GoogleFonts.dancingScript(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Great Vibes':
        return GoogleFonts.greatVibes(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Satisfy':
        return GoogleFonts.satisfy(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Pacifico':
        return GoogleFonts.pacifico(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Indie Flower':
        return GoogleFonts.indieFlower(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Architects Daughter':
        return GoogleFonts.architectsDaughter(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Kalam':
        return GoogleFonts.kalam(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Roboto':
        return GoogleFonts.roboto(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Open Sans':
        return GoogleFonts.openSans(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Lato':
        return GoogleFonts.lato(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Poppins':
        return GoogleFonts.poppins(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Inter':
        return GoogleFonts.inter(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Nunito':
        return GoogleFonts.nunito(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Montserrat':
        return GoogleFonts.montserrat(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Raleway':
        return GoogleFonts.raleway(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Ubuntu':
        return GoogleFonts.ubuntu(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Bebas Neue':
        return GoogleFonts.bebasNeue(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Lobster':
        return GoogleFonts.lobster(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Righteous':
        return GoogleFonts.righteous(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Bangers':
        return GoogleFonts.bangers(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Abril Fatface':
        return GoogleFonts.abrilFatface(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Fredoka':
        return GoogleFonts.fredoka(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Bungee':
        return GoogleFonts.bungee(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Crimson Text':
        return GoogleFonts.crimsonText(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Lora':
        return GoogleFonts.lora(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Libre Baskerville':
        return GoogleFonts.libreBaskerville(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Merriweather':
        return GoogleFonts.merriweather(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Playfair Display':
        return GoogleFonts.playfairDisplay(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Bodoni Moda':
        return GoogleFonts.bodoniModa(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      default:
        return GoogleFonts.dancingScript(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
    }
  }

  // Get Google Font style for note card description
  TextStyle getNoteCardDescriptionStyle() {
    final currentFont = fontsController.currentFont.value;
    final textColor = themeController.isDarkMode.value
        ? Colors.white70
        : Colors.black54;

    switch (currentFont) {
      case 'Dancing Script':
        return GoogleFonts.dancingScript(
          fontSize: 20,
          color: textColor,
          height: 1.3,
        );
      case 'Great Vibes':
        return GoogleFonts.greatVibes(
          fontSize: 20,
          color: textColor,
          height: 1.3,
        );
      case 'Satisfy':
        return GoogleFonts.satisfy(fontSize: 20, color: textColor, height: 1.3);
      case 'Pacifico':
        return GoogleFonts.pacifico(
          fontSize: 20,
          color: textColor,
          height: 1.3,
        );
      case 'Indie Flower':
        return GoogleFonts.indieFlower(
          fontSize: 20,
          color: textColor,
          height: 1.3,
        );
      case 'Architects Daughter':
        return GoogleFonts.architectsDaughter(
          fontSize: 20,
          color: textColor,
          height: 1.3,
        );
      case 'Kalam':
        return GoogleFonts.kalam(fontSize: 20, color: textColor, height: 1.3);
      case 'Roboto':
        return GoogleFonts.roboto(fontSize: 20, color: textColor, height: 1.3);
      case 'Open Sans':
        return GoogleFonts.openSans(
          fontSize: 20,
          color: textColor,
          height: 1.3,
        );
      case 'Lato':
        return GoogleFonts.lato(fontSize: 20, color: textColor, height: 1.3);
      case 'Poppins':
        return GoogleFonts.poppins(fontSize: 20, color: textColor, height: 1.3);
      case 'Inter':
        return GoogleFonts.inter(fontSize: 20, color: textColor, height: 1.3);
      case 'Nunito':
        return GoogleFonts.nunito(fontSize: 20, color: textColor, height: 1.3);
      case 'Montserrat':
        return GoogleFonts.montserrat(
          fontSize: 20,
          color: textColor,
          height: 1.3,
        );
      case 'Raleway':
        return GoogleFonts.raleway(fontSize: 20, color: textColor, height: 1.3);
      case 'Ubuntu':
        return GoogleFonts.ubuntu(fontSize: 20, color: textColor, height: 1.3);
      case 'Bebas Neue':
        return GoogleFonts.bebasNeue(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: textColor,
          height: 1.3,
        );
      case 'Lobster':
        return GoogleFonts.lobster(fontSize: 20, color: textColor, height: 1.3);
      case 'Righteous':
        return GoogleFonts.righteous(
          fontSize: 20,
          color: textColor,
          height: 1.3,
        );
      case 'Bangers':
        return GoogleFonts.bangers(fontSize: 20, color: textColor, height: 1.3);
      case 'Abril Fatface':
        return GoogleFonts.abrilFatface(
          fontSize: 20,
          color: textColor,
          height: 1.3,
        );
      case 'Fredoka':
        return GoogleFonts.fredoka(fontSize: 20, color: textColor, height: 1.3);
      case 'Bungee':
        return GoogleFonts.bungee(fontSize: 20, color: textColor, height: 1.3);
      case 'Crimson Text':
        return GoogleFonts.crimsonText(
          fontSize: 20,
          color: textColor,
          height: 1.3,
        );
      case 'Lora':
        return GoogleFonts.lora(fontSize: 20, color: textColor, height: 1.3);
      case 'Libre Baskerville':
        return GoogleFonts.libreBaskerville(
          fontSize: 20,
          color: textColor,
          height: 1.3,
        );
      case 'Merriweather':
        return GoogleFonts.merriweather(
          fontSize: 20,
          color: textColor,
          height: 1.3,
        );
      case 'Playfair Display':
        return GoogleFonts.playfairDisplay(
          fontSize: 20,
          color: textColor,
          height: 1.3,
        );
      case 'Bodoni Moda':
        return GoogleFonts.bodoniModa(
          fontSize: 20,
          color: textColor,
          height: 1.3,
        );
      default:
        return GoogleFonts.dancingScript(
          fontSize: 20,
          color: textColor,
          height: 1.3,
        );
    }
  }

  // Get Google Font style for note card hint text
  TextStyle getNoteCardHintStyle() {
    final currentFont = fontsController.currentFont.value;
    final textColor = themeController.isDarkMode.value
        ? Colors.white.withOpacity(0.4)
        : Colors.black.withOpacity(0.4);

    switch (currentFont) {
      case 'Dancing Script':
        return GoogleFonts.dancingScript(
          fontSize: 12,
          color: textColor,
          fontStyle: FontStyle.italic,
        );
      case 'Great Vibes':
        return GoogleFonts.greatVibes(
          fontSize: 12,
          color: textColor,
          fontStyle: FontStyle.italic,
        );
      case 'Satisfy':
        return GoogleFonts.satisfy(
          fontSize: 12,
          color: textColor,
          fontStyle: FontStyle.italic,
        );
      case 'Pacifico':
        return GoogleFonts.pacifico(
          fontSize: 12,
          color: textColor,
          fontStyle: FontStyle.italic,
        );
      case 'Indie Flower':
        return GoogleFonts.indieFlower(
          fontSize: 12,
          color: textColor,
          fontStyle: FontStyle.italic,
        );
      case 'Architects Daughter':
        return GoogleFonts.architectsDaughter(
          fontSize: 12,
          color: textColor,
          fontStyle: FontStyle.italic,
        );
      case 'Kalam':
        return GoogleFonts.kalam(
          fontSize: 12,
          color: textColor,
          fontStyle: FontStyle.italic,
        );
      case 'Roboto':
        return GoogleFonts.roboto(
          fontSize: 12,
          color: textColor,
          fontStyle: FontStyle.italic,
        );
      case 'Open Sans':
        return GoogleFonts.openSans(
          fontSize: 12,
          color: textColor,
          fontStyle: FontStyle.italic,
        );
      case 'Lato':
        return GoogleFonts.lato(
          fontSize: 12,
          color: textColor,
          fontStyle: FontStyle.italic,
        );
      case 'Poppins':
        return GoogleFonts.poppins(
          fontSize: 12,
          color: textColor,
          fontStyle: FontStyle.italic,
        );
      case 'Inter':
        return GoogleFonts.inter(
          fontSize: 12,
          color: textColor,
          fontStyle: FontStyle.italic,
        );
      case 'Nunito':
        return GoogleFonts.nunito(
          fontSize: 12,
          color: textColor,
          fontStyle: FontStyle.italic,
        );
      case 'Montserrat':
        return GoogleFonts.montserrat(
          fontSize: 12,
          color: textColor,
          fontStyle: FontStyle.italic,
        );
      case 'Raleway':
        return GoogleFonts.raleway(
          fontSize: 12,
          color: textColor,
          fontStyle: FontStyle.italic,
        );
      case 'Ubuntu':
        return GoogleFonts.ubuntu(
          fontSize: 12,
          color: textColor,
          fontStyle: FontStyle.italic,
        );
      case 'Bebas Neue':
        return GoogleFonts.bebasNeue(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: textColor,
          fontStyle: FontStyle.italic,
        );
      case 'Lobster':
        return GoogleFonts.lobster(
          fontSize: 12,
          color: textColor,
          fontStyle: FontStyle.italic,
        );
      case 'Righteous':
        return GoogleFonts.righteous(
          fontSize: 12,
          color: textColor,
          fontStyle: FontStyle.italic,
        );
      case 'Bangers':
        return GoogleFonts.bangers(
          fontSize: 12,
          color: textColor,
          fontStyle: FontStyle.italic,
        );
      case 'Abril Fatface':
        return GoogleFonts.abrilFatface(
          fontSize: 12,
          color: textColor,
          fontStyle: FontStyle.italic,
        );
      case 'Fredoka':
        return GoogleFonts.fredoka(
          fontSize: 12,
          color: textColor,
          fontStyle: FontStyle.italic,
        );
      case 'Bungee':
        return GoogleFonts.bungee(
          fontSize: 12,
          color: textColor,
          fontStyle: FontStyle.italic,
        );
      case 'Crimson Text':
        return GoogleFonts.crimsonText(
          fontSize: 12,
          color: textColor,
          fontStyle: FontStyle.italic,
        );
      case 'Lora':
        return GoogleFonts.lora(
          fontSize: 12,
          color: textColor,
          fontStyle: FontStyle.italic,
        );
      case 'Libre Baskerville':
        return GoogleFonts.libreBaskerville(
          fontSize: 12,
          color: textColor,
          fontStyle: FontStyle.italic,
        );
      case 'Merriweather':
        return GoogleFonts.merriweather(
          fontSize: 12,
          color: textColor,
          fontStyle: FontStyle.italic,
        );
      case 'Playfair Display':
        return GoogleFonts.playfairDisplay(
          fontSize: 12,
          color: textColor,
          fontStyle: FontStyle.italic,
        );
      case 'Bodoni Moda':
        return GoogleFonts.bodoniModa(
          fontSize: 12,
          color: textColor,
          fontStyle: FontStyle.italic,
        );
      default:
        return GoogleFonts.dancingScript(
          fontSize: 12,
          color: textColor,
          fontStyle: FontStyle.italic,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final currentCardColors = themeController.isDarkMode.value
          ? darkCardColors
          : cardColors;

      return Scaffold(
        backgroundColor: themeController.backgroundColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          titleSpacing: 0,
          title: Flexible(
            child: Text(
              'My Notes',
              style: getAppBarTitleStyle(),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              textAlign: TextAlign.center,
            ),
          ),
          actions: [
            // Compact action buttons
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Font picker button (smaller size)
                IconButton(
                  onPressed: () {
                    Get.to(
                      () => const FontPickerScreen(),
                      transition: Transition.fadeIn,
                      duration: const Duration(milliseconds: 300),
                    );
                  },
                  icon: Icon(
                    Icons.font_download,
                    color: themeController.iconColor,
                    size: 20,
                  ),
                  tooltip: 'Change Font',
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(
                    minWidth: 32,
                    minHeight: 32,
                  ),
                ),

                // Theme toggle button (smaller size)
                IconButton(
                  onPressed: () {
                    themeController.toggleTheme();
                    Get.snackbar(
                      themeController.isDarkMode.value
                          ? 'Dark Mode'
                          : 'Light Mode',
                      'Theme switched to ${themeController.isDarkMode.value ? 'dark' : 'light'} mode',
                      snackPosition: SnackPosition.TOP,
                      backgroundColor: themeController.isDarkMode.value
                          ? Colors.white
                          : Colors.black87,
                      colorText: themeController.isDarkMode.value
                          ? Colors.black87
                          : Colors.white,
                      icon: Icon(
                        themeController.isDarkMode.value
                            ? Icons.light_mode
                            : Icons.dark_mode,
                        color: themeController.isDarkMode.value
                            ? Colors.black87
                            : Colors.white,
                      ),
                      duration: const Duration(seconds: 2),
                      margin: const EdgeInsets.all(16),
                      borderRadius: 12,
                    );
                  },
                  icon: Icon(
                    themeController.isDarkMode.value
                        ? Icons.light_mode
                        : Icons.dark_mode,
                    color: themeController.iconColor,
                    size: 20,
                  ),
                  tooltip: 'Toggle Theme',
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(
                    minWidth: 32,
                    minHeight: 32,
                  ),
                ),

                // Main menu button (smaller size)
                PopupMenuButton<String>(
                  icon: Icon(
                    Icons.more_vert,
                    color: themeController.iconColor,
                    size: 20,
                  ),
                  tooltip: 'More Options',
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(
                    minWidth: 32,
                    minHeight: 32,
                  ),
                  onSelected: (value) async {
                    if (value == 'refresh') {
                      // Show loading indicator
                      Get.snackbar(
                        'Refreshing',
                        'Reloading notes from device storage...',
                        snackPosition: SnackPosition.TOP,
                        backgroundColor: Colors.blue,
                        colorText: Colors.white,
                        icon: const Icon(Icons.refresh, color: Colors.white),
                        duration: const Duration(seconds: 1),
                        margin: const EdgeInsets.all(16),
                        borderRadius: 12,
                        showProgressIndicator: true,
                        progressIndicatorBackgroundColor: Colors.white,
                        progressIndicatorValueColor:
                            const AlwaysStoppedAnimation<Color>(Colors.blue),
                      );

                      // Refresh from device storage
                      await notesController.refreshNotes();

                      Get.snackbar(
                        'Refreshed',
                        'Notes loaded from device storage',
                        snackPosition: SnackPosition.TOP,
                        backgroundColor: Colors.green,
                        colorText: Colors.white,
                        icon: const Icon(
                          Icons.check_circle,
                          color: Colors.white,
                        ),
                        duration: const Duration(seconds: 2),
                        margin: const EdgeInsets.all(16),
                        borderRadius: 12,
                      );
                    } else if (value == 'force_refresh') {
                      // Force refresh by clearing and reloading
                      Get.snackbar(
                        'Force Refreshing',
                        'Clearing cache and reloading notes...',
                        snackPosition: SnackPosition.TOP,
                        backgroundColor: Colors.orange,
                        colorText: Colors.white,
                        icon: const Icon(Icons.warning, color: Colors.white),
                        duration: const Duration(seconds: 2),
                        margin: const EdgeInsets.all(16),
                        borderRadius: 12,
                      );

                      await notesController.clearAllNotes();
                      await notesController.refreshNotes();

                      Get.snackbar(
                        'Force Refreshed',
                        'Notes cache cleared and reloaded',
                        snackPosition: SnackPosition.TOP,
                        backgroundColor: Colors.green,
                        colorText: Colors.white,
                        icon: const Icon(
                          Icons.check_circle,
                          color: Colors.white,
                        ),
                        duration: const Duration(seconds: 2),
                        margin: const EdgeInsets.all(16),
                        borderRadius: 12,
                      );
                    }
                  },
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      value: 'refresh',
                      child: Row(
                        children: [
                          Icon(Icons.refresh, color: Colors.blue, size: 20),
                          const SizedBox(width: 8),
                          const Text('Refresh Notes'),
                        ],
                      ),
                    ),
                    PopupMenuItem(
                      value: 'force_refresh',
                      child: Row(
                        children: [
                          Icon(Icons.clear_all, color: Colors.orange, size: 20),
                          const SizedBox(width: 8),
                          const Text('Force Refresh (Clear Cache)'),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        body: Obx(() {
          // Show loading indicator while loading from storage
          if (notesController.isLoading.value) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(color: themeController.textColor),
                  const SizedBox(height: 16),
                  Text(
                    'Loading notes from device storage...',
                    style: getInfoTextStyle(fontSize: 16).copyWith(
                      color: themeController.textColor.withOpacity(0.7),
                    ),
                  ),
                ],
              ),
            );
          }

          final notes = notesController.notes;

          if (notes.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.note_add,
                    size: 80,
                    color: themeController.textColor.withOpacity(0.4),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'No notes yet!',
                    style:
                        getInfoTextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ).copyWith(
                          color: themeController.textColor.withOpacity(0.8),
                        ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Tap the + button to create your first note',
                    style: getInfoTextStyle(fontSize: 16).copyWith(
                      color: themeController.textColor.withOpacity(0.6),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Notes are saved to device storage',
                    style: getInfoTextStyle(fontSize: 14).copyWith(
                      color: themeController.textColor.withOpacity(0.5),
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            );
          }

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.9,
              ),
              itemCount: notes.length,
              itemBuilder: (context, index) {
                final note = notes[index];
                final cardColor =
                    currentCardColors[index % currentCardColors.length];

                return GestureDetector(
                  onTap: () {
                    Get.to(
                      () => NotesScreen(
                        title: note.title,
                        description: note.description,
                        color: cardColor,
                      ),
                      transition: Transition.fadeIn,
                    );
                  },
                  onLongPress: () {
                    _showOptionsDialog(context, index, note);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: cardColor,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: themeController.isDarkMode.value
                              ? Colors.black.withOpacity(0.3)
                              : Colors.black.withOpacity(0.1),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            note.title,
                            style: getNoteCardTitleStyle(),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 12),
                          Expanded(
                            child: Text(
                              note.description,
                              style: getNoteCardDescriptionStyle(),
                              maxLines: 6,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                Icons.touch_app,
                                size: 14,
                                color: themeController.isDarkMode.value
                                    ? Colors.white.withOpacity(0.3)
                                    : Colors.black.withOpacity(0.3),
                              ),
                              Expanded(
                                child: Text(
                                  'Long press for options',
                                  style: getNoteCardHintStyle(),
                                  textAlign: TextAlign.right,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        }),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(
              () => const NotesAdding(),
              transition: Transition.fadeIn,
              duration: const Duration(milliseconds: 300),
            );
          },
          backgroundColor: themeController.isDarkMode.value
              ? Colors.white
              : Colors.black87,
          child: Icon(
            Icons.add,
            color: themeController.isDarkMode.value
                ? Colors.black87
                : Colors.white,
          ),
        ),
      );
    });
  }

  void _showDeleteDialog(BuildContext context, int index, String title) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: const Row(
            children: [
              Icon(Icons.delete_outline, color: Colors.black, size: 28),
              SizedBox(width: 8),
              Text(
                'Delete Note',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          content: Text(
            'Are you sure you want to delete "$title"?\n\nThis action cannot be undone.',
            style: const TextStyle(fontSize: 18),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text(
                'Cancel',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                Navigator.of(context).pop();

                try {
                  await notesController.deleteNote(index);

                  // Show success snackbar
                  Get.snackbar(
                    'Deleted',
                    'Note "$title" has been deleted',
                    snackPosition: SnackPosition.TOP,
                    backgroundColor: Colors.black,
                    colorText: Colors.white,
                    icon: const Icon(Icons.delete, color: Colors.white),
                    duration: const Duration(seconds: 3),
                    margin: const EdgeInsets.all(16),
                    borderRadius: 12,
                  );
                } catch (e) {
                  // Show error snackbar
                  Get.snackbar(
                    'Error',
                    'Failed to delete note. Please try again.',
                    snackPosition: SnackPosition.TOP,
                    backgroundColor: Colors.orange,
                    colorText: Colors.white,
                    icon: const Icon(Icons.error, color: Colors.white),
                    duration: const Duration(seconds: 3),
                    margin: const EdgeInsets.all(16),
                    borderRadius: 12,
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Delete',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        );
      },
    );
  }

  void _showOptionsDialog(BuildContext context, int index, dynamic note) {
    // Add safety check for note ID
    if (note?.id == null || note.id.toString().isEmpty) {
      print('Warning: Note at index $index has no valid ID');
      Get.snackbar(
        'Error',
        'This note cannot be edited. Please try refreshing the app.',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        icon: const Icon(Icons.error, color: Colors.white),
        duration: const Duration(seconds: 3),
        margin: const EdgeInsets.all(16),
        borderRadius: 12,
      );
      return;
    }

    showDialog(
      context: context,
      barrierDismissible: true,
      barrierColor: Colors.black54,
      builder: (context) {
        return TweenAnimationBuilder<double>(
          duration: const Duration(milliseconds: 300),
          tween: Tween(begin: 0.0, end: 1.0),
          builder: (context, value, child) {
            return Transform.scale(
              scale: value,
              child: Opacity(
                opacity: value,
                child: Dialog(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  child: Container(
                    constraints: const BoxConstraints(
                      maxWidth: 400,
                      minHeight: 300,
                    ),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: themeController.isDarkMode.value
                            ? [
                                const Color(0xFF2C3E50),
                                const Color(0xFF34495E),
                                const Color(0xFF2C3E50),
                              ]
                            : [
                                Colors.white,
                                const Color(0xFFF8F9FA),
                                Colors.white,
                              ],
                      ),
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: themeController.isDarkMode.value
                              ? Colors.black.withOpacity(0.4)
                              : Colors.black.withOpacity(0.1),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Header with gradient
                        Container(
                          padding: const EdgeInsets.all(24),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: themeController.isDarkMode.value
                                  ? [
                                      const Color(0xFF3498DB),
                                      const Color(0xFF2980B9),
                                    ]
                                  : [
                                      const Color(0xFF667EEA),
                                      const Color(0xFF764BA2),
                                    ],
                            ),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(24),
                              topRight: Radius.circular(24),
                            ),
                          ),
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Icon(
                                  Icons.auto_awesome,
                                  color: Colors.white,
                                  size: 28,
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Text(
                                  'Note Options',
                                  style: getInfoTextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ).copyWith(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Content
                        Padding(
                          padding: const EdgeInsets.all(24),
                          child: Column(
                            children: [
                              // Edit Option
                              _buildOptionTile(
                                context: context,
                                icon: Icons.edit_note,
                                title: 'Edit Note',
                                subtitle: 'Modify your note content',
                                color: const Color(0xFF4CAF50),
                                onTap: () {
                                  Navigator.of(context).pop();
                                  Get.to(
                                    () => NotesEditing(
                                      noteId: note.id.toString(),
                                      initialTitle: note.title ?? 'Untitled',
                                      initialDescription:
                                          note.description ?? '',
                                    ),
                                    transition: Transition.fadeIn,
                                    duration: const Duration(milliseconds: 300),
                                  );
                                },
                              ),

                              const SizedBox(height: 16),

                              // Delete Option
                              _buildOptionTile(
                                context: context,
                                icon: Icons.delete_forever,
                                title: 'Delete Note',
                                subtitle: 'Remove this note permanently',
                                color: const Color(0xFFF44336),
                                onTap: () {
                                  Navigator.of(context).pop();
                                  _showDeleteDialog(
                                    context,
                                    index,
                                    note.title ?? 'Untitled',
                                  );
                                },
                              ),
                            ],
                          ),
                        ),

                        // Footer
                        Container(
                          padding: const EdgeInsets.all(24),
                          decoration: BoxDecoration(
                            color: themeController.isDarkMode.value
                                ? Colors.black.withOpacity(0.1)
                                : Colors.grey.withOpacity(0.05),
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(24),
                              bottomRight: Radius.circular(24),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Long press any note for options',
                                style: getInfoTextStyle(fontSize: 14).copyWith(
                                  color: themeController.textColor.withOpacity(
                                    0.6,
                                  ),
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                              TextButton(
                                onPressed: () => Navigator.of(context).pop(),
                                style: TextButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 24,
                                    vertical: 12,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                child: Text(
                                  'Close',
                                  style:
                                      getInfoTextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ).copyWith(
                                        color: themeController.isDarkMode.value
                                            ? const Color(0xFF3498DB)
                                            : const Color(0xFF667EEA),
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildOptionTile({
    required BuildContext context,
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: themeController.isDarkMode.value
            ? Colors.white.withOpacity(0.05)
            : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: themeController.isDarkMode.value
              ? Colors.white.withOpacity(0.1)
              : Colors.grey.withOpacity(0.2),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: themeController.isDarkMode.value
                ? Colors.black.withOpacity(0.1)
                : Colors.grey.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(icon, color: color, size: 24),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: getInfoTextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        subtitle,
                        style: getInfoTextStyle(fontSize: 14).copyWith(
                          color: themeController.textColor.withOpacity(0.6),
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: themeController.textColor.withOpacity(0.4),
                  size: 16,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
