import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/view/notes_adding.dart';
import 'package:notes_app/view/notes_screen.dart';
import 'package:notes_app/model/notes_model.dart';
import 'package:notes_app/controllers/adding_notes_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final NotesController notesController = Get.put(NotesController());

  // Colors for note cards
  List<Color> cardColors = [
    const Color.fromARGB(255, 255, 223, 186), // Light orange
    const Color.fromARGB(255, 186, 225, 255), // Light blue
    const Color.fromARGB(255, 228, 189, 189), // Light pink
    const Color.fromARGB(255, 200, 230, 201), // Light green
    const Color.fromARGB(255, 230, 200, 230), // Light purple
    const Color.fromARGB(255, 255, 249, 196), // Light yellow
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          'My Notes',
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              // Refresh from device storage
              await notesController.refreshNotes();
              Get.snackbar(
                'Refreshed',
                'Notes loaded from device storage',
                snackPosition: SnackPosition.TOP,
                backgroundColor: Colors.blueAccent,
                colorText: Colors.white,
                icon: const Icon(Icons.refresh, color: Colors.white),
                duration: const Duration(seconds: 2),
                margin: const EdgeInsets.all(16),
                borderRadius: 12,
              );
            },
            icon: const Icon(Icons.refresh, color: Colors.black54, size: 28),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: Obx(() {
        // Show loading indicator while loading from storage
        if (notesController.isLoading.value) {
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(color: Colors.black87),
                SizedBox(height: 16),
                Text(
                  'Loading notes from device storage...',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
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
                Icon(Icons.note_add, size: 80, color: Colors.grey[400]),
                const SizedBox(height: 16),
                Text(
                  'No notes yet!',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Tap the + button to create your first note',
                  style: TextStyle(fontSize: 16, color: Colors.grey[500]),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Text(
                  'Notes are saved to device storage',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[400],
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
              final cardColor = cardColors[index % cardColors.length];

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
                  _showDeleteDialog(context, index, note.title);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: cardColor,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
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
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 12),
                        Expanded(
                          child: Text(
                            note.description,
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.black54,
                              height: 1.3,
                            ),
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
                              color: Colors.black.withOpacity(0.3),
                            ),
                            Text(
                              'Long press to delete',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black.withOpacity(0.4),
                                fontStyle: FontStyle.italic,
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
        backgroundColor: Colors.black87,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
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
}
