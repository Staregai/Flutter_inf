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
}
