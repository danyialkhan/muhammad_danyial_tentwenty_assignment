import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:muhammad_danyial_tentwenty_assignment/src/features/common_widgets/search_result_screen_appbar.dart';
import 'package:muhammad_danyial_tentwenty_assignment/src/features/generes/bloc/genre_bloc.dart';
import 'package:muhammad_danyial_tentwenty_assignment/src/features/search_movies/widgets/movie_list_widget.dart';
import 'package:muhammad_danyial_tentwenty_assignment/utils/constants/color_constants.dart';
import 'package:muhammad_danyial_tentwenty_assignment/utils/extensions/navigator_extensions.dart';
import 'package:muhammad_danyial_tentwenty_assignment/utils/globals.dart';

class MovieSearchResultScreen extends StatelessWidget {
  const MovieSearchResultScreen({Key? key}) : super(key: key);

  GenreBloc get genreBloc => sl();

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: genreBloc,
      child: const MovieSearchResultScreenContent(),
    );
  }
}

class MovieSearchResultScreenContent extends StatefulWidget {
  const MovieSearchResultScreenContent({Key? key}) : super(key: key);

  @override
  State<MovieSearchResultScreenContent> createState() => _MovieSearchResultScreenContentState();
}

class _MovieSearchResultScreenContentState extends State<MovieSearchResultScreenContent> {
  late ScrollController controller;

  @override
  void initState() {
    controller = ScrollController();
    controller.addListener(() {
      if (controller.position.pixels == controller.position.maxScrollExtent) {
        context.read<GenreBloc>().add(GetNextSearchPageEvent());
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: SearchResultScreenAppBar(
          onTapClose: () => context.pop(),
          totalResults: context.watch<GenreBloc>().state.totalResults,
        ),
        body: BlocBuilder<GenreBloc, GenreState>(
          builder: (context, state) {
            return Container(
              margin: EdgeInsets.symmetric(vertical: 30.h, horizontal: 21.w),
              child: CustomScrollView(
                controller: controller,
                slivers: [
                  MovieListWidget(
                    movies: state.movies,
                    genres: state.genres,
                  ),
                  if (state.searchingMoviesNextPage)
                    SliverToBoxAdapter(
                      child: Container(
                        margin: EdgeInsets.all(10.h),
                        alignment: Alignment.center,
                        child: CircularProgressIndicator(color: ColorConstants.secondaryAppColor),
                      ),
                    )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
