import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:muhammad_danyial_tentwenty_assignment/app/localization/locale_keys.g.dart';
import 'package:muhammad_danyial_tentwenty_assignment/src/features/generes/usecases/get_generes.dart';
import 'package:muhammad_danyial_tentwenty_assignment/src/features/movie_details_screen/bloc/movie_detail_bloc.dart';
import 'package:muhammad_danyial_tentwenty_assignment/utils/constants/color_constants.dart';
import 'package:muhammad_danyial_tentwenty_assignment/utils/constants/text_styles.dart';
import 'package:muhammad_danyial_tentwenty_assignment/utils/extensions/extensions.dart';
import 'package:muhammad_danyial_tentwenty_assignment/utils/extensions/navigator_extensions.dart';
import 'package:muhammad_danyial_tentwenty_assignment/utils/globals.dart';
import 'package:muhammad_danyial_tentwenty_assignment/utils/router/route_params.dart';
import 'package:muhammad_danyial_tentwenty_assignment/utils/router/routes.dart';
import 'package:shimmer/shimmer.dart';

class MovieDetailsScreen extends StatelessWidget {
  final int id;
  final String routeFrom;
  const MovieDetailsScreen({
    Key? key,
    required this.id,
    required this.routeFrom,
  }) : super(key: key);

  MovieDetailsBloc get movieDetailsBloc => sl<MovieDetailsBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: movieDetailsBloc,
      child: MovieDetailsScreenContent(id: id, routeFrom: routeFrom),
    );
  }
}

class MovieDetailsScreenContent extends StatefulWidget {
  final int id;
  final String routeFrom;
  const MovieDetailsScreenContent({Key? key, required this.id, required this.routeFrom}) : super(key: key);

  @override
  State<MovieDetailsScreenContent> createState() => _MovieDetailsScreenContentState();
}

class _MovieDetailsScreenContentState extends State<MovieDetailsScreenContent> {
  @override
  void initState() {
    context.read<MovieDetailsBloc>().add(GetMovieDetailsEvent(widget.id));
    context.read<MovieDetailsBloc>().add(GetMovieImagesEvent(widget.id));
    context.read<MovieDetailsBloc>().add(GetMovieVideosEvent(widget.id));
    super.initState();
  }

  final colors = [
    ColorConstants.greenColor,
    ColorConstants.pinkColor,
    ColorConstants.goldenColor,
    ColorConstants.purpleColor,
    Colors.teal,
    Colors.orangeAccent,
    Colors.greenAccent,
  ];

  List<Widget> _getGenresList(List<Genre> genres) {
    var rng = Random();
    List<Widget> widgets = [];

    for (var genre in genres) {
      int num = rng.nextInt(6);
      final genreWidget = Container(
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.h),
        decoration: BoxDecoration(
          color: colors[num],
          borderRadius: BorderRadius.circular(15.r),
        ),
        alignment: Alignment.center,
        child: Text(
          genre.name,
          style: context.getButtonTextStyle(
            fontWeight: FontWeight.w600,
            color: ColorConstants.primaryAppColor,
          ),
        ),
      );
      widgets.add(genreWidget);
      widgets.add(SizedBox(width: 5.w));
    }
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: BlocBuilder<MovieDetailsBloc, MovieDetailsState>(builder: (context, state) {
                  return state.fetching
                      ? Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: SizedBox(
                            height: 0.5.sh,
                            width: double.infinity,
                          ),
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                SizedBox(
                                  width: double.infinity,
                                  child: CachedNetworkImage(
                                    imageUrl: '${imageUrl}w1280${state.movieDetails.posterPath}',
                                    progressIndicatorBuilder: (context, url, downloadProgress) => Center(
                                      child: Shimmer.fromColors(
                                        baseColor: Colors.grey[300]!,
                                        highlightColor: Colors.grey[100]!,
                                        child: SizedBox(
                                          height: 0.5.sh,
                                          width: double.infinity,
                                        ),
                                      ),
                                    ),
                                    errorWidget: (context, url, error) => const Icon(Icons.image),
                                  ),
                                ),
                                Positioned(
                                  top: 20.h,
                                  left: 15.w,
                                  child: Row(
                                    children: [
                                      IconButton(
                                        onPressed: () => context.pop(),
                                        icon: Icon(
                                          Icons.arrow_back_ios,
                                          color: ColorConstants.primaryAppColor,
                                          size: 25.h,
                                        ),
                                      ),
                                      Text(
                                        widget.routeFrom,
                                        style: context.getSubtitleTextStyle(
                                          color: ColorConstants.primaryAppColor,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  // top: 0,
                                  left: 0,
                                  bottom: 0,
                                  right: 0,
                                  child: Column(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color: ColorConstants.secondaryAppColor.withOpacity(0.4),
                                        ),
                                        child: Text(
                                          LocaleKeys.in_theaters_date.tr(args: [(state.movieDetails.releaseDate.getFormattedDate())]),
                                          style: context.getSubtitleTextStyle(
                                            color: ColorConstants.primaryAppColor,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 10.h),
                                      GestureDetector(
                                        onTap: () {
                                          context.pushNamed(
                                            route: bookingDateSelectionScreenRoute,
                                            rootNavigator: true,
                                            arguments: BookingScreenParams(
                                              movieName: state.movieDetails.title,
                                              releaseDate: state.movieDetails.releaseDate,
                                            ),
                                          );
                                        },
                                        child: Container(
                                          width: 243.w,
                                          height: 50.h,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10.r),
                                            color: ColorConstants.buttonColor,
                                          ),
                                          alignment: Alignment.center,
                                          child: Text(
                                            LocaleKeys.get_tickets.tr(),
                                            style: context.getSubtitleTextStyle(
                                              color: ColorConstants.primaryAppColor,
                                              fontSize: 14.sp,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 10.h),
                                      GestureDetector(
                                        onTap: state.fetchingVideos
                                            ? null
                                            : () {
                                                context.pushNamed(route: movieVideosListScreenRoute, rootNavigator: true);
                                              },
                                        child: Container(
                                          width: 243.w,
                                          height: 50.h,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10.r),
                                            color: ColorConstants.secondaryAppColor.withOpacity(0.6),
                                            border: Border.all(color: ColorConstants.buttonColor, width: 1),
                                          ),
                                          alignment: Alignment.center,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              state.fetchingVideos
                                                  ? CircularProgressIndicator(
                                                      color: ColorConstants.primaryAppColor,
                                                    )
                                                  : Icon(Icons.play_arrow, color: ColorConstants.primaryAppColor),
                                              Text(
                                                LocaleKeys.watch_trailer.tr(),
                                                style: context.getSubtitleTextStyle(
                                                  color: ColorConstants.primaryAppColor,
                                                  fontSize: 14.sp,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 40.h),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 40.w, vertical: 20.h),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    LocaleKeys.genres.tr(),
                                    style: context.getSubtitleTextStyle(fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    width: double.infinity,
                                    height: 25.h,
                                    child: ListView(
                                      scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,
                                      children: [
                                        ..._getGenresList(state.movieDetails.genres),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20.h),
                                  Divider(color: ColorConstants.secondaryAppColor.withOpacity(0.3)),
                                  SizedBox(height: 20.h),
                                  Text(
                                    LocaleKeys.overview.tr(),
                                    style: context.getSubtitleTextStyle(fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(height: 10.h),
                                  AutoSizeText.rich(
                                    TextSpan(
                                      text: state.movieDetails.overview,
                                      style: context.getButtonTextStyle(
                                        color: ColorConstants.overviewTextColor,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
