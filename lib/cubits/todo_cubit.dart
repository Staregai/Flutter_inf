import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inf/classes/todo.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit(List<ToDo> initialState) : super(TodoState(allTodos: initialState));

  void handleToDoChange(ToDo todo) {
    emit(state.copyWith(
      shownTodos: List.from(state.shownTodos)
        ..[state.shownTodos.indexOf(todo)] = todo,
    ));
  }

  void handleDeleteToDo(String id) {
    emit(state.copyWith(
      shownTodos: List.from(state.shownTodos)
        ..removeWhere((item) => item.id == id),
    ));
  }

  void addToDoItem(String toDo) {
    emit(state.copyWith(
      allTodos: List.from(state.allTodos)
        ..add(ToDo(
          id: DateTime.now().microsecondsSinceEpoch.toString(),
          text: toDo,
        )),
      shownTodos: List.from(state.shownTodos)
        ..add(ToDo(
          id: DateTime.now().microsecondsSinceEpoch.toString(),
          text: toDo,
        )),
    ));
  }

  void runFilter(String key) {
    if (key.isEmpty) {
      emit(state.copyWith(shownTodos: List.from(state.allTodos)));
    } else {
      emit(state.copyWith(
        shownTodos: List<ToDo>.from(state.allTodos)
            .where(
                (item) => item.text!.toLowerCase().contains(key.toLowerCase()))
            .toList(),
      ));
    }
  }

  void sortTodos(String option) {
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
    for (var td in sortedTodos) {
      print(td.text);
    }

    emit(state.copyWith(shownTodos: sortedTodos));
  }
}

class TodoState {
  final List<ToDo> allTodos;
  final List<ToDo> shownTodos;

  TodoState({required this.allTodos, List<ToDo>? shownTodos})
      : shownTodos = shownTodos ?? allTodos;

  TodoState copyWith({List<ToDo>? allTodos, List<ToDo>? shownTodos}) {
    return TodoState(
      allTodos: allTodos ?? this.allTodos,
      shownTodos: shownTodos ?? this.shownTodos,
    );
  }
}
