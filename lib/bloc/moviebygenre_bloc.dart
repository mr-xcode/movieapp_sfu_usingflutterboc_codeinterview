import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movieapp_sfu_usingflutterboc_codeinterview/data/model/movie.dart';
import 'package:http/http.dart' as http;

part 'moviebygenre_event.dart';
part 'moviebygenre_state.dart';

class MoviebygenreBloc extends Bloc<MoviebygenreEvent, MoviebygenreState> {
  MoviebygenreBloc() : super(MoviesByGenreInitial()) {
    on<MoviebygenreEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<MyMoviebygenreEvent>((event, emit) async {
      // emitting loading
      emit(MoviesByGenreInitial());

      Map<String, Movie> moviesList = {};
      var url;
      var response;

      try {
        url = Uri.parse(
            'https://api.themoviedb.org/3/movie/popular?api_key=19d6149f34738ec93c495cd0527246ae&language=en-US&page=1');

        var response = await http.get(url);

        if (response.statusCode == 200) {
          var jsonData = jsonDecode(response.body);
          print(jsonData.toString());
          List<dynamic> results = jsonData['results'];

          List<Movie> moviesList =
              results.map((movieData) => Movie.fromJson(movieData)).toList();
          print("Movie List Length" + moviesList.length.toString());
          emit(MoviesByGenreLoaded(moviesList));
        } else {
          emit(MoviesByGenreError());
        }
      } catch (e) {
        emit(MoviesByGenreError());
      }
    });
  }
}
