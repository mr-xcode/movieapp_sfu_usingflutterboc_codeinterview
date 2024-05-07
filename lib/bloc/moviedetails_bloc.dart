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
      Map<String, Movie> moviesList = {};
      var url;
      var response;

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
  }
}
