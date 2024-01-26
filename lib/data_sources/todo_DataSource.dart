import "package:flutter/material.dart";
import "package:inf/classes/todo.dart";
import 'package:inf/classes/colors.dart';
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
        [ToDoSchema, SubtaskSchema, PersonalizeSchema],
        directory: dir.path,
      );
    }
    int c = await _isar.personalizes.count();
    if (c == 0) {
      await _isar
          .writeTxn(() async => await _isar.personalizes.put(Personalize()));
    }
  }

  Future<void> delete(int id) async => await _isar.writeTxn(
        () async => await _isar.toDos.filter().idEqualTo(id).deleteAll(),
      );
  Future<void> deletesub(int id) async => await _isar.writeTxn(
        () async => await _isar.subtasks.filter().idEqualTo(id).deleteAll(),
      );
  Future<ToDo?> get(int id) async =>
      await _isar.toDos.filter().idEqualTo(id).findFirst();
  Future<Subtask?> getsub(int id) async =>
      await _isar.subtasks.filter().idEqualTo(id).findFirst();
  Future<Personalize?> getp(int id) async =>
      await _isar.personalizes.filter().idEqualTo(id).findFirst();

  Future<List<ToDo>> getAll() async => await _isar.toDos.where().findAll();
  Future<List<Subtask>> getAllsub() async =>
      await _isar.subtasks.where().findAll();

  Future<List<ToDo>> getFiltered(String frag) async =>
      await _isar.toDos.filter().textContains(frag).findAll();

  Future<int> insert(ToDo todo) async => await _isar.writeTxn(
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

  Future<void> SubUpdateDone(int id) async => await _isar.writeTxn(() async {
        Subtask? sub = await getsub(id);
        sub?.done = !sub.done;
        _isar.subtasks.put(sub!);
      });

  Future<void> AddSub(int id, String txt) async {
    ToDo? td = await get(id);
    Subtask sub = Subtask(text: txt);

    await _isar.writeTxn(() => _isar.subtasks.put(sub));
    td?.subtasks.add(sub);
    _isar.writeTxn(() async {
      await td?.subtasks.save();
      await _isar.toDos.put(td!);
    });
  }

  Future<void> DelSub(int id, Subtask del) async {
    ToDo? td = await get(id);
    td?.subtasks.remove(del);
    await deletesub(del.id);
    await _isar.writeTxn(() async {
      await td?.subtasks.save();
      await _isar.toDos.put(td!);
    });
  }

  Future<void> tdDelete(int a, int r, int g, int b) async =>
      await _isar.writeTxn(() async {
        Personalize? personalize = await getp(0);
        personalize?.tdDelete = [a, r, g, b];
        _isar.personalizes.put(personalize!);
      });

  Future<void> tdText(int a, int r, int g, int b) async =>
      await _isar.writeTxn(() async {
        Personalize? personalize = await getp(0);
        personalize?.tdText = [a, r, g, b];
        _isar.personalizes.put(personalize!);
      });

  Future<void> tdBgColor(int a, int r, int g, int b) async =>
      await _isar.writeTxn(() async {
        Personalize? personalize = await getp(0);
        personalize?.tdBGColor = [a, r, g, b];
        _isar.personalizes.put(personalize!);
      });

  Future<void> tdTile(int a, int r, int g, int b) async =>
      await _isar.writeTxn(() async {
        Personalize? personalize = await getp(0);
        personalize?.tdTile = [a, r, g, b];
        _isar.personalizes.put(personalize!);
      });

  Future<void> tdCheckbox(int a, int r, int g, int b) async =>
      await _isar.writeTxn(() async {
        Personalize? personalize = await getp(0);
        personalize?.tdCheckbox = [a, r, g, b];
        _isar.personalizes.put(personalize!);
      });

  Future<void> tdIcon(int a, int r, int g, int b) async =>
      await _isar.writeTxn(() async {
        Personalize? personalize = await getp(0);
        personalize?.tdIcon = [a, r, g, b];
        _isar.personalizes.put(personalize!);
      });

  Future<void> tdTextWithoutBackground(int a, int r, int g, int b) async =>
      await _isar.writeTxn(() async {
        Personalize? personalize = await getp(0);
        personalize?.tdTextWithoutBackground = [a, r, g, b];
        _isar.personalizes.put(personalize!);
      });

  Future<void> tdCustomBrightness() async {
    await _isar.writeTxn(() async {
      Personalize? personalize = await getp(0);
      personalize?.customBrightness =
          personalize.customBrightness == Brightness.light
              ? Brightness.dark
              : Brightness.light;
      _isar.personalizes.put(personalize!);
    });
    print("pierwsze");
  }
}
