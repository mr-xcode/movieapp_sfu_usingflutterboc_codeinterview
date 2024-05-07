part of 'moviedetails_bloc.dart';

sealed class MoviedetailsState extends Equatable {
  const MoviedetailsState();

  @override
  List<Object> get props => [];
}

final class MoviedetailsInitial extends MoviedetailsState {}

class MovieDetailLoading extends MoviedetailsState {}

class MovieDetailLoaded extends MoviedetailsState {
  final Movie movies;
  const MovieDetailLoaded(this.movies);
}

class MovieDetailError extends MoviedetailsState {}
