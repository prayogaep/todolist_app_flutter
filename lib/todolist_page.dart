import 'package:flutter/material.dart';
import 'package:todolist_app/models/todolist.dart';
import 'package:todolist_app/todolist_add_page.dart';
import 'package:todolist_app/todolist_edit_page.dart';

class ToDoListPage extends StatefulWidget {
  const ToDoListPage({super.key});

  @override
  State<ToDoListPage> createState() => _ToDoListPageState();
}

class _ToDoListPageState extends State<ToDoListPage> {
  final List<ToDoList> _todolist = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To Do List'),
      ),
      body: SafeArea(
        child: ListView.separated(
          itemCount: _todolist.length,
          itemBuilder: (context, index) {
            final value = _todolist[index];
            return Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 10,
              ),
              child: GestureDetector(
                onTap: () async {},
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Checkbox(
                            value: _todolist[index].isDone,
                            onChanged: (bool? newValue) {
                              setState(() {
                                _todolist[index].isDone = newValue!;
                              });
                            }),
                        Column(
                          children: [
                            Text("(${value.id}) ${value.name} "),
                            Text(
                              value.desc,
                              style: const TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                !_todolist[index].isDone
                                    ? SizedBox(
                                        width: 40,
                                        height: 40,
                                        child: TextButton(
                                          style: TextButton.styleFrom(
                                              backgroundColor:const  Color.fromARGB(
                                                  255, 40, 150, 194)),
                                          child: const Text(
                                            'Edit',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                            ),
                                          ),
                                          onPressed: () async {
                                            final todoClicked =
                                                _todolist[index];
                                            final result = await Navigator.push(
                                                context, MaterialPageRoute(
                                                    builder: (context) {
                                              return ToDoListEditPage(
                                                  todolist: todoClicked);
                                            }));
                                            if (result is ToDoList) {
                                              setState(() {
                                                _todolist[index] = result;
                                              });
                                            }
                                          },
                                        ),
                                      )
                                    : const Text(""),
                                const Padding(padding: EdgeInsets.only(left: 5)),
                                !_todolist[index].isDone
                                    ? SizedBox(
                                        width: 70,
                                        height: 40,
                                        child: TextButton(
                                          style: TextButton.styleFrom(
                                              backgroundColor: const Color.fromARGB(
                                                  255, 185, 31, 31)),
                                          child: const Text(
                                            'Delete',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                            ),
                                          ),
                                          onPressed: () {
                                            _todolist.removeAt(index);
                                            setState(() {});
                                          },
                                        ),
                                      )
                                    : const Text(""),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const Divider();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          final result = await Navigator.push(context,
              MaterialPageRoute(builder: (context) {
            return ToDoListAddPage();
          }));
          if (result is ToDoList) {
            setState(() {
              _todolist.add(result);
            });
          }
        },
      ),
    );
  }
}
