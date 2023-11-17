import 'dart:math';
import 'package:flutter/material.dart';
import 'package:todolist_app/models/todolist.dart';

// ignore: use_key_in_widget_constructors, must_be_immutable
class ToDoListAddPage extends StatelessWidget {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _desc = TextEditingController();

  // Ini aksi untuk menyimpan data kedalam model
  getTodo() {
    final id = Random().nextInt(1000); //Ini untuk menentukan id dari data
    return ToDoList(id: id, name: _name.text, desc: _desc.text); // untuk mengirim inputan kedalam model
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('To Do List Add')),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextField(
              controller: _name,
              decoration: InputDecoration(
                  hintText: "Title",
                  labelText: "Title",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  )),
            ),
            const Padding(padding: EdgeInsets.only(top: 20.0)),
            TextField(
              // obscureText: true,
              controller: _desc,
              maxLines: 3,
              decoration: InputDecoration(
                  hintText: "Description",
                  labelText: "Description",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  )),
            ),
            const Padding(padding: EdgeInsets.only(top: 20.0)),
            SizedBox(
              width: 150,
              height: 40,
              child: TextButton(
                style: TextButton.styleFrom(
                    backgroundColor:const  Color.fromARGB(255, 40, 150, 194)),
                child: const Text(
                  'Simpan',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.pop(context, getTodo());
                },
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 20.0)),
          ],
        ),
      ),
    );
  }
}
