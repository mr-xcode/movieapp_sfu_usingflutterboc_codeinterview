import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movieapp_sfu_usingflutterboc_codeinterview/data/api_service.dart';
import 'package:movieapp_sfu_usingflutterboc_codeinterview/data/id_data.dart';
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
      //Map<String, Movie> moviesList = {};
      var url;

      try {
        url = Uri.parse(
            'https://api.themoviedb.org/3/movie/popular?api_key=19d6149f34738ec93c495cd0527246ae&language=en-US&page=1');

        var response = await http.get(url);

        if (response.statusCode == 200) {
          var jsonData = jsonDecode(response.body);
          List<dynamic> results = jsonData['results'];

          List<Movie> moviesList =
              results.map((movieData) => Movie.fromJson(movieData)).toList();
          emit(MovieDetailLoaded(moviesList[0]));
        } else {
          emit(MovieDetailError());
        }
      } catch (e) {
        emit(MovieDetailError());
      }
    });

    Stream<MoviedetailsState> mapEventToState(UpdateDataEvent event) async* {
      IdData i = event.idData;
      String first = 'https://api.themoviedb.org/3/movie/';
      String second =
          '?api_key=19d6149f34738ec93c495cd0527246ae&language=en-US&page=1';
      var url = Uri.parse(first + i.id.toString() + second);
      try {
        emit(MovieDetailLoading());
        var response = await http.get(url);

        if (response.statusCode == 200) {
          var jsonData = jsonDecode(response.body);
          List<dynamic> results = jsonData['results'];

          List<Movie> moviesList =
              results.map((movieData) => Movie.fromJson(movieData)).toList();
          emit(MovieDetailLoaded(moviesList[0]));
        } else {
          emit(MovieDetailError());
        }
      } catch (e) {
        emit(MovieDetailError());
      }
    }
  }
}
