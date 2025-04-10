import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class StudentForm extends StatefulWidget {
  @override
  _StudentFormState createState() => _StudentFormState();
}

class _StudentFormState extends State<StudentForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _idController = TextEditingController();
  final DatabaseReference database = FirebaseDatabase.instance.ref('students');

  void _submitData() {
    final name = _nameController.text;
    final id = _idController.text;
    if (name.isNotEmpty && id.isNotEmpty) {
      database.push().set({'name': name, 'id': id});
      _nameController.clear();
      _idController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Student Info')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _idController,
              decoration: InputDecoration(labelText: 'ID'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitData,
              child: Text('Upload to Firebase'),
            ),
          ],
        ),
      ),
    );
  }
}
