import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:get/get.dart';
import 'package:notes_app/view/home_screen.dart';
import 'package:notes_app/controllers/theme_controller.dart';
import 'package:notes_app/controllers/fonts_controller.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final ThemeController themeController = Get.find<ThemeController>();
  final FontsController fontsController = Get.find<FontsController>();

  // Get Google Font style for splash screen text
  TextStyle getSplashTextStyle() {
    final currentFont = fontsController.currentFont.value;
    final textColor = themeController.textColor;

    switch (currentFont) {
      case 'Dancing Script':
        return GoogleFonts.dancingScript(
          fontSize: 50,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Great Vibes':
        return GoogleFonts.greatVibes(
          fontSize: 50,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Satisfy':
        return GoogleFonts.satisfy(
          fontSize: 50,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Pacifico':
        return GoogleFonts.pacifico(
          fontSize: 50,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Indie Flower':
        return GoogleFonts.indieFlower(
          fontSize: 50,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Architects Daughter':
        return GoogleFonts.architectsDaughter(
          fontSize: 50,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Kalam':
        return GoogleFonts.kalam(
          fontSize: 50,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Roboto':
        return GoogleFonts.roboto(
          fontSize: 50,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Open Sans':
        return GoogleFonts.openSans(
          fontSize: 50,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Lato':
        return GoogleFonts.lato(
          fontSize: 50,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Poppins':
        return GoogleFonts.poppins(
          fontSize: 50,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Inter':
        return GoogleFonts.inter(
          fontSize: 50,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Nunito':
        return GoogleFonts.nunito(
          fontSize: 50,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Montserrat':
        return GoogleFonts.montserrat(
          fontSize: 50,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Raleway':
        return GoogleFonts.raleway(
          fontSize: 50,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Ubuntu':
        return GoogleFonts.ubuntu(
          fontSize: 50,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Bebas Neue':
        return GoogleFonts.bebasNeue(
          fontSize: 50,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Lobster':
        return GoogleFonts.lobster(
          fontSize: 50,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Righteous':
        return GoogleFonts.righteous(
          fontSize: 50,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Bangers':
        return GoogleFonts.bangers(
          fontSize: 50,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Abril Fatface':
        return GoogleFonts.abrilFatface(
          fontSize: 50,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Fredoka':
        return GoogleFonts.fredoka(
          fontSize: 50,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Bungee':
        return GoogleFonts.bungee(
          fontSize: 50,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Crimson Text':
        return GoogleFonts.crimsonText(
          fontSize: 50,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Lora':
        return GoogleFonts.lora(
          fontSize: 50,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Libre Baskerville':
        return GoogleFonts.libreBaskerville(
          fontSize: 50,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Merriweather':
        return GoogleFonts.merriweather(
          fontSize: 50,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Playfair Display':
        return GoogleFonts.playfairDisplay(
          fontSize: 50,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Bodoni Moda':
        return GoogleFonts.bodoniModa(
          fontSize: 50,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      default:
        return GoogleFonts.dancingScript(
          fontSize: 50,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
    }
  }

  @override
  void initState() {
    super.initState();
    // Navigate to home screen after animation completes
    Future.delayed(const Duration(seconds: 6), () {
      Get.off(() => const HomeScreen(), transition: Transition.fadeIn);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: themeController.backgroundColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/notes.png', width: 200, height: 200),
              const SizedBox(height: 30),
              AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                    'Let\'s write...',
                    textStyle: getSplashTextStyle(),
                    speed: const Duration(milliseconds: 150),
                  ),
                ],
                totalRepeatCount: 1,
                pause: const Duration(milliseconds: 500),
                displayFullTextOnTap: true,
                stopPauseOnTap: true,
              ),
              const SizedBox(height: 20),
              AnimatedTextKit(
                animatedTexts: [
                  FadeAnimatedText(
                    'Your ideas matter',
                    textStyle: TextStyle(
                      fontSize: 30,
                      color: themeController.textColor.withOpacity(0.7),
                    ),
                    duration: const Duration(milliseconds: 2000),
                  ),
                ],
                totalRepeatCount: 1,
                pause: const Duration(milliseconds: 500),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
