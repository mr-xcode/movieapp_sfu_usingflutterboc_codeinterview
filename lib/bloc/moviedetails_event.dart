part of 'moviedetails_bloc.dart';

sealed class MoviedetailsEvent extends Equatable {
  const MoviedetailsEvent();

  @override
  List<Object> get props => [];
}

class MyMoviesDeailsEvent extends MoviedetailsEvent {}
