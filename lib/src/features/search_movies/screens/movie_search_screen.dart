import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:muhammad_danyial_tentwenty_assignment/app/localization/locale_keys.g.dart';
import 'package:muhammad_danyial_tentwenty_assignment/src/features/common_widgets/search_app_bar.dart';
import 'package:muhammad_danyial_tentwenty_assignment/src/features/generes/bloc/genre_bloc.dart';
import 'package:muhammad_danyial_tentwenty_assignment/src/features/search_movies/widgets/movie_list_widget.dart';
import 'package:muhammad_danyial_tentwenty_assignment/utils/globals.dart';

class MovieSearchScreen extends StatelessWidget {
  const MovieSearchScreen({Key? key}) : super(key: key);

  GenreBloc get genreBloc => sl();

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: genreBloc,
      child: const MovieSearchScreenContent(),
    );
  }
}

class MovieSearchScreenContent extends StatefulWidget {
  const MovieSearchScreenContent({Key? key}) : super(key: key);

  @override
  State<MovieSearchScreenContent> createState() => _MovieSearchScreenContentState();
}

class _MovieSearchScreenContentState extends State<MovieSearchScreenContent> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: SearchAppBar(
          onTapClose: () => context.read<GenreBloc>().add(OnTapCrossEvent()),
          onChanged: (val) => context.read<GenreBloc>().add(OnSearchChangedEvent(val)),
          controller: context.read<GenreBloc>().controller,
        ),
        body: BlocBuilder<GenreBloc, GenreState>(
          builder: (context, state) {
            return Container(
              margin: EdgeInsets.symmetric(vertical: 30.h, horizontal: 21.w),
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            LocaleKeys.top_results.tr(),
                          ),
                        ),
                        SizedBox(height: 10.h),
                        const Divider(),
                      ],
                    ),
                  ),
                  MovieListWidget(
                    movies: state.movies,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
