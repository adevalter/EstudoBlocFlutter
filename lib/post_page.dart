import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testebloc/bloc/post_bloc.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
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

              if (state is PostSateLoadedPost) {
                return ListView.separated(
                  scrollDirection: Axis.vertical,
                  itemCount: state.post.length,
                  separatorBuilder: (BuildContext context, int index) =>
                      const SizedBox(
                    width: 10,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return Row(
                      children: [
                        Text(state.post[index].title),
                        Text(state.post[index].body),
                      ],
                    );
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
