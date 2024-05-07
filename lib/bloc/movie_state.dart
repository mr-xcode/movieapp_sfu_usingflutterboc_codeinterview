part of 'movie_bloc.dart';

sealed class MovieState extends Equatable {
  const MovieState();

  @override
  List<Object> get props => [];
}

final class MovieInitial extends MovieState {}

// Popular
class PopularInitial extends MovieState {}

class PopularLoading extends MovieState {}

class PopularLoaded extends MovieState {
  final List<Movie> movies;
  const PopularLoaded(this.movies);
}

class PopularError extends MovieState {}
