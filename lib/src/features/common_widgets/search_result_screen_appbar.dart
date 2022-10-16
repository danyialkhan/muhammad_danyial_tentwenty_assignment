import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:muhammad_danyial_tentwenty_assignment/app/localization/locale_keys.g.dart';
import 'package:muhammad_danyial_tentwenty_assignment/utils/constants/color_constants.dart';
import 'package:muhammad_danyial_tentwenty_assignment/utils/constants/text_styles.dart';

class SearchResultScreenAppBar extends StatelessWidget implements PreferredSizeWidget {
  final void Function() onTapClose;
  final int totalResults;
  const SearchResultScreenAppBar({
    Key? key,
    required this.onTapClose,
    required this.totalResults,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorConstants.primaryAppColor,
      child: Container(
        margin: EdgeInsets.only(left: 10.w, right: 21.w, top: 10.h, bottom: 10.h),
        alignment: Alignment.center,
        child: Row(
          children: [
            IconButton(
              onPressed: onTapClose,
              icon: Icon(
                Icons.arrow_back_ios,
                size: 20.h,
              ),
            ),
            Text(
              LocaleKeys.results_found.tr(args: ['$totalResults']),
              style: context.getSubtitleTextStyle(fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60.h);
}
