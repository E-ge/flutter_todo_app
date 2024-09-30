
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repo/todo_repository.dart';

class DetailCubit extends Cubit<void> {
  DetailCubit():super(0);

  var rrepo =  TodoRepository();

  Future<void> update (int person_id, String person_title, String person_todo) async{
    await rrepo.update(person_id, person_title, person_todo);
    print("Person Update : $person_id - $person_title - $person_todo");
  }

}