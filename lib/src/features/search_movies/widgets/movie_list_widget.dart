import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:muhammad_danyial_tentwenty_assignment/src/features/movie_list/usecases/get_upcoming_movies_list.dart';
import 'package:muhammad_danyial_tentwenty_assignment/utils/constants/color_constants.dart';
import 'package:muhammad_danyial_tentwenty_assignment/utils/constants/text_styles.dart';
import 'package:muhammad_danyial_tentwenty_assignment/utils/globals.dart';

class MovieListWidget extends StatelessWidget {
  final List<Movie> movies;
  const MovieListWidget({Key? key, required this.movies}) : super(key: key);

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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AutoSizeText(
                        movies[index].title,
                        maxFontSize: 16,
                        minFontSize: 8,
                        maxLines: 2,
                        style: context.getSubtitleTextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
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
