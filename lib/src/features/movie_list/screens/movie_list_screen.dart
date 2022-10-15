import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:muhammad_danyial_tentwenty_assignment/src/features/movie_list/bloc/upcomming_movies_bloc.dart';
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
  @override
  void initState() {
    context.read<UpComingMoviesBloc>().add(GetUpComingMoviesEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: BlocConsumer<UpComingMoviesBloc, UpComingMoviesState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 30.h, horizontal: 20.w),
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
                : ListView.builder(
                    itemBuilder: (_, index) {
                      return Container();
                    },
                    itemCount: state.moviesList.results.length),
          );
        },
      ),
    ));
  }
}
