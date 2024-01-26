import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inf/classes/todo.dart';
import 'package:inf/data_sources/todo_DataSource.dart';

class TodoDetailsCubit extends Cubit<DetailsState> {
  TodoDetailsCubit({required ToDo td, required this.dataSource})
      : super(DetailsState(toDo: td));

  final IsarTodoDataSource dataSource;
  bool isDone() {
    return state.toDo.done;
  }

  Future<void> refresh(List<Subtask>? subs) async {
    final tdcopy = await dataSource.get(state.toDo.id);
    final copiedList = tdcopy?.subtasks.toList();
    emit(DetailsState(toDo: tdcopy ?? state.toDo, sub: subs ?? copiedList));
  }

  Future<void> TitleChange(String txt) async {
    await dataSource.UpdateTitle(state.toDo.id, txt);
  }

  Future<void> DescChange(String txt) async {
    await dataSource.UpdateDesc(state.toDo.id, txt);
  }

  Future<void> DoneChange() async {
    await dataSource.UpdateDone(state.toDo.id);
    await refresh(null);
  }

  Future<void> SubDoneChange(int id) async {
    await dataSource.SubUpdateDone(id);
    await refresh(null);
  }

  Future<void> addToDoSubItem(String text) async {
    await addd(state.toDo.id, text);
    await refresh(null);
  }

  Future<void> addd(int id, String txt) async =>
      await dataSource.AddSub(id, txt);
  Future<void> handleDeleteSub(int id, Subtask del) async {
    await dataSource.DelSub(id, del);
    await refresh(null);
  }
}

class DetailsState {
  List<Subtask> subs;
  ToDo toDo;

  DetailsState({required this.toDo, List<Subtask>? sub})
      : subs = sub ?? toDo.subtasks.toList();
}
