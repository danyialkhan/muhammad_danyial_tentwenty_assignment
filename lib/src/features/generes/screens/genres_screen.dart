import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:muhammad_danyial_tentwenty_assignment/app/localization/locale_keys.g.dart';
import 'package:muhammad_danyial_tentwenty_assignment/src/features/common_widgets/search_app_bar.dart';
import 'package:muhammad_danyial_tentwenty_assignment/src/features/generes/bloc/genre_bloc.dart';
import 'package:muhammad_danyial_tentwenty_assignment/src/features/home/bottom_tab_routes.dart';
import 'package:muhammad_danyial_tentwenty_assignment/utils/constants/color_constants.dart';
import 'package:muhammad_danyial_tentwenty_assignment/utils/constants/text_styles.dart';
import 'package:muhammad_danyial_tentwenty_assignment/utils/extensions/navigator_extensions.dart';
import 'package:muhammad_danyial_tentwenty_assignment/utils/globals.dart';
import 'package:shimmer/shimmer.dart';

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
        appBar: SearchAppBar(
          onTapClose: () => context.read<GenreBloc>().add(OnTapCrossEvent()),
          onChanged: (val) => context.read<GenreBloc>().add(OnSearchChangedEvent(val)),
          controller: context.read<GenreBloc>().controller,
        ),
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
          child: BlocConsumer<GenreBloc, GenreState>(
            listener: (context, state) {
              if (state is GoBackState) {
                context.pop();
                if(state.currentScreen != WatchTabRoutes.genreScreen) {
                  context.read<GenreBloc>().add(SetCurrentRouteEvent(WatchTabRoutes.genreScreen));
                }
                return;
              }

              if(state is GoToSearchScreenState) {
                if(state.currentScreen != WatchTabRoutes.searchScreen) {
                  context.pushNamed(route: WatchTabRoutes.searchScreen);
                  context.read<GenreBloc>().add(SetCurrentRouteEvent(WatchTabRoutes.searchScreen));
                }
                return;
              }
            },
            buildWhen: (c, p) => c.genres.isEmpty,
            builder: (context, state) {
              return state.fetching
                  ? Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: GridView.builder(
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
                            child: SizedBox(height: 0.1.sh),
                          );
                        },
                      ),
                    )
                  : state.genres.isEmpty
                      ? Center(
                          child: Column(
                            children: [
                              const Icon(Icons.hourglass_empty),
                              Text(LocaleKeys.results_not_found.tr()),
                            ],
                          ),
                        )
                      : GridView.builder(
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
