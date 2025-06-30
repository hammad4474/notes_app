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

  // Load notes from SharedPreferences
  Future<void> loadNotesFromStorage() async {
    try {
      isLoading.value = true;

      // Wait a bit to ensure SharedPreferences is ready
      await Future.delayed(const Duration(milliseconds: 200));

      final prefs = await SharedPreferences.getInstance();
      final notesJson = prefs.getStringList('notes_list') ?? [];

      List<NotesModel> loadedNotes = [];

      for (String noteJson in notesJson) {
        try {
          Map<String, dynamic> noteMap = jsonDecode(noteJson);
          loadedNotes.add(
            NotesModel(
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
            loadedNotes.add(
              NotesModel(
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
          'id': DateTime.now().millisecondsSinceEpoch.toString(),
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
