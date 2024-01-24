import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inf/classes/todo.dart';
import 'package:inf/data_sources/todo_DataSource.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit({required IsarTodoDataSource ds})
      : _dataSource = ds,
        super(TodoState());

  final IsarTodoDataSource _dataSource;

  Future<void> init(List<ToDo>? shown) async {
    await _dataSource.init();
    List<ToDo> ls = await _dataSource.getAll();
    emit(TodoState(allTodos: ls, shownTodos: shown ?? ls));
  }

  Future<void> refresh(List<ToDo>? shown) async {
    List<ToDo> ls = await _dataSource.getAll();
    emit(TodoState(allTodos: ls, shownTodos: shown ?? ls));
  }

  Future<void> handleToDoChange(ToDo todo) async {
    await _dataSource.UpdateDone(todo.id);
  }

  Future<void> handleDeleteToDo(int id) async {
    await _dataSource.delete(id);
    await refresh(null);
  }

  Future<ToDo> addToDoItem(String toDo) async {
    ToDo td = ToDo(text: toDo);
    await _dataSource.insert(td);

    await refresh(null);

    return td;
  }

  Future<void> runFilter(String key) async {
    if (key.isEmpty) {
      await refresh(null);
    } else {
      await refresh(await _dataSource.getFiltered(key));
    }
  }

  Future<void> sortTodos(String option) async {
    List<ToDo> sortedTodos = List.from(state.shownTodos);

    switch (option) {
      case 'Alphabetically Increasing (Not Done First)':
        sortedTodos.sort((a, b) {
          if (a.done != b.done) {
            return a.done ? 1 : -1;
          }
          return a.text!.compareTo(b.text!);
        });
        break;
      case 'Alphabetically Decreasing (Not Done First)':
        sortedTodos.sort((a, b) {
          if (a.done != b.done) {
            return a.done ? 1 : -1;
          }
          return b.text!.compareTo(a.text!);
        });
        break;
      case 'Alphabetically Increasing (Done First)':
        sortedTodos.sort((a, b) {
          if (a.done != b.done) {
            return a.done ? -1 : 1;
          }
          return a.text!.compareTo(b.text!);
        });
        break;
      case 'Alphabetically Decreasing (Done First)':
        sortedTodos.sort((a, b) {
          if (a.done != b.done) {
            return a.done ? -1 : 1;
          }
          return b.text!.compareTo(a.text!);
        });
        break;

      default:
        break;
    }

    await refresh(sortedTodos);
  }
}

class TodoState {
  List<ToDo> allTodos;
  List<ToDo> shownTodos;

  TodoState({List<ToDo>? allTodos, List<ToDo>? shownTodos})
      : allTodos = allTodos ?? List.empty(growable: true),
        shownTodos = shownTodos ?? List.empty(growable: true);

  TodoState copyWith({List<ToDo>? allTodos, List<ToDo>? shownTodos}) {
    return TodoState(
      allTodos: allTodos ?? this.allTodos,
      shownTodos: shownTodos ?? this.shownTodos,
    );
  }
}
