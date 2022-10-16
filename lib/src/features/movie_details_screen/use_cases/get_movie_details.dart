import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:muhammad_danyial_tentwenty_assignment/services/errors/failures.dart';
import 'package:muhammad_danyial_tentwenty_assignment/services/repository/repository.dart';
import 'package:muhammad_danyial_tentwenty_assignment/services/usecases/usecase.dart';
import 'package:muhammad_danyial_tentwenty_assignment/src/features/generes/usecases/get_generes.dart';

/// This use case will gets the details of movie against the provided id.
/// Input: [GetMovieDetailsParams] contains movie id.
/// Output: If successful returns [MovieDetails] details of the movie.
/// If unsuccessful returns [Failure]
class GetMovieDetails extends UseCase<MovieDetails, GetMovieDetailsParams> {
  final Repository repository;
  GetMovieDetails(this.repository);
  @override
  Future<Either<Failure, MovieDetails>> call(GetMovieDetailsParams params) {
    return repository.getMovieDetails(params);
  }
}

class GetMovieDetailsParams extends Equatable {
  final int movieId;

  const GetMovieDetailsParams(this.movieId);

  @override
  List<Object?> get props => [movieId];
}

class MovieDetails extends Equatable {
  const MovieDetails({
    required this.adult,
    required this.backdropPath,
    required this.belongsToCollection,
    required this.budget,
    required this.genres,
    required this.homepage,
    required this.id,
    required this.imdbId,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.productionCompanies,
    required this.productionCountries,
    required this.releaseDate,
    required this.revenue,
    required this.runtime,
    required this.spokenLanguages,
    required this.status,
    required this.tagline,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  final bool adult;
  final String backdropPath;
  final dynamic belongsToCollection;
  final int budget;
  final List<Genre> genres;
  final String homepage;
  final int id;
  final String imdbId;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String posterPath;
  final List<ProductionCompany> productionCompanies;
  final List<ProductionCountry> productionCountries;
  final String releaseDate;
  final int revenue;
  final int runtime;
  final List<SpokenLanguage> spokenLanguages;
  final String status;
  final String tagline;
  final String title;
  final bool video;
  final double voteAverage;
  final int voteCount;

  factory MovieDetails.fromJson(Map<String, dynamic> json) => MovieDetails(
        adult: json["adult"],
        backdropPath: json["backdrop_path"] ?? '',
        belongsToCollection: json["belongs_to_collection"],
        budget: json["budget"] ?? 0,
        genres: json["genres"] == null ? [] : List<Genre>.from(json["genres"].map((x) => Genre.fromJson(x))),
        homepage: json["homepage"] ?? '',
        id: json["id"],
        imdbId: json["imdb_id"],
        originalLanguage: json["original_language"] ?? "",
        originalTitle: json["original_title"] ?? '',
        overview: json["overview"] ?? '',
        popularity: json["popularity"].toDouble(),
        posterPath: json["poster_path"] ?? '',
        productionCompanies: json["production_companies"] == null ? [] : List<ProductionCompany>.from(json["production_companies"].map((x) => ProductionCompany.fromJson(x))),
        productionCountries: json["production_countries"] == null ? [] : List<ProductionCountry>.from(json["production_countries"].map((x) => ProductionCountry.fromJson(x))),
        releaseDate: json["release_date"] ?? '',
        revenue: json["revenue"] ?? 0,
        runtime: json["runtime"] ?? 0,
        spokenLanguages: json["spoken_languages"] == null ? [] : List<SpokenLanguage>.from(json["spoken_languages"].map((x) => SpokenLanguage.fromJson(x))),
        status: json["status"] ?? '',
        tagline: json["tagline"] ?? '',
        title: json["title"] ?? '',
        video: json["video"],
        voteAverage: json["vote_average"].toDouble(),
        voteCount: json["vote_count"],
      );

  factory MovieDetails.empty() => const MovieDetails(
        adult: false,
        backdropPath: '',
        belongsToCollection: '',
        budget: 0,
        genres: [],
        homepage: '',
        id: 0,
        imdbId: '',
        originalLanguage: '',
        originalTitle: '',
        overview: '',
        popularity: 0,
        posterPath: '',
        productionCompanies: [],
        productionCountries: [],
        releaseDate: '',
        revenue: 0,
        runtime: 0,
        spokenLanguages: [],
        status: '',
        tagline: '',
        title: '',
        video: false,
        voteAverage: 0,
        voteCount: 0,
      );

  @override
  List<Object?> get props => [
        adult,
        backdropPath,
        belongsToCollection,
        budget,
        genres,
        homepage,
        id,
        imdbId,
        originalLanguage,
        originalTitle,
        overview,
        popularity,
        posterPath,
        productionCompanies,
        productionCountries,
        releaseDate,
        revenue,
        runtime,
        spokenLanguages,
        status,
        tagline,
        title,
        video,
        voteAverage,
        voteCount,
      ];
}

class ProductionCompany extends Equatable {
  const ProductionCompany({
    required this.id,
    required this.logoPath,
    required this.name,
    required this.originCountry,
  });

  final int id;
  final String logoPath;
  final String name;
  final String originCountry;

  factory ProductionCompany.fromJson(Map<String, dynamic> json) => ProductionCompany(
        id: json["id"],
        logoPath: json["logo_path"] ?? "",
        name: json["name"],
        originCountry: json["origin_country"],
      );

  @override
  List<Object?> get props => [id, logoPath, name, originCountry];
}

class ProductionCountry extends Equatable {
  const ProductionCountry({
    required this.iso31661,
    required this.name,
  });

  final String iso31661;
  final String name;

  factory ProductionCountry.fromJson(Map<String, dynamic> json) => ProductionCountry(
        iso31661: json["iso_3166_1"],
        name: json["name"],
      );

  @override
  List<Object?> get props => [iso31661, name];
}

class SpokenLanguage extends Equatable {
  const SpokenLanguage({
    required this.englishName,
    required this.iso6391,
    required this.name,
  });

  final String englishName;
  final String iso6391;
  final String name;

  factory SpokenLanguage.fromJson(Map<String, dynamic> json) => SpokenLanguage(
        englishName: json["english_name"],
        iso6391: json["iso_639_1"],
        name: json["name"],
      );

  @override
  List<Object?> get props => [englishName, iso6391, name];
}
