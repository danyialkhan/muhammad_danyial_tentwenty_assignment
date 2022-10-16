part of 'genre_bloc.dart';

class GenreEvent {}

class GetAllGenresEvent extends GenreEvent {}

class OnTapCrossEvent extends GenreEvent {}

class OnSearchChangedEvent extends GenreEvent {
  final String query;
  final String fromPage;
  OnSearchChangedEvent({required this.query, required this.fromPage});
}

class SetCurrentRouteEvent extends GenreEvent {
  final String route;
  SetCurrentRouteEvent(this.route);
}

class GetNextSearchPageEvent extends GenreEvent {}
