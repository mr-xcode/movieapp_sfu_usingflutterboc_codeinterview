part of 'nowplaying_bloc.dart';

sealed class NowplayingEvent extends Equatable {
  const NowplayingEvent();

  @override
  List<Object> get props => [];
}

class MyNowPlayingEvent extends NowplayingEvent {}
