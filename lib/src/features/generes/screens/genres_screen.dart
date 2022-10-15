import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:muhammad_danyial_tentwenty_assignment/src/features/generes/bloc/genre_bloc.dart';
import 'package:muhammad_danyial_tentwenty_assignment/utils/constants/color_constants.dart';
import 'package:muhammad_danyial_tentwenty_assignment/utils/constants/text_styles.dart';
import 'package:muhammad_danyial_tentwenty_assignment/utils/globals.dart';

class GenreScreen extends StatelessWidget {
  const GenreScreen({Key? key}) : super(key: key);

  GenreBloc get genreBloc => sl();

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: genreBloc,
      child: const GenreScreenContent(),
    );
  }
}

class GenreScreenContent extends StatefulWidget {
  const GenreScreenContent({Key? key}) : super(key: key);

  @override
  State<GenreScreenContent> createState() => _GenreScreenContentState();
}

class _GenreScreenContentState extends State<GenreScreenContent> {
  @override
  void initState() {
    context.read<GenreBloc>().add(GetAllGenresEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.symmetric(vertical: 30.h, horizontal: 10.w),
          child: BlocBuilder<GenreBloc, GenreState>(
            builder: (context, state) {
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: state.genres.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 1.0,
                    margin: EdgeInsets.all(8.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                        margin: EdgeInsets.only(left: 15.w, bottom: 20.h),
                        child: Text(
                          state.genres[index].name,
                          style: context.getSubtitleTextStyle(
                            color: ColorConstants.primaryAppColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
