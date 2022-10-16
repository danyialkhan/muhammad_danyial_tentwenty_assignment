import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:muhammad_danyial_tentwenty_assignment/utils/constants/color_constants.dart';
import 'package:muhammad_danyial_tentwenty_assignment/utils/constants/text_styles.dart';

class BookingScreenAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String movieName;
  final String releaseDate;
  final void Function() onBackPress;
  const BookingScreenAppBar({
    Key? key,
    required this.movieName,
    required this.releaseDate,
    required this.onBackPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorConstants.primaryAppColor,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 10,
            bottom: 0,
            child: IconButton(
              onPressed: onBackPress,
              icon: Icon(
                Icons.arrow_back_ios,
                color: ColorConstants.secondaryAppColor,
              ),
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            bottom: 0,
            left: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  movieName,
                  style: context.getSubtitleTextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  releaseDate,
                  style: context.getButtonTextStyle(
                    fontWeight: FontWeight.w500,
                    color: ColorConstants.buttonColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(80.h);
}
