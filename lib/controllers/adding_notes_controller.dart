import 'package:get/get.dart';
import 'package:notes_app/model/notes_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class NotesController extends GetxController {
  // Observable list of notes
  var notes = <NotesModel>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadNotesFromStorage();
  }

  // Migrate existing notes to ensure they all have IDs
  Future<void> _migrateNotesIfNeeded() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final notesJson = prefs.getStringList('notes_list') ?? [];

      bool needsMigration = false;
      List<String> migratedNotesJson = [];

      for (String noteJson in notesJson) {
        try {
          Map<String, dynamic> noteMap = jsonDecode(noteJson);

          // Check if note needs migration (missing ID)
          if (noteMap['id'] == null || noteMap['id'].toString().isEmpty) {
            needsMigration = true;
            // Add ID to the note
            noteMap['id'] =
                DateTime.now().millisecondsSinceEpoch.toString() +
                '_migrated_${migratedNotesJson.length}';
          }

          migratedNotesJson.add(jsonEncode(noteMap));
        } catch (e) {
          print('Error during migration: $e');
          // Keep the original note if parsing fails
          migratedNotesJson.add(noteJson);
        }
      }

      // Save migrated notes if needed
      if (needsMigration && migratedNotesJson.isNotEmpty) {
        await prefs.setStringList('notes_list', migratedNotesJson);
        print('Notes migrated successfully');
      }
    } catch (e) {
      print('Migration failed: $e');
    }
  }

  // Load notes from SharedPreferences
  Future<void> loadNotesFromStorage() async {
    try {
      isLoading.value = true;

      // First, migrate notes if needed
      await _migrateNotesIfNeeded();

      // Wait a bit to ensure SharedPreferences is ready
      await Future.delayed(const Duration(milliseconds: 200));

      final prefs = await SharedPreferences.getInstance();
      final notesJson = prefs.getStringList('notes_list') ?? [];

      List<NotesModel> loadedNotes = [];

      for (String noteJson in notesJson) {
        try {
          Map<String, dynamic> noteMap = jsonDecode(noteJson);

          // Ensure we have a valid ID for each note
          String noteId = noteMap['id']?.toString() ?? '';
          if (noteId.isEmpty) {
            // Generate a unique ID for notes without one
            noteId =
                DateTime.now().millisecondsSinceEpoch.toString() +
                '_${loadedNotes.length}';
          }

          loadedNotes.add(
            NotesModel(
              id: noteId,
              title: noteMap['title'] ?? 'Untitled',
              description: noteMap['description'] ?? '',
            ),
          );
        } catch (e) {
          print('Error parsing note: $e');
        }
      }

      notes.value = loadedNotes.reversed.toList(); // Newest first
      isLoading.value = false;

      print('Loaded ${notes.length} notes from storage');
    } catch (e) {
      print('Error loading notes: $e');
      isLoading.value = false;

      // Fallback: try alternative method
      await _loadNotesAlternative();
    }
  }

  // Alternative loading method if first method fails
  Future<void> _loadNotesAlternative() async {
    try {
      await Future.delayed(const Duration(milliseconds: 500));
      final prefs = await SharedPreferences.getInstance();

      // Try getting individual notes if list method fails
      final keys = prefs
          .getKeys()
          .where((key) => key.startsWith('note_'))
          .toList();
      List<NotesModel> loadedNotes = [];

      for (String key in keys) {
        final noteJson = prefs.getString(key);
        if (noteJson != null) {
          try {
            Map<String, dynamic> noteMap = jsonDecode(noteJson);

            // Ensure we have a valid ID for each note
            String noteId = noteMap['id'];
            if (noteId == null || noteId.isEmpty) {
              // Use the key as ID or generate a new one
              noteId = key.replaceFirst('note_', '');
              if (noteId.isEmpty) {
                noteId =
                    DateTime.now().millisecondsSinceEpoch.toString() +
                    '_alt_${loadedNotes.length}';
              }
            }

            loadedNotes.add(
              NotesModel(
                id: noteId,
                title: noteMap['title'] ?? 'Untitled',
                description: noteMap['description'] ?? '',
              ),
            );
          } catch (e) {
            print('Error parsing individual note: $e');
          }
        }
      }

      notes.value = loadedNotes.reversed.toList();
      print('Loaded ${notes.length} notes using alternative method');
    } catch (e) {
      print('Alternative loading also failed: $e');
      // Keep empty list if all methods fail
      notes.value = [];
    }
  }

  // Add a new note and save to storage
  Future<void> addNote(String title, String description) async {
    try {
      final newNote = NotesModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        title: title.trim().isEmpty ? 'Untitled Note' : title.trim(),
        description: description.trim(),
      );

      // Add to memory first for immediate UI update
      notes.insert(0, newNote);

      // Save to SharedPreferences
      await _saveNotesToStorage();

      print('Note added and saved: ${newNote.title}');
    } catch (e) {
      print('Error adding note: $e');

      // Try alternative saving method
      await _saveNoteAlternative(title, description);
    }
  }

  // Primary method to save notes to SharedPreferences
  Future<void> _saveNotesToStorage() async {
    try {
      final prefs = await SharedPreferences.getInstance();

      List<String> notesJson = notes.map((note) {
        return jsonEncode({
          'title': note.title,
          'description': note.description,
          'createdAt': DateTime.now().toIso8601String(),
          'id': note.id,
        });
      }).toList();

      final success = await prefs.setStringList('notes_list', notesJson);

      if (!success) {
        throw Exception('Failed to save notes list');
      }

      print('Successfully saved ${notes.length} notes to storage');
    } catch (e) {
      print('Error saving notes: $e');
      rethrow;
    }
  }

  // Alternative saving method if primary fails
  Future<void> _saveNoteAlternative(String title, String description) async {
    try {
      final prefs = await SharedPreferences.getInstance();

      // Save as individual note with unique key
      final noteId = DateTime.now().millisecondsSinceEpoch.toString();
      final noteData = jsonEncode({
        'title': title.trim().isEmpty ? 'Untitled Note' : title.trim(),
        'description': description.trim(),
        'createdAt': DateTime.now().toIso8601String(),
        'id': noteId,
      });

      await prefs.setString('note_$noteId', noteData);
      print('Note saved using alternative method');
    } catch (e) {
      print('Alternative saving also failed: $e');
      // Note is still in memory, just not persisted
    }
  }

  // Update an existing note
  Future<void> updateNote(
    String id,
    String newTitle,
    String newDescription,
  ) async {
    try {
      // Validate inputs
      if (id.isEmpty) {
        throw Exception('Invalid note ID');
      }

      final noteIndex = notes.indexWhere((note) => note.id == id);
      if (noteIndex != -1) {
        final updatedNote = NotesModel(
          id: id,
          title: newTitle.trim().isEmpty ? 'Untitled Note' : newTitle.trim(),
          description: newDescription.trim(),
        );

        // Update in memory
        notes[noteIndex] = updatedNote;

        // Save to SharedPreferences
        await _saveNotesToStorage();

        print('Note updated and saved: ${updatedNote.title}');
      } else {
        throw Exception('Note not found with ID: $id');
      }
    } catch (e) {
      print('Error updating note: $e');
      rethrow;
    }
  }

  // Find note by ID
  NotesModel? findNoteById(String id) {
    try {
      if (id.isEmpty) return null;
      return notes.firstWhere((note) => note.id == id);
    } catch (e) {
      return null;
    }
  }

  // Remove a note (for future use)
  Future<void> removeNote(int index) async {
    if (index >= 0 && index < notes.length) {
      final deletedNote = notes[index];
      notes.removeAt(index);
      await _saveNotesToStorage();

      print('Note deleted: ${deletedNote.title}');
    }
  }

  // Delete note with title for confirmation
  Future<void> deleteNote(int index) async {
    if (index >= 0 && index < notes.length) {
      final noteToDelete = notes[index];
      notes.removeAt(index);

      try {
        await _saveNotesToStorage();
        print('Note deleted and saved: ${noteToDelete.title}');
      } catch (e) {
        // If save fails, add the note back
        notes.insert(index, noteToDelete);
        print('Failed to save after deletion, note restored: $e');
        rethrow;
      }
    }
  }

  // Clear all notes (for future use)
  Future<void> clearAllNotes() async {
    notes.clear();
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('notes_list');

    // Also clear individual notes
    final keys = prefs
        .getKeys()
        .where((key) => key.startsWith('note_'))
        .toList();
    for (String key in keys) {
      await prefs.remove(key);
    }
  }

  // Manual refresh from storage
  Future<void> refreshNotes() async {
    await loadNotesFromStorage();
  }
}
