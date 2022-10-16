import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:muhammad_danyial_tentwenty_assignment/services/errors/failures.dart';
import 'package:muhammad_danyial_tentwenty_assignment/services/repository/repository.dart';
import 'package:muhammad_danyial_tentwenty_assignment/services/usecases/usecase.dart';

/// This use case will gets all videos of the movie
/// Input: [int] movie id.
/// Output: If successful returns [MovieVideos] contains list of [MovieVideo].
/// If unsuccessful returns [Failure]
class GetMovieVideos extends UseCase<MovieVideos, int> {
  final Repository repository;

  GetMovieVideos(this.repository);
  @override
  Future<Either<Failure, MovieVideos>> call(int params) {
    return repository.getMovieVideos(params);
  }
}

class MovieVideos extends Equatable {
  const MovieVideos({
    required this.id,
    required this.results,
  });

  final int id;
  final List<MovieVideo> results;

  factory MovieVideos.fromJson(Map<String, dynamic> json) => MovieVideos(
        id: json["id"],
        results: json["results"] == null ? [] : List<MovieVideo>.from(json["results"].map((x) => MovieVideo.fromJson(x))),
      );

  factory MovieVideos.empty() => const MovieVideos(results: [], id: 0);

  @override
  List<Object?> get props => [id, results];
}

class MovieVideo extends Equatable {
  const MovieVideo({
    required this.iso6391,
    required this.iso31661,
    required this.name,
    required this.key,
    required this.site,
    required this.size,
    required this.type,
    required this.official,
    required this.publishedAt,
    required this.id,
  });

  final String iso6391;
  final String iso31661;
  final String name;
  final String key;
  final String site;
  final int size;
  final String type;
  final bool official;
  final String publishedAt;
  final String id;

  factory MovieVideo.fromJson(Map<String, dynamic> json) => MovieVideo(
        iso6391: json["iso_639_1"] ?? '',
        iso31661: json["iso_3166_1"] ?? '',
        name: json["name"] ?? '',
        key: json["key"] ?? '',
        site: json["site"] ?? '',
        size: json["size"] ?? 0,
        type: json["type"] ?? '',
        official: json["official"] ?? false,
        publishedAt: json["published_at"] ?? '',
        id: json["id"],
      );

  factory MovieVideo.empty() => const MovieVideo(
        iso6391: '',
        iso31661: '',
        name: '',
        key: '',
        site: '',
        size: 0,
        type: '',
        official: false,
        publishedAt: '',
        id: '',
      );

  @override
  List<Object?> get props => [name, id, key];
}
