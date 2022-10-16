part of 'movie_detail_bloc.dart';

class MovieDetailsEvent {}

class GetMovieDetailsEvent extends MovieDetailsEvent {
  final int id;

  GetMovieDetailsEvent(this.id);
}
