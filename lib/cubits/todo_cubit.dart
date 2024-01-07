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
