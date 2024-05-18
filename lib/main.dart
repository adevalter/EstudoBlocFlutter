import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testebloc/bloc/post_bloc.dart';
import 'package:testebloc/homepage.dart';
import 'package:testebloc/post_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PostBloc()..add(PostEventLoadedUser()),
          child: HomePage(),
        ),
        BlocProvider(
          create: (context) => PostBloc()..add(PostEventLoadedPost()),
          child: PostPage(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.deepPurple, background: Colors.blueAccent),
          useMaterial3: true,
        ),
        home: PostPage(),
      ),
    );
  }
}
