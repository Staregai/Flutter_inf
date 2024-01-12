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
    state.subtasks.add(sub);
    emit(state.copyWith(subtasks: state.subtasks));
  }

  bool isDone() {
    return state.done;
  }
}
