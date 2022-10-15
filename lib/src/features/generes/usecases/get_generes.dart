import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:muhammad_danyial_tentwenty_assignment/services/errors/failures.dart';
import 'package:muhammad_danyial_tentwenty_assignment/services/repository/repository.dart';
import 'package:muhammad_danyial_tentwenty_assignment/services/usecases/usecase.dart';

/// This use case will gets the list of all genres
/// Output: If successful returns [Genres] list of the genre.
/// may throw exception.
class GetMovieGenre extends UseCase<Genres, NoParams> {
  final Repository repository;
  GetMovieGenre(this.repository);

  @override
  Future<Either<Failure, Genres>> call(NoParams params) {
    return repository.getGenres();
  }
}

class Genres extends Equatable {
  const Genres({
    required this.genres,
  });

  final List<Genre> genres;

  factory Genres.fromJson(Map<String, dynamic> json) => Genres(
        genres: List<Genre>.from(json["genres"].map((x) => Genre.fromJson(x))),
      );

  @override
  List<Object?> get props => [genres];
}

class Genre extends Equatable {
  const Genre({
    required this.id,
    required this.name,
  });

  final int id;
  final String name;

  factory Genre.fromJson(Map<String, dynamic> json) => Genre(
        id: json["id"],
        name: json["name"],
      );

  @override
  List<Object?> get props => [id, name];
}
