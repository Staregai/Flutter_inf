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

  Future<void> delete(int id) async => await _isar.writeTxn(
        () async => await _isar.toDos.filter().idEqualTo(id).deleteAll(),
      );

  Future<ToDo?> get(int id) async =>
      await _isar.toDos.filter().idEqualTo(id).findFirst();

  Future<List<ToDo>> getAll() async => await _isar.toDos.where().findAll();

  Future<List<ToDo>> getFiltered(String frag) async =>
      await _isar.toDos.filter().textContains(frag).findAll();

  Future<void> insert(ToDo todo) async => await _isar.writeTxn(
        () async => await _isar.toDos.put(
          ToDo(
            text: todo.text,
            description: todo.description,
            done: todo.done,
          ),
        ),
      );

  Future<void> UpdateDone(int id) async => await _isar.writeTxn(() async {
        ToDo? td = await get(id);
        td?.done = !td.done;
        _isar.toDos.put(td!);
      });

  Future<void> UpdateTitle(int id, String text) async =>
      await _isar.writeTxn(() async {
        ToDo? td = await get(id);
        td?.text = text;
        _isar.toDos.put(td!);
      });

  Future<void> UpdateDesc(int id, String desc) async =>
      await _isar.writeTxn(() async {
        ToDo? td = await get(id);
        td?.description = desc;
        _isar.toDos.put(td!);
      });

  Future<void> AddSub(int id, String txt) async {
    ToDo? td = await get(id);
    ToDo sub = ToDo(text: txt);
    td?.subtasks.add(sub);
    await _isar.writeTxn(() async {
      await td?.subtasks.save();
      await _isar.toDos.put(td!);
    });
  }

  Future<void> DelSub(int id, ToDo del) async {
    ToDo? td = await get(id);
    td?.subtasks.remove(del);
    await _isar.writeTxn(() async {
      await td?.subtasks.save();
      await _isar.toDos.put(td!);
    });
  }
}
