import 'package:equatable/equatable.dart';

class MovieDetailsScreenParams extends Equatable {
  final int movieID;
  final String routeFrom;

  const MovieDetailsScreenParams({required this.movieID, required this.routeFrom});

  @override
  List<Object?> get props => [movieID, routeFrom];
}

class BookingScreenParams extends Equatable {
  final String movieName;
  final String releaseDate;

  const BookingScreenParams({
    required this.movieName,
    required this.releaseDate,
  });

  @override
  List<Object?> get props => [movieName, releaseDate];
}
