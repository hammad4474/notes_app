import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/controllers/theme_controller.dart';
import 'package:notes_app/controllers/fonts_controller.dart';
import 'package:google_fonts/google_fonts.dart';

class NotesScreen extends StatefulWidget {
  final String title;
  final String description;
  final Color color;
  const NotesScreen({
    super.key,
    required this.title,
    required this.description,
    required this.color,
  });

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  final ThemeController themeController = Get.find<ThemeController>();
  final FontsController fontsController = Get.find<FontsController>();

  // Get Google Font style for title text
  TextStyle getTitleStyle() {
    final currentFont = fontsController.currentFont.value;
    final textColor = themeController.isDarkMode.value
        ? Colors.white
        : Colors.black87;

    switch (currentFont) {
      case 'Dancing Script':
        return GoogleFonts.dancingScript(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: textColor,
          height: 1.2,
        );
      case 'Great Vibes':
        return GoogleFonts.greatVibes(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: textColor,
          height: 1.2,
        );
      case 'Satisfy':
        return GoogleFonts.satisfy(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: textColor,
          height: 1.2,
        );
      case 'Pacifico':
        return GoogleFonts.pacifico(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: textColor,
          height: 1.2,
        );
      case 'Indie Flower':
        return GoogleFonts.indieFlower(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: textColor,
          height: 1.2,
        );
      case 'Architects Daughter':
        return GoogleFonts.architectsDaughter(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: textColor,
          height: 1.2,
        );
      case 'Kalam':
        return GoogleFonts.kalam(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: textColor,
          height: 1.2,
        );
      case 'Roboto':
        return GoogleFonts.roboto(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: textColor,
          height: 1.2,
        );
      case 'Open Sans':
        return GoogleFonts.openSans(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: textColor,
          height: 1.2,
        );
      case 'Lato':
        return GoogleFonts.lato(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: textColor,
          height: 1.2,
        );
      case 'Poppins':
        return GoogleFonts.poppins(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: textColor,
          height: 1.2,
        );
      case 'Inter':
        return GoogleFonts.inter(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: textColor,
          height: 1.2,
        );
      case 'Nunito':
        return GoogleFonts.nunito(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: textColor,
          height: 1.2,
        );
      case 'Montserrat':
        return GoogleFonts.montserrat(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: textColor,
          height: 1.2,
        );
      case 'Raleway':
        return GoogleFonts.raleway(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: textColor,
          height: 1.2,
        );
      case 'Ubuntu':
        return GoogleFonts.ubuntu(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: textColor,
          height: 1.2,
        );
      case 'Bebas Neue':
        return GoogleFonts.bebasNeue(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: textColor,
          height: 1.2,
        );
      case 'Lobster':
        return GoogleFonts.lobster(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: textColor,
          height: 1.2,
        );
      case 'Righteous':
        return GoogleFonts.righteous(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: textColor,
          height: 1.2,
        );
      case 'Bangers':
        return GoogleFonts.bangers(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: textColor,
          height: 1.2,
        );
      case 'Abril Fatface':
        return GoogleFonts.abrilFatface(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: textColor,
          height: 1.2,
        );
      case 'Fredoka':
        return GoogleFonts.fredoka(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: textColor,
          height: 1.2,
        );
      case 'Bungee':
        return GoogleFonts.bungee(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: textColor,
          height: 1.2,
        );
      case 'Crimson Text':
        return GoogleFonts.crimsonText(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: textColor,
          height: 1.2,
        );
      case 'Lora':
        return GoogleFonts.lora(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: textColor,
          height: 1.2,
        );
      case 'Libre Baskerville':
        return GoogleFonts.libreBaskerville(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: textColor,
          height: 1.2,
        );
      case 'Merriweather':
        return GoogleFonts.merriweather(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: textColor,
          height: 1.2,
        );
      case 'Playfair Display':
        return GoogleFonts.playfairDisplay(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: textColor,
          height: 1.2,
        );
      case 'Bodoni Moda':
        return GoogleFonts.bodoniModa(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: textColor,
          height: 1.2,
        );
      default:
        return GoogleFonts.dancingScript(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: textColor,
          height: 1.2,
        );
    }
  }

