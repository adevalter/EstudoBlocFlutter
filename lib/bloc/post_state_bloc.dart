part of 'post_bloc.dart';

abstract class PostSate extends Equatable {}

class PostSateLoading extends PostSate {
  @override
  List<Object?> get props => [];
}

class PostSateLoaded extends PostSate {
  final List<Post> result;

  PostSateLoaded(this.result);

  @override
  List<Object?> get props => [result];
}

class PostSateErro extends PostSate {
  final String msg;

  PostSateErro(this.msg);

  @override
  List<Object?> get props => [msg];
}
