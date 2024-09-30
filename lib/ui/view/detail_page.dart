
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo_app/ui/color.dart';
import 'package:flutter_todo_app/ui/entity/todo.dart';




import 'cubit/detail_cubit.dart';



class DetailPage extends StatefulWidget {
  Todo todo;

  DetailPage({required this.todo});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  var tfTodotitle= TextEditingController();
  var tfTodocom= TextEditingController();


  //This function brings the elements with the selected id to the update page when the application is opened.
  void initState(){
    super.initState();
    var Todo = widget.todo;
    tfTodotitle.text =Todo.todo_title;
    tfTodocom.text = Todo.todo_com;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: background,
        title: const Text("D E T A I L S",
        style: TextStyle(fontSize: 36, fontFamily: "goth", color: Colors.white),),centerTitle: true,),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SizedBox(
          height: 300, width: 400,
          child: Card(
            color: Colors.green,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextField(controller: tfTodotitle, decoration: const InputDecoration(hintText: "TODO TITLE"),style: TextStyle(fontFamily: "goth",color: Colors.white),),
                  TextField(controller: tfTodocom,decoration: const InputDecoration(hintText: "TODO COMMENT"),style: TextStyle(fontFamily: "goth",color: Colors.white)),
                  ElevatedButton(onPressed: (){
                    context.read<DetailCubit>().update(widget.todo.todo_id, tfTodotitle.text, tfTodocom.text);
                  }, child: const Text("U P D A T E", style: TextStyle(fontFamily: "goth"),))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}