  // Get Google Font style for description text
  TextStyle getDescriptionStyle() {
    final currentFont = fontsController.currentFont.value;
    final textColor = themeController.isDarkMode.value
        ? Colors.white
        : Colors.black87;

    switch (currentFont) {
      case 'Dancing Script':
        return GoogleFonts.dancingScript(
          fontSize: 18,
          color: textColor,
          height: 1.5,
          letterSpacing: 0.3,
        );
      case 'Great Vibes':
        return GoogleFonts.greatVibes(
          fontSize: 18,
          color: textColor,
          height: 1.5,
          letterSpacing: 0.3,
        );
      case 'Satisfy':
        return GoogleFonts.satisfy(
          fontSize: 18,
          color: textColor,
          height: 1.5,
          letterSpacing: 0.3,
        );
      case 'Pacifico':
        return GoogleFonts.pacifico(
          fontSize: 18,
          color: textColor,
          height: 1.5,
          letterSpacing: 0.3,
        );
      case 'Indie Flower':
        return GoogleFonts.indieFlower(
          fontSize: 18,
          color: textColor,
          height: 1.5,
          letterSpacing: 0.3,
        );
      case 'Architects Daughter':
        return GoogleFonts.architectsDaughter(
          fontSize: 18,
          color: textColor,
          height: 1.5,
          letterSpacing: 0.3,
        );
      case 'Kalam':
        return GoogleFonts.kalam(
          fontSize: 18,
          color: textColor,
          height: 1.5,
          letterSpacing: 0.3,
        );
      case 'Roboto':
        return GoogleFonts.roboto(
          fontSize: 18,
          color: textColor,
          height: 1.5,
          letterSpacing: 0.3,
        );
      case 'Open Sans':
        return GoogleFonts.openSans(
          fontSize: 18,
          color: textColor,
          height: 1.5,
          letterSpacing: 0.3,
        );
      case 'Lato':
        return GoogleFonts.lato(
          fontSize: 18,
          color: textColor,
          height: 1.5,
          letterSpacing: 0.3,
        );
      case 'Poppins':
        return GoogleFonts.poppins(
          fontSize: 18,
          color: textColor,
          height: 1.5,
          letterSpacing: 0.3,
        );
      case 'Inter':
        return GoogleFonts.inter(
          fontSize: 18,
          color: textColor,
          height: 1.5,
          letterSpacing: 0.3,
        );
      case 'Nunito':
        return GoogleFonts.nunito(
          fontSize: 18,
          color: textColor,
          height: 1.5,
          letterSpacing: 0.3,
        );
      case 'Montserrat':
        return GoogleFonts.montserrat(
          fontSize: 18,
          color: textColor,
          height: 1.5,
          letterSpacing: 0.3,
        );
      case 'Raleway':
        return GoogleFonts.raleway(
          fontSize: 18,
          color: textColor,
          height: 1.5,
          letterSpacing: 0.3,
        );
      case 'Ubuntu':
        return GoogleFonts.ubuntu(
          fontSize: 18,
          color: textColor,
          height: 1.5,
          letterSpacing: 0.3,
        );
      case 'Bebas Neue':
        return GoogleFonts.bebasNeue(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: textColor,
          height: 1.5,
          letterSpacing: 0.3,
        );
      case 'Lobster':
        return GoogleFonts.lobster(
          fontSize: 18,
          color: textColor,
          height: 1.5,
          letterSpacing: 0.3,
        );
      case 'Righteous':
        return GoogleFonts.righteous(
          fontSize: 18,
          color: textColor,
          height: 1.5,
          letterSpacing: 0.3,
        );
      case 'Bangers':
        return GoogleFonts.bangers(
          fontSize: 18,
          color: textColor,
          height: 1.5,
          letterSpacing: 0.3,
        );
      case 'Abril Fatface':
        return GoogleFonts.abrilFatface(
          fontSize: 18,
          color: textColor,
          height: 1.5,
          letterSpacing: 0.3,
        );
      case 'Fredoka':
        return GoogleFonts.fredoka(
          fontSize: 18,
          color: textColor,
          height: 1.5,
          letterSpacing: 0.3,
        );
      case 'Bungee':
        return GoogleFonts.bungee(
          fontSize: 18,
          color: textColor,
          height: 1.5,
          letterSpacing: 0.3,
        );
      case 'Crimson Text':
        return GoogleFonts.crimsonText(
          fontSize: 18,
          color: textColor,
          height: 1.5,
          letterSpacing: 0.3,
        );
      case 'Lora':
        return GoogleFonts.lora(
          fontSize: 18,
          color: textColor,
          height: 1.5,
          letterSpacing: 0.3,
        );
      case 'Libre Baskerville':
        return GoogleFonts.libreBaskerville(
          fontSize: 18,
          color: textColor,
          height: 1.5,
          letterSpacing: 0.3,
        );
      case 'Merriweather':
        return GoogleFonts.merriweather(
          fontSize: 18,
          color: textColor,
          height: 1.5,
          letterSpacing: 0.3,
        );
      case 'Playfair Display':
        return GoogleFonts.playfairDisplay(
          fontSize: 18,
          color: textColor,
          height: 1.5,
          letterSpacing: 0.3,
        );
      case 'Bodoni Moda':
        return GoogleFonts.bodoniModa(
          fontSize: 18,
          color: textColor,
          height: 1.5,
          letterSpacing: 0.3,
        );
      default:
        return GoogleFonts.dancingScript(
          fontSize: 18,
          color: textColor,
          height: 1.5,
          letterSpacing: 0.3,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: themeController.backgroundColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: themeController.iconColor),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Container(
              constraints: BoxConstraints(
                minWidth: 280,
                maxWidth: MediaQuery.of(context).size.width * 0.9,
                minHeight: 200,
                maxHeight: MediaQuery.of(context).size.height * 0.8,
              ),
              decoration: BoxDecoration(
                color: widget.color,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: themeController.isDarkMode.value
                        ? Colors.black.withOpacity(0.3)
                        : Colors.black.withOpacity(0.1),
                    blurRadius: 15,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    Text(widget.title, style: getTitleStyle()),
                    const SizedBox(height: 20),

                    // Divider
                    Container(
                      height: 3,
                      width: 50,
                      decoration: BoxDecoration(
                        color: themeController.isDarkMode.value
                            ? Colors.white.withOpacity(0.3)
                            : Colors.black.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Description
                    Flexible(
                      child: SingleChildScrollView(
                        child: Text(
                          widget.description,
                          style: getDescriptionStyle(),
                        ),
                      ),
                    ),

                    // Bottom spacing for better visual balance
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
