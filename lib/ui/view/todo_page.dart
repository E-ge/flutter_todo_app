import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo_app/main.dart';
import 'package:flutter_todo_app/ui/color.dart';
import 'package:flutter_todo_app/ui/view/cubit/todo_cubit.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {

  var tfpersonTitle = TextEditingController();
  var tfpersonTodo = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: background,
        iconTheme: IconThemeData(color: Colors.white),
        title: const Text("T O D O",
        style: TextStyle(fontFamily: "goth",fontSize: 33,color: Colors.white),),centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SizedBox(
          width: 400, height: 400,
          child: Card(
            color: Colors.green,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextField(controller: tfpersonTitle,decoration: const InputDecoration(hintText: "TODO TITLE"),style: TextStyle(color: Colors.white, fontFamily: "goth"),),
                  TextField(controller: tfpersonTodo,decoration: const InputDecoration(hintText: "TODO"),style: TextStyle(color: Colors.white, fontFamily: "goth"),),
                  ElevatedButton(onPressed: (){
                    context.read<TodoCubit>().save(tfpersonTitle.text, tfpersonTodo.text);
                  }, child: const Text("S A V E", style: TextStyle(fontFamily: "goth",fontSize: 22),))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
