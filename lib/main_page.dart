import 'package:flutter/material.dart';
import 'package:todolist_app/saving_page.dart';
import 'package:todolist_app/todolist_page.dart';

// ignore: use_key_in_widget_constructors
class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Neo List & Saving')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 150,
              height: 40,
              child: TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 40, 150, 194)),
                child: Text(
                  'Notes',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const ToDoListPage();
                  }));
                },
              ),
            ),
            Padding(
                padding: EdgeInsets.only(
              top: 30,
            )),
            Container(
              width: 150,
              height: 40,
              child: TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 40, 150, 194)),
                child: Text(
                  'Tabungan',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const SavingPage();
                  }));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
