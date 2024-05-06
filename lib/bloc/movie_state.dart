part of 'movie_bloc.dart';

sealed class MovieState extends Equatable {
  const MovieState();

  @override
  List<Object> get props => [];
}

final class MovieInitial extends MovieState {}

// NowPlaying
class NowPlayingInitial extends MovieState {}

class NowPlayingLoading extends MovieState {}

class NowPlayingLoaded extends MovieState {
  final List<Movie> movies;
  const NowPlayingLoaded(this.movies);
}

class NowPlayingError extends MovieState {}

// Popular
class PopularInitial extends MovieState {}

class PopularLoading extends MovieState {}

class PopularLoaded extends MovieState {
  final List<Movie> movies;
  const PopularLoaded(this.movies);
}

class PopularError extends MovieState {}

// Genres
class GenresInitial extends MovieState {}

class GenresLoading extends MovieState {}

class GenresLoaded extends MovieState {
  final List<Movie> movies;
  const GenresLoaded(this.movies);
}

class GenresError extends MovieState {}

// MoviesByGenre
class MoviesByGenreInitial extends MovieState {}

class MoviesByGenreLoading extends MovieState {}

class MoviesByGenreLoaded extends MovieState {
  final List<Movie> movies;
  const MoviesByGenreLoaded(this.movies);
}

class MoviesByGenreError extends MovieState {}

// MovieDetail
class MovieDetailInitial extends MovieState {}

class MovieDetailLoading extends MovieState {}

class MovieDetailLoaded extends MovieState {
  final List<Movie> movies;
  const MovieDetailLoaded(this.movies);
}

class MovieDetailError extends MovieState {}
