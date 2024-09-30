import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_todo_app/ui/entity/todo.dart';
import 'package:flutter_todo_app/ui/repo/todo_repository.dart';

class HomeCubit extends Cubit<List<Todo>> {
  HomeCubit():super(<Todo>[]);

  var trepo = TodoRepository();

  Future<void> todoLoad()async{
    var list = await trepo.todoLoad();
    print(trepo.todoLoad());
    emit(list);
  }
  Future<void> delete(int todo_id)async{
    await trepo.delete(todo_id);
    print("Delete Person : $todo_id");
    await todoLoad();
  }
  Future<void>  search(String result)async{
    var list = await trepo.search(result);
    emit(list);
  }
}