import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo_app/ui/repo/todo_repository.dart';

class TodoCubit extends Cubit<void>{
  TodoCubit():super(0);

  var trepo = TodoRepository();

  Future<void> save (String person_title, String person_todo) async {
    trepo.save(person_title, person_todo);
    print("Person TODO saved : $person_title - $person_todo");
  }

}