part of 'post_bloc.dart';

abstract class PostSate extends Equatable {}

class PostSateLoading extends PostSate {
  @override
  List<Object?> get props => [];
}

class PostSateLoadedUser extends PostSate {
  final List<Users> users;

  PostSateLoadedUser(this.users);

  @override
  List<Object?> get props => [users];
}

class PostSateLoadedPost extends PostSate {
  final List<Post> post;

  PostSateLoadedPost(this.post);

  @override
  List<Object?> get props => [post];
}

class PostSateErro extends PostSate {
  final String msg;

  PostSateErro(this.msg);

  @override
  List<Object?> get props => [msg];
}
