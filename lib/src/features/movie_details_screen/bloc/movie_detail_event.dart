part of 'movie_detail_bloc.dart';

class MovieDetailsEvent {}

class GetMovieDetailsEvent extends MovieDetailsEvent {
  final int id;

  GetMovieDetailsEvent(this.id);
}

class GetMovieVideosEvent extends MovieDetailsEvent {
  final int id;

  GetMovieVideosEvent(this.id);
}

class GetMovieImagesEvent extends MovieDetailsEvent {
  final int id;

  GetMovieImagesEvent(this.id);
}
