import 'package:flutter/material.dart';
import 'package:clear_fresh/helper/database_helper.dart';
import 'package:clear_fresh/models/note_model.dart';

class LatihanCRUD extends StatefulWidget {
  @override
  _LatihanCRUDState createState() => _LatihanCRUDState();
}

class _LatihanCRUDState extends State<LatihanCRUD> {
  late DatabaseHelper _databaseHelper;
  late List<Note> _notes = [];
  TextEditingController _titleController = TextEditingController();
  TextEditingController _contentController = TextEditingController();
  bool _isUpdating = false;
  int _updatingNoteId = 0;

  @override
  void initState() {
    super.initState();
    _databaseHelper = DatabaseHelper();
    _loadNotes();
  }

  void _loadNotes() async {
    List<Note> notes = await _databaseHelper.getAllNotes();
    setState(() {
      _notes = notes;
    });
  }

  Future<void> _addOrUpdateNote() async {
    String title = _titleController.text.trim();
    String content = _contentController.text.trim();

    if (title.isNotEmpty && content.isNotEmpty) {
      Note newNote = Note(
        id: _updatingNoteId,
        title: title,
        content: content,
      );
      if (_isUpdating) {
        await _databaseHelper.update(newNote);
      } else {
        await _databaseHelper.insert(newNote);
      }
      _clearInputs();
      _loadNotes();
      setState(() {
        _isUpdating = false;
      });
    }
  }

  void _deleteNote(int id) async {
    await _databaseHelper.delete(id);
    _loadNotes();
  }

  void _clearInputs() {
    _titleController.clear();
    _contentController.clear();
  }

  void _showEditDialog(Note note) {
    _isUpdating = true;
    _updatingNoteId = note.id;
    _titleController.text = note.title;
    _contentController.text = note.content;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Edit Catatan'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _titleController,
                decoration: const InputDecoration(
                  hintText: 'Title',
                ),
              ),
              TextField(
                controller: _contentController,
                decoration: const InputDecoration(
                  hintText: 'Content',
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                _addOrUpdateNote();
              },
              child: const Text('Simpan'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                _clearInputs();
                setState(() {
                  _isUpdating = false;
                });
              },
              child: const Text('Batal'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'CRUD SQLite Demo',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue, // Ganti warna latar belakang app bar
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              // Gunakan TextFormField untuk validasi otomatis
              controller: _titleController,
              decoration: InputDecoration(
                hintText: 'Title',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 12),
            TextFormField(
              // Gunakan TextFormField untuk validasi otomatis
              controller: _contentController,
              decoration: InputDecoration(
                hintText: 'Content',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 12),
            ElevatedButton(
              onPressed: _addOrUpdateNote,
              child: Text(_isUpdating ? 'Update Note' : 'Add Note'),
            ),
            SizedBox(height: 24),
            Expanded(
              child: ListView.builder(
                itemCount: _notes.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 4,
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      title: Text(
                        _notes[index].title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(_notes[index].content),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () {
                              _showEditDialog(_notes[index]);
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              _deleteNote(_notes[index].id);
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
