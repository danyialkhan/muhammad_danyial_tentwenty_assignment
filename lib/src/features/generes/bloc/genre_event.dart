part of 'genre_bloc.dart';

class GenreEvent {}

class GetAllGenresEvent extends GenreEvent {}

class OnTapCrossEvent extends GenreEvent {}

class OnSearchChangedEvent extends GenreEvent {
  final String query;
  OnSearchChangedEvent(this.query);
}