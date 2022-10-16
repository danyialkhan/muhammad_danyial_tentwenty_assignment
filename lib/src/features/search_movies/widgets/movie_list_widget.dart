import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:muhammad_danyial_tentwenty_assignment/app/localization/locale_keys.g.dart';
import 'package:muhammad_danyial_tentwenty_assignment/src/features/generes/usecases/get_generes.dart';
import 'package:muhammad_danyial_tentwenty_assignment/src/features/movie_list/usecases/get_upcoming_movies_list.dart';
import 'package:muhammad_danyial_tentwenty_assignment/utils/constants/color_constants.dart';
import 'package:muhammad_danyial_tentwenty_assignment/utils/constants/text_styles.dart';
import 'package:muhammad_danyial_tentwenty_assignment/utils/extensions/navigator_extensions.dart';
import 'package:muhammad_danyial_tentwenty_assignment/utils/globals.dart';
import 'package:muhammad_danyial_tentwenty_assignment/utils/router/route_params.dart';
import 'package:muhammad_danyial_tentwenty_assignment/utils/router/routes.dart';

class MovieListWidget extends StatelessWidget {
  final List<Movie> movies;
  final List<Genre> genres;
  const MovieListWidget({
    Key? key,
    required this.movies,
    required this.genres,
  }) : super(key: key);

  String _getGenre(Movie movie) {
    if (movie.genreIds.isNotEmpty) {
      final id = movie.genreIds.first;
      final genre = genres.firstWhere((element) => element.id == id, orElse: () => Genre.empty());
      return genre.name;
    }
    return '';
  }

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Container(
            margin: EdgeInsets.only(top: 20.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 100.h,
                  width: 130.w,
                  child: CachedNetworkImage(
                    imageUrl: '${imageUrl}w1280${movies[index].backdropPath}',
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    progressIndicatorBuilder: (context, url, downloadProgress) => Center(
                      child: CircularProgressIndicator(
                        value: downloadProgress.progress,
                        color: ColorConstants.secondaryAppGreyColor,
                      ),
                    ),
                    errorWidget: (context, url, error) => const Icon(Icons.image),
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 21.w),
                Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          context.pushNamed(
                            route: movieDetailsScreenRoute,
                            rootNavigator: true,
                            arguments: MovieDetailsScreenParams(
                              movieID: movies[index].id,
                              routeFrom: LocaleKeys.search.tr(),
                            ),
                          );
                        },
                        child: AutoSizeText(
                          movies[index].title,
                          maxFontSize: 16,
                          minFontSize: 8,
                          maxLines: 2,
                          style: context.getSubtitleTextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      if (movies[index].genreIds.isNotEmpty) ...[
                        SizedBox(height: 8.h),
                        AutoSizeText(
                          _getGenre(movies[index]),
                          maxFontSize: 12,
                          minFontSize: 8,
                          maxLines: 2,
                          style: context.getButtonTextStyle(
                            fontWeight: FontWeight.w500,
                            color: ColorConstants.lightGreyFontColor,
                          ),
                        ),
                      ],
                    ],
                  ),
                )
              ],
            ),
          );
        },
        childCount: movies.length,
      ),
    );
  }
}
