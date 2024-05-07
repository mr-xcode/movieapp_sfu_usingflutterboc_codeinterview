import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movieapp_sfu_usingflutterboc_codeinterview/data/model/movie.dart';
import 'package:http/http.dart' as http;

part 'nowplaying_event.dart';
part 'nowplaying_state.dart';

class NowplayingBloc extends Bloc<NowplayingEvent, NowplayingState> {
  NowplayingBloc() : super(NowplayingInitial()) {
    on<NowplayingEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<MyNowPlayingEvent>((event, emit) async {
      // TODO: implement event handler// emitting loading
      emit(NowPlayingLoading());

      Map<String, Movie> moviesList = {};
      var url;
      var response;

      try {
        url = Uri.parse(
            'https://api.themoviedb.org/3/movie/now_playing?api_key=19d6149f34738ec93c495cd0527246ae&language=en-US&page=1');

        var response = await http.get(url);

        if (response.statusCode == 200) {
          var jsonData = jsonDecode(response.body);
          List<dynamic> results = jsonData['results'];

          List<Movie> moviesList =
              results.map((movieData) => Movie.fromJson(movieData)).toList();
          print(moviesList.length);
          emit(NowPlayingLoaded(moviesList));
          //yield MovieLoaded(movies);
        } else {
          print("Cannot load data");
          //yield MovieError('Request failed with status: ${response.statusCode}');
        }
      } catch (e) {
        print(e.toString());
        //yield MovieError('An error occurred: $e');
        //emit(NowPlayingLoaded(movies));
      } catch (e) {
        emit(NowPlayingError());
        print(e.toString());
      }
    });
  }
}
