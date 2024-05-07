import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movieapp_sfu_usingflutterboc_codeinterview/data/model/genre.dart';
import 'package:movieapp_sfu_usingflutterboc_codeinterview/data/model/movie.dart';
import 'package:http/http.dart' as http;
import 'package:movieapp_sfu_usingflutterboc_codeinterview/data/my_helper.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  // Constructor
  MovieBloc() : super(MovieInitial()) {
    // Default
    on<MovieEvent>((event, emit) {
      // TODO: implement event handler
    });

    // Popular
    on<PopularEvent>((event, emit) async {
      // TODO: implement event handler

      // emitting loading
      emit(PopularLoading());

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
          emit(PopularLoaded(moviesList));
        } else {
          emit(PopularError());
        }
      } catch (e) {
        emit(PopularError());
      } catch (e) {
        emit(PopularError());
      }
    });

    // MoviesByGenre
    on<MoviesByGenreEvent>((event, emit) async {
      // TODO: implement event handler
      // emitting loading
      emit(MoviesByGenreLoading());

      Map<String, Movie> moviesList = {};
      var url;
      var response;

      try {
        url = Uri.parse(
            'https://api.themoviedb.org/3/discover/movie?with_genres=99&api_key=19d6149f34738ec93c495cd0527246ae');

        var response = await http.get(url);

        if (response.statusCode == 200) {
          var jsonData = jsonDecode(response.body);
          List<dynamic> results = jsonData['results'];

          List<Movie> moviesList =
              results.map((movieData) => Movie.fromJson(movieData)).toList();
          emit(MoviesByGenreLoaded(moviesList));
        } else {
          print("Cannot load data");
        }
      } catch (e) {
        print(e.toString());
      } catch (e) {
        emit(MoviesByGenreError());
      }
    });

    // MovieDetail
    on<MovieDetailEvent>((event, emit) async {
      // TODO: implement event handler
      // emitting loading
      emit(MovieDetailLoading());

      Map<String, Movie> moviesList = {};
      var url;
      var response;

      try {
        url = Uri.parse(
            'https://api.themoviedb.org/3/movie/464052?api_key=19d6149f34738ec93c495cd0527246ae&language=en-US&page=1');

        var response = await http.get(url);

        if (response.statusCode == 200) {
          var jsonData = jsonDecode(response.body);
          List<dynamic> results = jsonData['results'];

          List<Movie> moviesList =
              results.map((movieData) => Movie.fromJson(movieData)).toList();
          emit(MovieDetailLoaded(moviesList));
        } else {
          print("Cannot load data");
        }
      } catch (e) {
        print(e.toString());
      } catch (e) {
        emit(MovieDetailError());
      }
    });
  }
}
