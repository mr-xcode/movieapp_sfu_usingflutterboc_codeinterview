part of 'nowplaying_bloc.dart';

sealed class NowplayingState extends Equatable {
  const NowplayingState();

  @override
  List<Object> get props => [];
}

final class NowplayingInitial extends NowplayingState {}

// NowPlaying
class NowPlayingInitial extends NowplayingState {}

class NowPlayingLoading extends NowplayingState {}

class NowPlayingLoaded extends NowplayingState {
  final List<Movie> movies;
  const NowPlayingLoaded(this.movies);
  List<Object> get props => [movies];
}

class NowPlayingError extends NowplayingState {}
