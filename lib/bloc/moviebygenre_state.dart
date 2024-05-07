part of 'moviebygenre_bloc.dart';

sealed class MoviebygenreState extends Equatable {
  const MoviebygenreState();

  @override
  List<Object> get props => [];
}

class MoviesByGenreInitial extends MoviebygenreState {}

class MoviesByGenreLoading extends MoviebygenreState {}

class MoviesByGenreLoaded extends MoviebygenreState {
  final List<Movie> movies;
  const MoviesByGenreLoaded(this.movies);
}

class MoviesByGenreError extends MoviebygenreState {}
