part of 'genre_bloc.dart';

sealed class GenreState extends Equatable {
  const GenreState();

  @override
  List<Object> get props => [];
}

final class GenreInitial extends GenreState {}

class GenresLoading extends GenreState {}

class GenresLoaded extends GenreState {
  final List<Genre> genre;
  const GenresLoaded(this.genre);
}

class GenresError extends GenreState {}
