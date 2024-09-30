import 'package:flutter_todo_app/sqlite/sqlite_helper.dart';
import 'package:flutter_todo_app/ui/entity/todo.dart';

class TodoRepository {

  Future<void>save (String todo_title, String todo_com) async {
    var db = await SqliteHelper.databaseConnection();
    var newTodo = Map<String, dynamic>();
    newTodo["todo_title"] = todo_title;
    newTodo["todo_com"] = todo_com;
    await db.insert("todo", newTodo);
    print("Person TODO saved : $todo_title- $todo_com");
  }

  Future<List<Todo>> todoLoad()async{
    var db = await SqliteHelper.databaseConnection();
    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM todo");

    return List.generate(maps.length, (i){
      var row =maps[i];
      print("$todoLoad()()");
      return Todo(todo_id: row["todo_id"], todo_title: row["todo_title"], todo_com: row["todo_com"]);

    });
  }
  Future<void> update (int todo_id, String todo_title, String todo_com) async{
    var db = await SqliteHelper.databaseConnection();
    var updateTodo = Map<String,dynamic>();
    updateTodo["todo_title"] = todo_title;
    updateTodo["todo_com"] = todo_com;
    await db.update("todo", updateTodo, where: "todo_id = ?", whereArgs: [todo_id]);
    print("Todo Update : $todo_id - $todo_title - $todo_com");
  }
  Future<void> delete(int todo_id)async{
    var db = await SqliteHelper.databaseConnection();
    await db.delete("todo", where: "todo_id = ?", whereArgs: [todo_id]);
    print("Delete Person : $todo_id");
  }
  Future<List<Todo>>  search(String seacrhtodo)async{
    var db = await SqliteHelper.databaseConnection();
    List<Map<String,dynamic>> maps = await db.rawQuery("Select * from todo where todo_title like'%$seacrhtodo%'");

    return List.generate(maps.length, (i){
      var row =maps[i];
      print("$todoLoad()()");
      return Todo(todo_id: row["todo_id"], todo_title: row["todo_title"], todo_com: row["todo_com"]);
    });
  }

}