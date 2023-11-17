import 'package:flutter/material.dart';
import 'package:todolist_app/saving_page.dart';
import 'package:todolist_app/todolist_page.dart';

// ignore: use_key_in_widget_constructors
class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('To Do List')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 150,
              height: 40,
              child: TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 40, 150, 194)),
                child: const Text(
                  'To Do',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const ToDoListPage();
                  }));
                },
              ),
            ),
            const Padding(
                padding: EdgeInsets.only(
              top: 30,
            )),
            SizedBox(
              width: 150,
              height: 40,
              child: TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 40, 150, 194)),
                child: const Text(
                  'Savings',
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
