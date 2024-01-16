import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inf/classes/todo.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit(List<ToDo> initialState) : super(TodoState(allTodos: initialState));

  void handleToDoChange(ToDo todo) {
    List<ToDo> updatedTodos = List.from(state.allTodos);
    int index = updatedTodos.indexWhere((item) => item.id == todo.id);

    if (index != -1) {
      updatedTodos[index] = todo.copyWith(done: !todo.done);
      emit(state.copyWith(allTodos: updatedTodos));

      if (state.shownTodos.contains(todo)) {
        List<ToDo> updatedShownTodos = List.from(state.shownTodos);
        int shownIndex =
            updatedShownTodos.indexWhere((item) => item.id == todo.id);
        if (shownIndex != -1) {
          updatedShownTodos[shownIndex] = updatedTodos[index];
          emit(state.copyWith(shownTodos: updatedShownTodos));
        }
      }
    }
  }

  void handleDeleteToDo(String id) {
    emit(state.copyWith(
      allTodos: List.from(state.shownTodos)
        ..removeWhere((item) => item.id == id),
      shownTodos: List.from(state.shownTodos)
        ..removeWhere((item) => item.id == id),
    ));
  }

  ToDo addToDoItem(String toDo) {
    ToDo td =
        ToDo(id: DateTime.now().microsecondsSinceEpoch.toString(), text: toDo);
    emit(state.copyWith(
      allTodos: List.from(state.allTodos)..add(td),
      shownTodos: List.from(state.shownTodos)..add(td),
    ));
    return td;
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
    print("\nbreak\n");
    emit(state.copyWith(shownTodos: sortedTodos));
    for (var td in state.shownTodos) {
      print(td.text);
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
