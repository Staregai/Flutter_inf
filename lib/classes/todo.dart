class ToDo {
  String? id;
  String? text;
  String? description;
  bool done;
  List<ToDo> subtasks = new List.empty();
  ToDo({
    required this.id,
    required this.text,
    this.done = false,
    this.description = "",
  });

  static List<ToDo> todoList() {
    return {
      ToDo(
          id: '1',
          text: "aaaaa",
          done: true,
          description: "opis probny \n ccccccc"),
      ToDo(id: "2", text: "bbbbb", done: true),
      ToDo(id: "3", text: "asd"),
      ToDo(id: "4", text: "dsa"),
      ToDo(id: "5", text: "qwe"),
      ToDo(id: "6", text: "trew"),
    }.toList();
  }
}
