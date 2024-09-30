import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo_app/ui/view/cubit/detail_cubit.dart';
import 'package:flutter_todo_app/ui/view/cubit/home_cubit.dart';
import 'package:flutter_todo_app/ui/view/cubit/todo_cubit.dart';
import 'package:flutter_todo_app/ui/view/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeCubit()),
        BlocProvider(create: (context) => TodoCubit()),
        BlocProvider(create: (context) => DetailCubit())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: const HomePage(),
      ),
    );
  }
}


