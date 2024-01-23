import "package:inf/classes/todo.dart";
import "package:isar/isar.dart";
import "package:path_provider/path_provider.dart";

class IsarTodoDataSource {
  static late Isar _isar;
  static bool _initialized = false;

  Future<void> init() async {
    if (!_initialized) {
      _initialized = true;
      final dir = await getApplicationDocumentsDirectory();
      _isar = await Isar.open(
        [ToDoSchema],
        directory: dir.path,
      );
    }
  }

  Future<void> delete(int id) async => _isar.writeTxn(
        () async => _isar.toDos.filter().idEqualTo(id).deleteAll(),
      );

  Future<ToDo?> get(int id) => _isar.toDos.filter().idEqualTo(id).findFirst();

  Future<List<ToDo>> getAll() => _isar.toDos.where().findAll();

  Future<List<ToDo>> getFiltered(String frag) =>
      _isar.toDos.filter().textContains(frag).findAll();

  Future<void> insert(ToDo todo) => _isar.writeTxn(
        () async => await _isar.toDos.put(
          ToDo(
            text: todo.text,
            description: todo.description,
            done: todo.done,
          ),
        ),
      );

  Future<void> UpdateDone(int id) => _isar.writeTxn(() async {
        ToDo? td = await get(id);
        td?.done = !td.done;
      });

  Future<void> UpdateTitle(int id, String text) => _isar.writeTxn(() async {
        ToDo? td = await get(id);
        td?.text = text;
      });

  Future<void> UpdateDesc(int id, String desc) => _isar.writeTxn(() async {
        ToDo? td = await get(id);
        td?.description = desc;
      });
}
