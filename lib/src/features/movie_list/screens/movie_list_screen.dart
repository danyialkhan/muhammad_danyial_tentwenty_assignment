import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:muhammad_danyial_tentwenty_assignment/app/localization/locale_keys.g.dart';
import 'package:muhammad_danyial_tentwenty_assignment/src/features/common_widgets/custom_app_bar.dart';
import 'package:muhammad_danyial_tentwenty_assignment/src/features/movie_list/bloc/upcomming_movies_bloc.dart';
import 'package:muhammad_danyial_tentwenty_assignment/utils/constants/color_constants.dart';
import 'package:muhammad_danyial_tentwenty_assignment/utils/constants/text_styles.dart';
import 'package:muhammad_danyial_tentwenty_assignment/utils/extensions/navigator_extensions.dart';
import 'package:muhammad_danyial_tentwenty_assignment/utils/globals.dart';
import 'package:shimmer/shimmer.dart';

class MovieListScreen extends StatelessWidget {
  const MovieListScreen({Key? key}) : super(key: key);

  UpComingMoviesBloc get upcomingMovieBloc => sl();

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: upcomingMovieBloc,
      child: const MovieListScreenContent(),
    );
  }
}

class MovieListScreenContent extends StatefulWidget {
  const MovieListScreenContent({Key? key}) : super(key: key);

  @override
  State<MovieListScreenContent> createState() => _MovieListScreenContentState();
}

class _MovieListScreenContentState extends State<MovieListScreenContent> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    context.read<UpComingMoviesBloc>().add(GetUpComingMoviesEvent());
    scrollController.addListener(() {
      if ((scrollController.position.pixels == scrollController.position.maxScrollExtent)) {
        context.read<UpComingMoviesBloc>().add(GetNextUpComingMoviesPageEvent());
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          onTapSearch: () => context.pushNamed(route: '/genreScreen'),
        ),
        backgroundColor: ColorConstants.secondaryAppGreyColor,
        body: BlocConsumer<UpComingMoviesBloc, UpComingMoviesState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Container(
              margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
              child: state.fetching
                  ? Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: ListView.builder(
                        itemCount: 6,
                        itemBuilder: (context, index) {
                          return Card(
                            elevation: 1.0,
                            margin: EdgeInsets.only(bottom: 10.h),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: SizedBox(height: 0.3.sh),
                          );
                        },
                      ),
                    )
                  : state.results.isEmpty
                      ? Center(
                          child: Column(
                            children: [
                              const Icon(Icons.hourglass_empty),
                              Text(LocaleKeys.results_not_found.tr()),
                            ],
                          ),
                        )
                      : ListView.builder(
                          controller: scrollController,
                          shrinkWrap: true,
                          itemBuilder: (_, index) {
                            return Card(
                              elevation: 1.0,
                              margin: EdgeInsets.only(bottom: 10.h),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Stack(
                                children: [
                                  SizedBox(
                                    height: 0.3.sh,
                                    child: CachedNetworkImage(
                                      imageUrl: '${imageUrl}w1280${state.results[index].backdropPath}',
                                      progressIndicatorBuilder: (context, url, downloadProgress) => Center(
                                        child: CircularProgressIndicator(
                                          value: downloadProgress.progress,
                                          color: ColorConstants.primaryAppColor,
                                        ),
                                      ),
                                      errorWidget: (context, url, error) => const Icon(Icons.image),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 20.h,
                                    left: 10.w,
                                    child: Container(
                                      padding: EdgeInsets.all(5.h),
                                      decoration: BoxDecoration(color: ColorConstants.secondaryAppColor.withOpacity(0.4)),
                                      child: Text(
                                        state.results[index].title,
                                        style: context.getBodyText1TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: ColorConstants.primaryAppColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                          itemCount: state.results.length,
                        ),
            );
          },
        ),
      ),
    );
  }
}
