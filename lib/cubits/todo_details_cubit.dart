import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inf/classes/todo.dart';

class TodoDetailsCubit extends Cubit<ToDo> {
  TodoDetailsCubit(ToDo initialState) : super(initialState);

  void updateTitle(String title) {
    emit(state.copyWith(text: title));
  }

  void updateDescription(String description) {
    emit(state.copyWith(description: description));
  }

  void updateDone() {
    emit(state.copyWith(done: !state.done));
    print(state.done);
  }

  void addToDoSubItem(String td) {
    ToDo sub =
        ToDo(id: DateTime.now().microsecondsSinceEpoch.toString(), text: td);

    emit(state.copyWith(subtask: sub));
  }

  void handleSubChange(ToDo todo) {
    List<ToDo> updatedSubs = List.from(state.subtasks);
    int index = updatedSubs.indexWhere((item) => item.id == todo.id);

    if (index != -1) {
      updatedSubs[index] = todo.copyWith(done: !todo.done);
      emit(state.copyWith(subtasks: updatedSubs));
    }
  }

  void handleDeleteSub(String id) {
    emit(state.copyWith(
      subtasks: List.from(state.subtasks)..removeWhere((item) => item.id == id),
    ));
  }

  bool isDone() {
    return state.done;
  }
}
