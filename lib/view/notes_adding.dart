import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/controllers/adding_notes_controller.dart';
import 'package:notes_app/view/home_screen.dart';

class NotesAdding extends StatefulWidget {
  const NotesAdding({super.key});

  @override
  State<NotesAdding> createState() => _NotesAddingState();
}

class _NotesAddingState extends State<NotesAdding> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final NotesController notesController = Get.find<NotesController>();

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        centerTitle: true,
        title: const Text(
          'Add Note',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
                textAlignVertical: TextAlignVertical.top,
                keyboardType: TextInputType.multiline,
                minLines: 1,
                maxLines: 3, // Allow title to expand up to 3 lines
                decoration: InputDecoration(
                  fillColor: Colors.grey[200],
                  filled: true,
                  hintStyle: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
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
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.normal,
                ),
                textAlignVertical: TextAlignVertical.top,
                keyboardType: TextInputType.multiline,
                minLines: 5, // Start with 5 lines minimum
                maxLines: null, // Allow unlimited expansion
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  fillColor: Colors.grey[200],
                  filled: true,
                  hintText:
                      'Write your note here...\n\nYour thoughts, ideas, and creativity have no limits!',
                  hintStyle: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey,
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
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
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
                        icon: const Icon(Icons.cloud_off, color: Colors.white),
                        duration: const Duration(seconds: 2),
                        margin: const EdgeInsets.all(16),
                        borderRadius: 12,
                      );

                      // Wait briefly to show message then navigate back
                      await Future.delayed(const Duration(milliseconds: 1000));

                      // Navigate back to home screen
                      Get.off(() => const HomeScreen());
                    }
                  },
                  child: const Text(
                    'Add Note',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
