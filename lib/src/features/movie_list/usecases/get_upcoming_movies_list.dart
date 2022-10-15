import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:muhammad_danyial_tentwenty_assignment/services/errors/failures.dart';
import 'package:muhammad_danyial_tentwenty_assignment/services/repository/repository.dart';
import 'package:muhammad_danyial_tentwenty_assignment/services/usecases/usecase.dart';

/// This use case will gets the list of all upcoming moves
/// Input: [GetUpComingMoviesListParams] contains api key, page no, language.
/// Output: If successful returns [MoviesList] List of upcoming [Movie] and other meta data.
/// If unsuccessful returns [Failure]
class GetUpComingMoviesList extends UseCase<MoviesList, GetUpComingMoviesListParams> {
  final Repository repository;
  GetUpComingMoviesList(this.repository);
  @override
  Future<Either<Failure, MoviesList>> call(GetUpComingMoviesListParams params) {
    return repository.getUpComingMovies(params);
  }
}

class GetUpComingMoviesListParams extends Equatable {
  final int page;
  final String language;

  const GetUpComingMoviesListParams({required this.page, required this.language});

  @override
  List<Object?> get props => [page, language];
}

class MoviesList extends Equatable {
  const MoviesList({
    required this.dates,
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  final Dates dates;
  final int page;
  final List<Movie> results;
  final int totalPages;
  final int totalResults;

  factory MoviesList.fromJson(Map<String, dynamic> json) => MoviesList(
        dates: Dates.fromJson(json["dates"]),
        page: json["page"],
        results: List<Movie>.from(json["results"].map((x) => Movie.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );

  factory MoviesList.empty() => MoviesList(
        dates: Dates.empty(),
        page: 0,
        results: const [],
        totalPages: 0,
        totalResults: 0,
      );

  @override
  List<Object?> get props => [dates, page, results, totalPages, totalResults];
}

class Dates extends Equatable {
  const Dates({
    required this.maximum,
    required this.minimum,
  });

  final DateTime maximum;
  final DateTime minimum;

  factory Dates.fromJson(Map<String, dynamic> json) => Dates(
        maximum: DateTime.parse(json["maximum"]),
        minimum: DateTime.parse(json["minimum"]),
      );

  factory Dates.empty() => Dates(maximum: DateTime.now(), minimum: DateTime.now());

  @override
  List<Object?> get props => [maximum, minimum];
}

class Movie extends Equatable {
  const Movie({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  final bool adult;
  final String backdropPath;
  final List<int> genreIds;
  final int id;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String posterPath;
  final DateTime releaseDate;
  final String title;
  final bool video;
  final double voteAverage;
  final int voteCount;

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        id: json["id"],
        originalLanguage: json["original_language"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        popularity: json["popularity"].toDouble(),
        posterPath: json["poster_path"],
        releaseDate: DateTime.parse(json["release_date"]),
        title: json["title"],
        video: json["video"],
        voteAverage: json["vote_average"].toDouble(),
        voteCount: json["vote_count"],
      );

  @override
  List<Object?> get props => [
        adult,
        backdropPath,
        genreIds,
        id,
        originalLanguage,
        originalTitle,
        overview,
        popularity,
        posterPath,
        releaseDate,
        title,
        video,
        voteAverage,
        voteCount,
      ];
}
