import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movieapp_sfu_usingflutterboc_codeinterview/data/model/movie.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieBloc() : super(MovieInitial()) {
    on<MovieEvent>((event, emit) {
      // TODO: implement event handler
    });

    // NowPlaying
    on<MovieEvent>((event, emit) {
      // TODO: implement event handler
      emit(NowPlayingLoading());
      try {} catch (e) {
        print(e.toString());
      }
    });

    // Popular
    on<MovieEvent>((event, emit) {
      // TODO: implement event handler
    });

    // Genres
    on<MovieEvent>((event, emit) {
      // TODO: implement event handler
    });

    // MoviesByGenre
    on<MovieEvent>((event, emit) {
      // TODO: implement event handler
    });

    // MovieDetail
    on<MovieEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
