import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:muhammad_danyial_tentwenty_assignment/services/errors/failures.dart';
import 'package:muhammad_danyial_tentwenty_assignment/services/repository/repository.dart';
import 'package:muhammad_danyial_tentwenty_assignment/services/usecases/usecase.dart';

/// This use case will gets all images of the movie
/// Input: [int] image id.
/// Output: If successful returns [MovieImages] contains list of [Backdrop].
/// If unsuccessful returns [Failure]
class GetMovieImages extends UseCase<MovieImages, int> {
  final Repository repository;

  GetMovieImages(this.repository);
  @override
  Future<Either<Failure, MovieImages>> call(int params) async {
    return repository.getMovieImages(params);
  }
}

class MovieImages extends Equatable {
  const MovieImages({
    required this.id,
    required this.backdrops,
    required this.posters,
  });

  final int id;
  final List<Backdrop> backdrops;
  final List<Backdrop> posters;

  factory MovieImages.fromJson(Map<String, dynamic> json) => MovieImages(
        id: json["id"],
        backdrops: List<Backdrop>.from(json["backdrops"].map((x) => Backdrop.fromJson(x))),
        posters: List<Backdrop>.from(json["posters"].map((x) => Backdrop.fromJson(x))),
      );

  factory MovieImages.empty() => const MovieImages(
        id: 0,
        backdrops: [],
        posters: [],
      );

  @override
  List<Object?> get props => [id, backdrops, posters];
}

class Backdrop extends Equatable {
  const Backdrop({
    required this.aspectRatio,
    required this.filePath,
    required this.height,
    required this.iso6391,
    required this.voteAverage,
    required this.voteCount,
    required this.width,
  });

  final double aspectRatio;
  final String filePath;
  final int height;
  final String iso6391;
  final int voteAverage;
  final int voteCount;
  final int width;

  factory Backdrop.fromJson(Map<String, dynamic> json) => Backdrop(
        aspectRatio: json["aspect_ratio"].toDouble(),
        filePath: json["file_path"],
        height: json["height"],
        iso6391: json["iso_639_1"] ?? "",
        voteAverage: json["vote_average"],
        voteCount: json["vote_count"],
        width: json["width"],
      );

  @override
  List<Object?> get props => [aspectRatio, filePath, height, iso6391, voteAverage, voteCount, width];
}
