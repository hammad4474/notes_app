import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/controllers/adding_notes_controller.dart';
import 'package:notes_app/controllers/theme_controller.dart';
import 'package:notes_app/controllers/fonts_controller.dart';
import 'package:notes_app/view/home_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class NotesAdding extends StatefulWidget {
  const NotesAdding({super.key});

  @override
  State<NotesAdding> createState() => _NotesAddingState();
}

class _NotesAddingState extends State<NotesAdding> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final NotesController notesController = Get.find<NotesController>();
  final ThemeController themeController = Get.find<ThemeController>();
  final FontsController fontsController = Get.find<FontsController>();

  // Get Google Font style for app bar title
  TextStyle getAppBarTitleStyle() {
    final currentFont = fontsController.currentFont.value;
    final textColor = themeController.textColor;

    switch (currentFont) {
      case 'Dancing Script':
        return GoogleFonts.dancingScript(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Great Vibes':
        return GoogleFonts.greatVibes(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Satisfy':
        return GoogleFonts.satisfy(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Pacifico':
        return GoogleFonts.pacifico(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Indie Flower':
        return GoogleFonts.indieFlower(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Architects Daughter':
        return GoogleFonts.architectsDaughter(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Kalam':
        return GoogleFonts.kalam(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Roboto':
        return GoogleFonts.roboto(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Open Sans':
        return GoogleFonts.openSans(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Lato':
        return GoogleFonts.lato(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Poppins':
        return GoogleFonts.poppins(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Inter':
        return GoogleFonts.inter(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Nunito':
        return GoogleFonts.nunito(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Montserrat':
        return GoogleFonts.montserrat(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Raleway':
        return GoogleFonts.raleway(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Ubuntu':
        return GoogleFonts.ubuntu(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Bebas Neue':
        return GoogleFonts.bebasNeue(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Lobster':
        return GoogleFonts.lobster(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Righteous':
        return GoogleFonts.righteous(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Bangers':
        return GoogleFonts.bangers(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Abril Fatface':
        return GoogleFonts.abrilFatface(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Fredoka':
        return GoogleFonts.fredoka(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Bungee':
        return GoogleFonts.bungee(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Crimson Text':
        return GoogleFonts.crimsonText(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Lora':
        return GoogleFonts.lora(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Libre Baskerville':
        return GoogleFonts.libreBaskerville(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Merriweather':
        return GoogleFonts.merriweather(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Playfair Display':
        return GoogleFonts.playfairDisplay(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Bodoni Moda':
        return GoogleFonts.bodoniModa(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      default:
        return GoogleFonts.dancingScript(
          fontSize: 20,
          fontWeight: FontWeight.bold,
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
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Great Vibes':
        return GoogleFonts.greatVibes(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Satisfy':
        return GoogleFonts.satisfy(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Pacifico':
        return GoogleFonts.pacifico(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Indie Flower':
        return GoogleFonts.indieFlower(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Architects Daughter':
        return GoogleFonts.architectsDaughter(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Kalam':
        return GoogleFonts.kalam(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Roboto':
        return GoogleFonts.roboto(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Open Sans':
        return GoogleFonts.openSans(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Lato':
        return GoogleFonts.lato(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Poppins':
        return GoogleFonts.poppins(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Inter':
        return GoogleFonts.inter(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Nunito':
        return GoogleFonts.nunito(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Montserrat':
        return GoogleFonts.montserrat(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Raleway':
        return GoogleFonts.raleway(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Ubuntu':
        return GoogleFonts.ubuntu(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Bebas Neue':
        return GoogleFonts.bebasNeue(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Lobster':
        return GoogleFonts.lobster(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Righteous':
        return GoogleFonts.righteous(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Bangers':
        return GoogleFonts.bangers(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Abril Fatface':
        return GoogleFonts.abrilFatface(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Fredoka':
        return GoogleFonts.fredoka(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Bungee':
        return GoogleFonts.bungee(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Crimson Text':
        return GoogleFonts.crimsonText(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Lora':
        return GoogleFonts.lora(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Libre Baskerville':
        return GoogleFonts.libreBaskerville(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Merriweather':
        return GoogleFonts.merriweather(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Playfair Display':
        return GoogleFonts.playfairDisplay(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Bodoni Moda':
        return GoogleFonts.bodoniModa(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      default:
        return GoogleFonts.dancingScript(
          fontSize: 25,
          fontWeight: FontWeight.bold,
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
          fontSize: 22,
          fontWeight: FontWeight.normal,
          color: textColor,
        );
      case 'Great Vibes':
        return GoogleFonts.greatVibes(
          fontSize: 22,
          fontWeight: FontWeight.normal,
          color: textColor,
        );
      case 'Satisfy':
        return GoogleFonts.satisfy(
          fontSize: 22,
          fontWeight: FontWeight.normal,
          color: textColor,
        );
      case 'Pacifico':
        return GoogleFonts.pacifico(
          fontSize: 22,
          fontWeight: FontWeight.normal,
          color: textColor,
        );
      case 'Indie Flower':
        return GoogleFonts.indieFlower(
          fontSize: 22,
          fontWeight: FontWeight.normal,
          color: textColor,
        );
      case 'Architects Daughter':
        return GoogleFonts.architectsDaughter(
          fontSize: 22,
          fontWeight: FontWeight.normal,
          color: textColor,
        );
      case 'Kalam':
        return GoogleFonts.kalam(
          fontSize: 22,
          fontWeight: FontWeight.normal,
          color: textColor,
        );
      case 'Roboto':
        return GoogleFonts.roboto(
          fontSize: 22,
          fontWeight: FontWeight.normal,
          color: textColor,
        );
      case 'Open Sans':
        return GoogleFonts.openSans(
          fontSize: 22,
          fontWeight: FontWeight.normal,
          color: textColor,
        );
      case 'Lato':
        return GoogleFonts.lato(
          fontSize: 22,
          fontWeight: FontWeight.normal,
          color: textColor,
        );
      case 'Poppins':
        return GoogleFonts.poppins(
          fontSize: 22,
          fontWeight: FontWeight.normal,
          color: textColor,
        );
      case 'Inter':
        return GoogleFonts.inter(
          fontSize: 22,
          fontWeight: FontWeight.normal,
          color: textColor,
        );
      case 'Nunito':
        return GoogleFonts.nunito(
          fontSize: 22,
          fontWeight: FontWeight.normal,
          color: textColor,
        );
      case 'Montserrat':
        return GoogleFonts.montserrat(
          fontSize: 22,
          fontWeight: FontWeight.normal,
          color: textColor,
        );
      case 'Raleway':
        return GoogleFonts.raleway(
          fontSize: 22,
          fontWeight: FontWeight.normal,
          color: textColor,
        );
      case 'Ubuntu':
        return GoogleFonts.ubuntu(
          fontSize: 22,
          fontWeight: FontWeight.normal,
          color: textColor,
        );
      case 'Bebas Neue':
        return GoogleFonts.bebasNeue(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Lobster':
        return GoogleFonts.lobster(
          fontSize: 22,
          fontWeight: FontWeight.normal,
          color: textColor,
        );
      case 'Righteous':
        return GoogleFonts.righteous(
          fontSize: 22,
          fontWeight: FontWeight.normal,
          color: textColor,
        );
      case 'Bangers':
        return GoogleFonts.bangers(
          fontSize: 22,
          fontWeight: FontWeight.normal,
          color: textColor,
        );
      case 'Abril Fatface':
        return GoogleFonts.abrilFatface(
          fontSize: 22,
          fontWeight: FontWeight.normal,
          color: textColor,
        );
      case 'Fredoka':
        return GoogleFonts.fredoka(
          fontSize: 22,
          fontWeight: FontWeight.normal,
          color: textColor,
        );
      case 'Bungee':
        return GoogleFonts.bungee(
          fontSize: 22,
          fontWeight: FontWeight.normal,
          color: textColor,
        );
      case 'Crimson Text':
        return GoogleFonts.crimsonText(
          fontSize: 22,
          fontWeight: FontWeight.normal,
          color: textColor,
        );
      case 'Lora':
        return GoogleFonts.lora(
          fontSize: 22,
          fontWeight: FontWeight.normal,
          color: textColor,
        );
      case 'Libre Baskerville':
        return GoogleFonts.libreBaskerville(
          fontSize: 22,
          fontWeight: FontWeight.normal,
          color: textColor,
        );
      case 'Merriweather':
        return GoogleFonts.merriweather(
          fontSize: 22,
          fontWeight: FontWeight.normal,
          color: textColor,
        );
      case 'Playfair Display':
        return GoogleFonts.playfairDisplay(
          fontSize: 22,
          fontWeight: FontWeight.normal,
          color: textColor,
        );
      case 'Bodoni Moda':
        return GoogleFonts.bodoniModa(
          fontSize: 22,
          fontWeight: FontWeight.normal,
          color: textColor,
        );
      default:
        return GoogleFonts.dancingScript(
          fontSize: 22,
          fontWeight: FontWeight.normal,
          color: textColor,
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
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Great Vibes':
        return GoogleFonts.greatVibes(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Satisfy':
        return GoogleFonts.satisfy(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Pacifico':
        return GoogleFonts.pacifico(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Indie Flower':
        return GoogleFonts.indieFlower(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Architects Daughter':
        return GoogleFonts.architectsDaughter(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Kalam':
        return GoogleFonts.kalam(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Roboto':
        return GoogleFonts.roboto(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Open Sans':
        return GoogleFonts.openSans(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Lato':
        return GoogleFonts.lato(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Poppins':
        return GoogleFonts.poppins(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Inter':
        return GoogleFonts.inter(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Nunito':
        return GoogleFonts.nunito(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Montserrat':
        return GoogleFonts.montserrat(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Raleway':
        return GoogleFonts.raleway(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Ubuntu':
        return GoogleFonts.ubuntu(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Bebas Neue':
        return GoogleFonts.bebasNeue(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Lobster':
        return GoogleFonts.lobster(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Righteous':
        return GoogleFonts.righteous(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Bangers':
        return GoogleFonts.bangers(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Abril Fatface':
        return GoogleFonts.abrilFatface(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Fredoka':
        return GoogleFonts.fredoka(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Bungee':
        return GoogleFonts.bungee(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Crimson Text':
        return GoogleFonts.crimsonText(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Lora':
        return GoogleFonts.lora(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Libre Baskerville':
        return GoogleFonts.libreBaskerville(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Merriweather':
        return GoogleFonts.merriweather(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Playfair Display':
        return GoogleFonts.playfairDisplay(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      case 'Bodoni Moda':
        return GoogleFonts.bodoniModa(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
      default:
        return GoogleFonts.dancingScript(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: textColor,
        );
    }
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: themeController.backgroundColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Text('Add Note', style: getAppBarTitleStyle()),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: themeController.iconColor),
            onPressed: () => Get.back(),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Title Field
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: titleController,
                  style: getTitleFieldStyle(),
                  textAlignVertical: TextAlignVertical.top,
                  keyboardType: TextInputType.multiline,
                  minLines: 1,
                  maxLines: 3, // Allow title to expand up to 3 lines
                  decoration: InputDecoration(
                    fillColor: themeController.cardColor,
                    filled: true,
                    hintStyle: getTitleFieldStyle().copyWith(
                      color: themeController.textColor.withOpacity(0.6),
                    ),
                    hintText: 'Let\'s give a title',
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),

              // Description Field
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: descriptionController,
                  style: getDescriptionFieldStyle(),
                  textAlignVertical: TextAlignVertical.top,
                  keyboardType: TextInputType.multiline,
                  minLines: 5, // Start with 5 lines minimum
                  maxLines: null, // Allow unlimited expansion
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    fillColor: themeController.cardColor,
                    filled: true,
                    hintText:
                        'Write your note here...\n\nYour thoughts, ideas, and creativity have no limits!',
                    hintStyle: getDescriptionFieldStyle().copyWith(
                      color: themeController.textColor.withOpacity(0.6),
                    ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    contentPadding: const EdgeInsets.all(16),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Add Note Button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: themeController.isDarkMode.value
                          ? Colors.white
                          : Colors.black87,
                      foregroundColor: themeController.isDarkMode.value
                          ? Colors.black87
                          : Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    onPressed: () async {
                      // Validate input
                      if (titleController.text.trim().isEmpty &&
                          descriptionController.text.trim().isEmpty) {
                        Get.snackbar(
                          'Empty Note',
                          'Please add a title or description!',
                          snackPosition: SnackPosition.TOP,
                          backgroundColor: Colors.orange,
                          colorText: Colors.white,
                          icon: const Icon(Icons.warning, color: Colors.white),
                          duration: const Duration(seconds: 3),
                          margin: const EdgeInsets.all(16),
                          borderRadius: 12,
                        );
                        return;
                      }

                      try {
                        // Show loading state
                        Get.snackbar(
                          'Saving',
                          'Saving note to device storage...',
                          snackPosition: SnackPosition.TOP,
                          backgroundColor: Colors.blue,
                          colorText: Colors.white,
                          icon: const Icon(Icons.save, color: Colors.white),
                          duration: const Duration(seconds: 1),
                          margin: const EdgeInsets.all(16),
                          borderRadius: 12,
                          showProgressIndicator: true,
                          progressIndicatorBackgroundColor: Colors.white,
                          progressIndicatorValueColor:
                              const AlwaysStoppedAnimation<Color>(Colors.blue),
                        );

                        // Save the note using GetX controller with SharedPreferences
                        await notesController.addNote(
                          titleController.text.trim(),
                          descriptionController.text.trim(),
                        );

                        // Clear the text fields
                        titleController.clear();
                        descriptionController.clear();

                        // Show success message
                        Get.snackbar(
                          'Success!',
                          'Note saved to device storage successfully!',
                          snackPosition: SnackPosition.TOP,
                          backgroundColor: Colors.green,
                          colorText: Colors.white,
                          icon: const Icon(
                            Icons.check_circle,
                            color: Colors.white,
                          ),
                          duration: const Duration(seconds: 1),
                          margin: const EdgeInsets.all(16),
                          borderRadius: 12,
                        );

                        // Wait briefly to show success message then navigate back
                        await Future.delayed(const Duration(milliseconds: 800));

                        // Navigate back to home screen
                        Navigator.pop(context);
                      } catch (e) {
                        // Show error message but note might still be in memory
                        Get.snackbar(
                          'Partial Success',
                          'Note saved in memory, but storage sync had issues',
                          snackPosition: SnackPosition.TOP,
                          backgroundColor: Colors.deepOrange,
                          colorText: Colors.white,
                          icon: const Icon(
                            Icons.cloud_off,
                            color: Colors.white,
                          ),
                          duration: const Duration(seconds: 2),
                          margin: const EdgeInsets.all(16),
                          borderRadius: 12,
                        );

                        // Wait briefly to show message then navigate back
                        await Future.delayed(
                          const Duration(milliseconds: 1000),
                        );

                        // Navigate back to home screen
                        Get.off(() => const HomeScreen());
                      }
                    },
                    child: Text('Add Note', style: getButtonTextStyle()),
                  ),
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
