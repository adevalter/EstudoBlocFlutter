import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:testebloc/entitie/post.dart';
import 'package:testebloc/entitie/result.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testebloc/repositories/api_respository%20copy.dart';

part 'post_event_bloc.dart';
part 'post_state_bloc.dart';

class PostBloc extends Bloc<PostEvent, PostSate> {
  PostBloc() : super(PostSateLoading()) {
    on<PostEventLoadedUser>(_onFetchAllUser);
    on<PostEventLoadedPost>(_onFetchAllPost);
  }

  FutureOr<void> _onFetchAllUser(
      PostEventLoadedUser event, Emitter<PostSate> emit) async {
    emit(PostSateLoading());
    await Future.delayed(Duration(seconds: 3));
    try {
      final result = await ApiRepository.getUser();
      emit(PostSateLoadedUser(result));
    } catch (e) {
      emit(PostSateErro("Falha Consulta Lista"));
    }
  }

  FutureOr<void> _onFetchAllPost(
      PostEventLoadedPost event, Emitter<PostSate> emit) {}
}
