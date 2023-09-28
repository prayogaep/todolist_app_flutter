import 'dart:math';
import 'package:flutter/material.dart';
import 'package:todolist_app/models/todolist.dart';

// ignore: use_key_in_widget_constructors
class ToDoListAddPage extends StatelessWidget {
  TextEditingController _name = TextEditingController();
  TextEditingController _desc = TextEditingController();

  // Ini aksi untuk menyimpan data kedalam model
  getTodo() {
    final id = Random().nextInt(1000); //Ini untuk menentukan id dari data
    return ToDoList(id: id, name: _name.text, desc: _desc.text); // untuk mengirim inputan kedalam model
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Neo List & Saving')),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextField(
              controller: _name,
              decoration: InputDecoration(
                  hintText: "Judul",
                  labelText: "Judul",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  )),
            ),
            Padding(padding: EdgeInsets.only(top: 20.0)),
            TextField(
              // obscureText: true,
              controller: _desc,
              maxLines: 3,
              decoration: InputDecoration(
                  hintText: "Deskripsi",
                  labelText: "Deskripsi",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  )),
            ),
            Padding(padding: EdgeInsets.only(top: 20.0)),
            Container(
              width: 150,
              height: 40,
              child: TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 40, 150, 194)),
                child: Text(
                  'Simpan',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.pop(context, getTodo());
                },
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 20.0)),
          ],
        ),
      ),
    );
  }
}
