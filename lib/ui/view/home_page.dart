import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo_app/ui/color.dart';
import 'package:flutter_todo_app/ui/entity/todo.dart';
import 'package:flutter_todo_app/ui/view/cubit/home_cubit.dart';
import 'package:flutter_todo_app/ui/view/detail_page.dart';
import 'package:flutter_todo_app/ui/view/todo_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool sStatus = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<HomeCubit>().todoLoad();


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: background,
        actions: [
          sStatus ?
          IconButton(onPressed: (){
            setState(() {
              sStatus = false;
            });
            context.read<HomeCubit>().todoLoad();
          }, icon: Icon(Icons.clear),color: Colors.white,):
          IconButton(onPressed: (){
            setState(() {
              sStatus = true;
            });
          }, icon: Icon (Icons.search),color: Colors.white,)
        ],
        title: sStatus ?
        TextField(decoration: InputDecoration(hintText: "SEARCHING",),style: TextStyle(color: Colors.white, fontFamily: "goth"),
        onChanged: (result){
          context.read<HomeCubit>().search(result);
        },
        ): Text("H O M E",style: TextStyle(fontFamily: "goth",fontSize: 36, color: Colors.white),),centerTitle: true,
      ),
      body:
      BlocBuilder<HomeCubit, List<Todo>>(
        builder: (context,todoList){
          if(todoList.isNotEmpty){
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 1),
              itemCount: todoList.length,
              itemBuilder: (context,index){
                var todo = todoList[index];
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(todo: todo)))
                        .then((data){
                      context.read<HomeCubit>().todoLoad();
                    });
                    print("${todo.todo_title} is selected");
                  },
                  onLongPress: (){
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Do you want to delete this todo ${todo.todo_title}?"),
                      action: SnackBarAction(label: "Y E S", onPressed: (){
                        context.read<HomeCubit>().delete(todo.todo_id);
                      }),)
                    );
                  },
                  child: Card(
                    color: card,
                      child: SizedBox(height: 100,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(todo.todo_title,style: TextStyle(fontFamily: "goth",fontSize: 22, color: Colors.green),softWrap: true,maxLines: 1,),
                                    Text(todo.todo_com, style: TextStyle(fontSize: 18, color: Colors.white),softWrap: true,maxLines: 3,overflow: TextOverflow.ellipsis),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                  ),
                );
              },
            );
          }else{
            return const Center();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => const TodoPage()))
            .then((data){
              context.read<HomeCubit>().todoLoad();
              print("Return to Main Page");
        });
      },
      child: const Icon(Icons.add,color: Colors.white,),
      backgroundColor: Colors.green,
      ),
    );
  }
}
