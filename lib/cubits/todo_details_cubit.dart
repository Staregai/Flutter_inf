import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inf/classes/todo.dart';
import 'package:inf/data_sources/todo_DataSource.dart';

class TodoDetailsCubit extends Cubit<ToDo> {
  TodoDetailsCubit(ToDo initialState, {required this.dataSource})
      : super(initialState);

  final IsarTodoDataSource dataSource;
  bool isDone() {
    return state.done;
  }

  Future<void> TitleChange(String txt) async {
    await dataSource.UpdateTitle(state.id, txt);
  }

  Future<void> DescChange(String txt) async {
    await dataSource.UpdateDesc(state.id, txt);
    print("opis");
  }

  Future<void> DoneChange() async {
    await dataSource.UpdateDone(state.id);
  }
}
