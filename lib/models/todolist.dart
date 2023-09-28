class ToDoList {
  int id;
  String name;
  String desc;
  bool isDone;

  ToDoList({
    required this.id,
    required this.name,
    required this.desc,
    this.isDone = false,
  });
}
