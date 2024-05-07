part of 'moviedetails_bloc.dart';

sealed class MoviedetailsEvent extends Equatable {
  const MoviedetailsEvent();

  @override
  List<Object> get props => [];
}

class MyMoviesDeailsEvent extends MoviedetailsEvent {}

class UpdateDataEvent extends MoviedetailsEvent {
  late final IdData idData;

  UpdateDataEvent({required this.idData});
}
