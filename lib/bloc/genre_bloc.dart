import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movieapp_sfu_usingflutterboc_codeinterview/data/model/genre.dart';
import 'package:movieapp_sfu_usingflutterboc_codeinterview/data/my_helper.dart';

part 'genre_event.dart';
part 'genre_state.dart';

class GenreBloc extends Bloc<GenreEvent, GenreState> {
  GenreBloc() : super(GenreInitial()) {
    on<GenreEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<MyGenresEvent>((event, emit) async {
      emit(GenresLoading());
      try {
        List genrs = await fetchGenres();
        List<Genre> genrsList =
            genrs.map((movieData) => Genre.fromJson(movieData)).toList();
        emit(GenresLoaded(genrsList));
      } catch (e) {
        emit(GenresError());
      }
    });
  }
}
