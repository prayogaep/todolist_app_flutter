import 'package:flutter/material.dart';
import 'package:todolist_app/models/todolist.dart';

class ToDoListEditPage extends StatefulWidget {
  const ToDoListEditPage({
    super.key,
    required this.todolist,
  });
  final ToDoList todolist;
  @override
  State<ToDoListEditPage> createState() => _ToDoListEditPageState();
}

class _ToDoListEditPageState extends State<ToDoListEditPage> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _desc = TextEditingController();

  @override
  initState() {
    super.initState();
    _name.text = widget.todolist.name;
    _desc.text = widget.todolist.desc;
  }

  getTodo() {
    return ToDoList(id: widget.todolist.id, name: _name.text, desc: _desc.text);
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
                  // if (_name.text.isEmpty) {
                  //   return AlertDialog(
                  //     content: Text("Judul harus diisi"),
                  //   );
                  // }
                  Navigator.pop(context, getTodo());
                },
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 20.0)),
            // ListView(
            //   children: ,
            // ),
          ],
        ),
      ),
      // body: Center(
      //   child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      //     Container(
      //       width: 150,
      //       height: 40,
      //       child: TextButton(
      //         style: TextButton.styleFrom(
      //             backgroundColor: Color.fromARGB(255, 40, 150, 194)),
      //         child: Text(
      //           'Go Back',
      //           style: TextStyle(color: Colors.white),
      //         ),
      //         onPressed: () {
      //           Navigator.pop(context);
      //         },
      //       ),
      //     )
      //   ]),
      // ),
    );
  }
}
