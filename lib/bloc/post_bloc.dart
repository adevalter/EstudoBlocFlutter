import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:testebloc/entitie/result.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testebloc/repositories/api_respository.dart';

part 'post_event_bloc.dart';
part 'post_state_bloc.dart';

class PostBloc extends Bloc<PostEvent, PostSate> {
  PostBloc() : super(PostSateLoading()) {
    on<PostEventLoaded>(_onFetchAll);
  }

  FutureOr<void> _onFetchAll(
      PostEventLoaded event, Emitter<PostSate> emit) async {
    emit(PostSateLoading());
    await Future.delayed(Duration(seconds: 3));
    try {
      final result = await ApiRepository.getPost();
      emit(PostSateLoaded(result));
    } catch (e) {
      emit(PostSateErro("Falha Consulta Lista"));
    }
  }
}
