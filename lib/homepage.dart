import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testebloc/bloc/post_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            color: Colors.cyan,
            child: BlocBuilder<PostBloc, PostSate>(builder: (context, state) {
              if (state is PostSateLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state is PostSateErro) {
                return Center(
                  child: Text(state.msg),
                );
              }

              if (state is PostSateLoadedUser) {
                return ListView.separated(
                  scrollDirection: Axis.vertical,
                  itemCount: state.users.length,
                  separatorBuilder: (BuildContext context, int index) =>
                      const SizedBox(
                    width: 10,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return Text(state.users[index].name);
                  },
                );
                ;
              } else {
                return const Center(
                    child: Text("Falha Geral todos os states falharam"));
              }
            })),
      ),
    );
  }
}
