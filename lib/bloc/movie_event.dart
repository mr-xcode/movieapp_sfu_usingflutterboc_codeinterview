part of 'movie_bloc.dart';

sealed class MovieEvent extends Equatable {
  const MovieEvent();

  @override
  List<Object> get props => [];
}

class NowPlayingEvent extends MovieEvent {}

class PopularEvent extends MovieEvent {}

class GenresEvent extends MovieEvent {}

class MoviesByGenreEvent extends MovieEvent {}

class MovieDetailEvent extends MovieEvent {}
