import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:muhammad_danyial_tentwenty_assignment/src/features/movie_details_screen/bloc/movie_detail_bloc.dart';
import 'package:muhammad_danyial_tentwenty_assignment/utils/extensions/navigator_extensions.dart';
import 'package:muhammad_danyial_tentwenty_assignment/utils/globals.dart';
import 'package:muhammad_danyial_tentwenty_assignment/utils/router/routes.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoListScreen extends StatelessWidget {
  const VideoListScreen({Key? key}) : super(key: key);

  MovieDetailsBloc get movieDetailsBloc => sl<MovieDetailsBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: movieDetailsBloc,
      child: const VideoListScreenContent(),
    );
  }
}

/// Creates list of video players
class VideoListScreenContent extends StatefulWidget {
  const VideoListScreenContent({super.key});

  @override
  State<VideoListScreenContent> createState() => _VideoListScreenContentState();
}

class _VideoListScreenContentState extends State<VideoListScreenContent> {
  late List<YoutubePlayerController> _controllers;

  @override
  void initState() {
    _controllers = context
        .read<MovieDetailsBloc>()
        .state
        .movieVideos
        .results
        .map<YoutubePlayerController>((e) => YoutubePlayerController(
              initialVideoId: e.key,
              flags: const YoutubePlayerFlags(
                autoPlay: false,
              ),
            ))
        .toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.read<MovieDetailsBloc>().state.movieDetails.title),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.all(10.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                YoutubePlayer(
                  width: 0.5.sw,
                  key: ObjectKey(_controllers[index]),
                  controller: _controllers[index],
                  actionsPadding: const EdgeInsets.only(left: 16.0),
                  bottomActions: [
                    CurrentPosition(),
                    const SizedBox(width: 10.0),
                    ProgressBar(isExpanded: true),
                    const SizedBox(width: 10.0),
                    RemainingDuration(),
                    //FullScreenButton(),
                  ],
                ),
                SizedBox(width: 10.w),
                Flexible(
                  child: GestureDetector(
                    onTap: () {
                      context.pushNamed(
                        route: playVideoScreenRoute,
                        rootNavigator: true,
                        arguments: context.read<MovieDetailsBloc>().state.movieVideos.results[index].key,
                      );
                    },
                    child: AutoSizeText(
                      context.read<MovieDetailsBloc>().state.movieVideos.results[index].name,
                      maxFontSize: 16,
                      maxLines: 2,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        itemCount: _controllers.length,
      ),
    );
  }
}
