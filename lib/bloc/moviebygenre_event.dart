part of 'moviebygenre_bloc.dart';

sealed class MoviebygenreEvent extends Equatable {
  const MoviebygenreEvent();

  @override
  List<Object> get props => [];
}

class MyMoviebygenreEvent extends MoviebygenreEvent {}
