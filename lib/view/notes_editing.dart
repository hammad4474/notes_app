import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/controllers/adding_notes_controller.dart';
import 'package:notes_app/controllers/theme_controller.dart';
import 'package:notes_app/controllers/fonts_controller.dart';
import 'package:google_fonts/google_fonts.dart';

class NotesEditing extends StatefulWidget {
  final String noteId;
  final String initialTitle;
  final String initialDescription;

  const NotesEditing({
    super.key,
    required this.noteId,
    required this.initialTitle,
    required this.initialDescription,
  });

  @override
  State<NotesEditing> createState() => _NotesEditingState();
}

class _NotesEditingState extends State<NotesEditing> {
  final NotesController notesController = Get.find<NotesController>();
  final ThemeController themeController = Get.find<ThemeController>();
  final FontsController fontsController = Get.find<FontsController>();
  late TextEditingController titleController;
  late TextEditingController descriptionController;
  bool isSaving = false;

  // Get Google Font style for app bar title
  TextStyle getAppBarTitleStyle() {
    final currentFont = fontsController.currentFont.value;
    final textColor = themeController.textColor;

    switch (currentFont) {
      case 'Dancing Script':
        return GoogleFonts.dancingScript(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Great Vibes':
        return GoogleFonts.greatVibes(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Satisfy':
        return GoogleFonts.satisfy(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Pacifico':
        return GoogleFonts.pacifico(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Indie Flower':
        return GoogleFonts.indieFlower(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Architects Daughter':
        return GoogleFonts.architectsDaughter(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Kalam':
        return GoogleFonts.kalam(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Roboto':
        return GoogleFonts.roboto(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Open Sans':
        return GoogleFonts.openSans(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Lato':
        return GoogleFonts.lato(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Poppins':
        return GoogleFonts.poppins(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Inter':
        return GoogleFonts.inter(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Nunito':
        return GoogleFonts.nunito(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Montserrat':
        return GoogleFonts.montserrat(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Raleway':
        return GoogleFonts.raleway(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Ubuntu':
        return GoogleFonts.ubuntu(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Bebas Neue':
        return GoogleFonts.bebasNeue(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Lobster':
        return GoogleFonts.lobster(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Righteous':
        return GoogleFonts.righteous(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Bangers':
        return GoogleFonts.bangers(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Abril Fatface':
        return GoogleFonts.abrilFatface(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Fredoka':
        return GoogleFonts.fredoka(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Bungee':
        return GoogleFonts.bungee(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Crimson Text':
        return GoogleFonts.crimsonText(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Lora':
        return GoogleFonts.lora(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Libre Baskerville':
        return GoogleFonts.libreBaskerville(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Merriweather':
        return GoogleFonts.merriweather(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Playfair Display':
        return GoogleFonts.playfairDisplay(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Bodoni Moda':
        return GoogleFonts.bodoniModa(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      default:
        return GoogleFonts.dancingScript(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
    }
  }

  // Get Google Font style for labels (Title, Description)
  TextStyle getLabelStyle() {
    final currentFont = fontsController.currentFont.value;
    final textColor = themeController.textColor;

    switch (currentFont) {
      case 'Dancing Script':
        return GoogleFonts.dancingScript(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: textColor,
        );
      case 'Great Vibes':
        return GoogleFonts.greatVibes(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: textColor,
        );
      case 'Satisfy':
        return GoogleFonts.satisfy(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: textColor,
        );
      case 'Pacifico':
        return GoogleFonts.pacifico(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: textColor,
        );
      case 'Indie Flower':
        return GoogleFonts.indieFlower(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: textColor,
        );
      case 'Architects Daughter':
        return GoogleFonts.architectsDaughter(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: textColor,
        );
      case 'Kalam':
        return GoogleFonts.kalam(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: textColor,
        );
      case 'Roboto':
        return GoogleFonts.roboto(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: textColor,
        );
      case 'Open Sans':
        return GoogleFonts.openSans(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: textColor,
        );
      case 'Lato':
        return GoogleFonts.lato(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: textColor,
        );
      case 'Poppins':
        return GoogleFonts.poppins(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: textColor,
        );
      case 'Inter':
        return GoogleFonts.inter(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: textColor,
        );
      case 'Nunito':
        return GoogleFonts.nunito(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: textColor,
        );
      case 'Montserrat':
        return GoogleFonts.montserrat(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: textColor,
        );
      case 'Raleway':
        return GoogleFonts.raleway(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: textColor,
        );
      case 'Ubuntu':
        return GoogleFonts.ubuntu(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: textColor,
        );
      case 'Bebas Neue':
        return GoogleFonts.bebasNeue(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: textColor,
        );
      case 'Lobster':
        return GoogleFonts.lobster(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: textColor,
        );
      case 'Righteous':
        return GoogleFonts.righteous(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: textColor,
        );
      case 'Bangers':
        return GoogleFonts.bangers(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: textColor,
        );
      case 'Abril Fatface':
        return GoogleFonts.abrilFatface(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: textColor,
        );
      case 'Fredoka':
        return GoogleFonts.fredoka(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: textColor,
        );
      case 'Bungee':
        return GoogleFonts.bungee(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: textColor,
        );
      case 'Crimson Text':
        return GoogleFonts.crimsonText(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: textColor,
        );
      case 'Lora':
        return GoogleFonts.lora(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: textColor,
        );
      case 'Libre Baskerville':
        return GoogleFonts.libreBaskerville(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: textColor,
        );
      case 'Merriweather':
        return GoogleFonts.merriweather(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: textColor,
        );
      case 'Playfair Display':
        return GoogleFonts.playfairDisplay(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: textColor,
        );
      case 'Bodoni Moda':
        return GoogleFonts.bodoniModa(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: textColor,
        );
      default:
        return GoogleFonts.dancingScript(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: textColor,
        );
    }
  }

  // Get Google Font style for title field
  TextStyle getTitleFieldStyle() {
    final currentFont = fontsController.currentFont.value;
    final textColor = themeController.textColor;

    switch (currentFont) {
      case 'Dancing Script':
        return GoogleFonts.dancingScript(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: textColor,
        );
      case 'Great Vibes':
        return GoogleFonts.greatVibes(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: textColor,
        );
      case 'Satisfy':
        return GoogleFonts.satisfy(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: textColor,
        );
      case 'Pacifico':
        return GoogleFonts.pacifico(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: textColor,
        );
      case 'Indie Flower':
        return GoogleFonts.indieFlower(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: textColor,
        );
      case 'Architects Daughter':
        return GoogleFonts.architectsDaughter(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: textColor,
        );
      case 'Kalam':
        return GoogleFonts.kalam(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: textColor,
        );
      case 'Roboto':
        return GoogleFonts.roboto(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: textColor,
        );
      case 'Open Sans':
        return GoogleFonts.openSans(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: textColor,
        );
      case 'Lato':
        return GoogleFonts.lato(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: textColor,
        );
      case 'Poppins':
        return GoogleFonts.poppins(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: textColor,
        );
      case 'Inter':
        return GoogleFonts.inter(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: textColor,
        );
      case 'Nunito':
        return GoogleFonts.nunito(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: textColor,
        );
      case 'Montserrat':
        return GoogleFonts.montserrat(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: textColor,
        );
      case 'Raleway':
        return GoogleFonts.raleway(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: textColor,
        );
      case 'Ubuntu':
        return GoogleFonts.ubuntu(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: textColor,
        );
      case 'Bebas Neue':
        return GoogleFonts.bebasNeue(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: textColor,
        );
      case 'Lobster':
        return GoogleFonts.lobster(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: textColor,
        );
      case 'Righteous':
        return GoogleFonts.righteous(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: textColor,
        );
      case 'Bangers':
        return GoogleFonts.bangers(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: textColor,
        );
      case 'Abril Fatface':
        return GoogleFonts.abrilFatface(
          fontSize: 24,
          fontWeight: FontWeight.w600,
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
          fontWeight: FontWeight.w600,
          color: textColor,
        );
      case 'Crimson Text':
        return GoogleFonts.crimsonText(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: textColor,
        );
      case 'Lora':
        return GoogleFonts.lora(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: textColor,
        );
      case 'Libre Baskerville':
        return GoogleFonts.libreBaskerville(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: textColor,
        );
      case 'Merriweather':
        return GoogleFonts.merriweather(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: textColor,
        );
      case 'Playfair Display':
        return GoogleFonts.playfairDisplay(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: textColor,
        );
      case 'Bodoni Moda':
        return GoogleFonts.bodoniModa(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: textColor,
        );
      default:
        return GoogleFonts.dancingScript(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: textColor,
        );
    }
  }

  // Get Google Font style for description field
  TextStyle getDescriptionFieldStyle() {
    final currentFont = fontsController.currentFont.value;
    final textColor = themeController.textColor;

    switch (currentFont) {
      case 'Dancing Script':
        return GoogleFonts.dancingScript(
          fontSize: 18,
          color: textColor,
          height: 1.5,
        );
      case 'Great Vibes':
        return GoogleFonts.greatVibes(
          fontSize: 18,
          color: textColor,
          height: 1.5,
        );
      case 'Satisfy':
        return GoogleFonts.satisfy(fontSize: 18, color: textColor, height: 1.5);
      case 'Pacifico':
        return GoogleFonts.pacifico(
          fontSize: 18,
          color: textColor,
          height: 1.5,
        );
      case 'Indie Flower':
        return GoogleFonts.indieFlower(
          fontSize: 18,
          color: textColor,
          height: 1.5,
        );
      case 'Architects Daughter':
        return GoogleFonts.architectsDaughter(
          fontSize: 18,
          color: textColor,
          height: 1.5,
        );
      case 'Kalam':
        return GoogleFonts.kalam(fontSize: 18, color: textColor, height: 1.5);
      case 'Roboto':
        return GoogleFonts.roboto(fontSize: 18, color: textColor, height: 1.5);
      case 'Open Sans':
        return GoogleFonts.openSans(
          fontSize: 18,
          color: textColor,
          height: 1.5,
        );
      case 'Lato':
        return GoogleFonts.lato(fontSize: 18, color: textColor, height: 1.5);
      case 'Poppins':
        return GoogleFonts.poppins(fontSize: 18, color: textColor, height: 1.5);
      case 'Inter':
        return GoogleFonts.inter(fontSize: 18, color: textColor, height: 1.5);
      case 'Nunito':
        return GoogleFonts.nunito(fontSize: 18, color: textColor, height: 1.5);
      case 'Montserrat':
        return GoogleFonts.montserrat(
          fontSize: 18,
          color: textColor,
          height: 1.5,
        );
      case 'Raleway':
        return GoogleFonts.raleway(fontSize: 18, color: textColor, height: 1.5);
      case 'Ubuntu':
        return GoogleFonts.ubuntu(fontSize: 18, color: textColor, height: 1.5);
      case 'Bebas Neue':
        return GoogleFonts.bebasNeue(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: textColor,
          height: 1.5,
        );
      case 'Lobster':
        return GoogleFonts.lobster(fontSize: 18, color: textColor, height: 1.5);
      case 'Righteous':
        return GoogleFonts.righteous(
          fontSize: 18,
          color: textColor,
          height: 1.5,
        );
      case 'Bangers':
        return GoogleFonts.bangers(fontSize: 18, color: textColor, height: 1.5);
      case 'Abril Fatface':
        return GoogleFonts.abrilFatface(
          fontSize: 18,
          color: textColor,
          height: 1.5,
        );
      case 'Fredoka':
        return GoogleFonts.fredoka(fontSize: 18, color: textColor, height: 1.5);
      case 'Bungee':
        return GoogleFonts.bungee(fontSize: 18, color: textColor, height: 1.5);
      case 'Crimson Text':
        return GoogleFonts.crimsonText(
          fontSize: 18,
          color: textColor,
          height: 1.5,
        );
      case 'Lora':
        return GoogleFonts.lora(fontSize: 18, color: textColor, height: 1.5);
      case 'Libre Baskerville':
        return GoogleFonts.libreBaskerville(
          fontSize: 18,
          color: textColor,
          height: 1.5,
        );
      case 'Merriweather':
        return GoogleFonts.merriweather(
          fontSize: 18,
          color: textColor,
          height: 1.5,
        );
      case 'Playfair Display':
        return GoogleFonts.playfairDisplay(
          fontSize: 18,
          color: textColor,
          height: 1.5,
        );
      case 'Bodoni Moda':
        return GoogleFonts.bodoniModa(
          fontSize: 18,
          color: textColor,
          height: 1.5,
        );
      default:
        return GoogleFonts.dancingScript(
          fontSize: 18,
          color: textColor,
          height: 1.5,
        );
    }
  }

  // Get Google Font style for button text
  TextStyle getButtonTextStyle() {
    final currentFont = fontsController.currentFont.value;
    final textColor = themeController.isDarkMode.value
        ? Colors.black87
        : Colors.white;

    switch (currentFont) {
      case 'Dancing Script':
        return GoogleFonts.dancingScript(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: textColor,
        );
      case 'Great Vibes':
        return GoogleFonts.greatVibes(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: textColor,
        );
      case 'Satisfy':
        return GoogleFonts.satisfy(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: textColor,
        );
      case 'Pacifico':
        return GoogleFonts.pacifico(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: textColor,
        );
      case 'Indie Flower':
        return GoogleFonts.indieFlower(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: textColor,
        );
      case 'Architects Daughter':
        return GoogleFonts.architectsDaughter(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: textColor,
        );
      case 'Kalam':
        return GoogleFonts.kalam(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: textColor,
        );
      case 'Roboto':
        return GoogleFonts.roboto(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: textColor,
        );
      case 'Open Sans':
        return GoogleFonts.openSans(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: textColor,
        );
      case 'Lato':
        return GoogleFonts.lato(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: textColor,
        );
      case 'Poppins':
        return GoogleFonts.poppins(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: textColor,
        );
      case 'Inter':
        return GoogleFonts.inter(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: textColor,
        );
      case 'Nunito':
        return GoogleFonts.nunito(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: textColor,
        );
      case 'Montserrat':
        return GoogleFonts.montserrat(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: textColor,
        );
      case 'Raleway':
        return GoogleFonts.raleway(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: textColor,
        );
      case 'Ubuntu':
        return GoogleFonts.ubuntu(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: textColor,
        );
      case 'Bebas Neue':
        return GoogleFonts.bebasNeue(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: textColor,
        );
      case 'Lobster':
        return GoogleFonts.lobster(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: textColor,
        );
      case 'Righteous':
        return GoogleFonts.righteous(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: textColor,
        );
      case 'Bangers':
        return GoogleFonts.bangers(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: textColor,
        );
      case 'Abril Fatface':
        return GoogleFonts.abrilFatface(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: textColor,
        );
      case 'Fredoka':
        return GoogleFonts.fredoka(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: textColor,
        );
      case 'Bungee':
        return GoogleFonts.bungee(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: textColor,
        );
      case 'Crimson Text':
        return GoogleFonts.crimsonText(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: textColor,
        );
      case 'Lora':
        return GoogleFonts.lora(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: textColor,
        );
      case 'Libre Baskerville':
        return GoogleFonts.libreBaskerville(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: textColor,
        );
      case 'Merriweather':
        return GoogleFonts.merriweather(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: textColor,
        );
      case 'Playfair Display':
        return GoogleFonts.playfairDisplay(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: textColor,
        );
      case 'Bodoni Moda':
        return GoogleFonts.bodoniModa(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: textColor,
        );
      default:
        return GoogleFonts.dancingScript(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: textColor,
        );
    }
  }

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.initialTitle);
    descriptionController = TextEditingController(
      text: widget.initialDescription,
    );
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  Future<void> _saveChanges() async {
    if (titleController.text.trim().isEmpty &&
        descriptionController.text.trim().isEmpty) {
      Get.snackbar(
        'Error',
        'Title and description cannot both be empty',
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

    setState(() {
      isSaving = true;
    });

    try {
      await notesController.updateNote(
        widget.noteId,
        titleController.text,
        descriptionController.text,
      );

      Get.snackbar(
        'Success',
        'Note updated successfully',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.green,
        colorText: Colors.white,
        icon: const Icon(Icons.check_circle, color: Colors.white),
        duration: const Duration(seconds: 2),
        margin: const EdgeInsets.all(16),
        borderRadius: 12,
      );

      Get.back();
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to update note. Please try again.',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        icon: const Icon(Icons.error, color: Colors.white),
        duration: const Duration(seconds: 3),
        margin: const EdgeInsets.all(16),
        borderRadius: 12,
      );
    } finally {
      setState(() {
        isSaving = false;
      });
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
            onPressed: () => Get.back(),
          ),
          title: Text('Edit Note', style: getAppBarTitleStyle()),
          actions: [
            TextButton(
              onPressed: isSaving ? null : _saveChanges,
              child: isSaving
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Colors.black87,
                        ),
                      ),
                    )
                  : Text(
                      'Save',
                      style: getButtonTextStyle().copyWith(
                        color: themeController.textColor,
                      ),
                    ),
            ),
            const SizedBox(width: 16),
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title Field
              Text('Title', style: getLabelStyle()),
              const SizedBox(height: 12),
              Container(
                decoration: BoxDecoration(
                  color: themeController.cardColor,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: themeController.isDarkMode.value
                          ? Colors.black.withOpacity(0.2)
                          : Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: TextField(
                  controller: titleController,
                  style: getTitleFieldStyle(),
                  decoration: InputDecoration(
                    hintText: 'Enter note title...',
                    hintStyle: getTitleFieldStyle().copyWith(
                      color: themeController.textColor.withOpacity(0.6),
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(20),
                  ),
                  maxLines: 2,
                ),
              ),
              const SizedBox(height: 32),

              // Description Field
              Text('Description', style: getLabelStyle()),
              const SizedBox(height: 12),
              Container(
                height: 300,
                decoration: BoxDecoration(
                  color: themeController.cardColor,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: themeController.isDarkMode.value
                          ? Colors.black.withOpacity(0.2)
                          : Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: TextField(
                  controller: descriptionController,
                  style: getDescriptionFieldStyle(),
                  decoration: InputDecoration(
                    hintText: 'Write your note here...',
                    hintStyle: getDescriptionFieldStyle().copyWith(
                      color: themeController.textColor.withOpacity(0.6),
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(20),
                  ),
                  maxLines: null,
                  expands: true,
                  textAlignVertical: TextAlignVertical.top,
                ),
              ),
              const SizedBox(height: 40),

              // Save Button
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: isSaving ? null : _saveChanges,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: themeController.isDarkMode.value
                        ? Colors.white
                        : Colors.black87,
                    foregroundColor: themeController.isDarkMode.value
                        ? Colors.black87
                        : Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 4,
                  ),
                  child: isSaving
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(width: 12),
                            Text('Saving...', style: getButtonTextStyle()),
                          ],
                        )
                      : Text('Save Changes', style: getButtonTextStyle()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
