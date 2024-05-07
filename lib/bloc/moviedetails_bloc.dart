import 'dart:convert';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movieapp_sfu_usingflutterboc_codeinterview/data/api_service.dart';
import 'package:movieapp_sfu_usingflutterboc_codeinterview/data/model/movie.dart';
import 'package:http/http.dart' as http;

part 'moviedetails_event.dart';
part 'moviedetails_state.dart';

class MoviedetailsBloc extends Bloc<MoviedetailsEvent, MoviedetailsState> {
  ApiService api;
  MoviedetailsBloc(this.api) : super(MoviedetailsInitial()) {
    on<MoviedetailsEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<MyMoviesDeailsEvent>((event, emit) async {
      emit(MovieDetailLoading());
    });
  }
}
