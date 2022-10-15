import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:muhammad_danyial_tentwenty_assignment/app/localization/locale_keys.g.dart';
import 'package:muhammad_danyial_tentwenty_assignment/utils/constants/color_constants.dart';
import 'package:muhammad_danyial_tentwenty_assignment/utils/constants/text_styles.dart';

class SearchAppBar extends StatelessWidget implements PreferredSizeWidget {
  final void Function() onTapClose;
  final TextEditingController controller;
  final void Function(String) onChanged;
  const SearchAppBar({
    Key? key,
    required this.onTapClose,
    required this.controller,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorConstants.primaryAppColor,
      child: Container(
        margin: EdgeInsets.only(left: 21.w, right: 21.w, top: 20.h, bottom: 10.h),
        decoration: BoxDecoration(
          color: ColorConstants.secondaryAppGreyColor,
          borderRadius: BorderRadius.circular(30.r),
        ),
        alignment: Alignment.center,
        child: TextField(
          controller: controller,
          autofocus: true,
          decoration: InputDecoration(
            border: InputBorder.none,
            icon: Container(
              margin: EdgeInsets.only(left: 15.h),
              child: Icon(
                Icons.search,
                size: 20.h,
                color: ColorConstants.secondaryAppColor,
              ),
            ),
            suffixIcon: IconButton(
              icon: Icon(
                Icons.close,
                size: 22.h,
                color: ColorConstants.secondaryAppColor,
              ),
              onPressed: onTapClose,
            ),
            hintText: LocaleKeys.tv_shows_movies_and_more.tr(),
            hintStyle: context.getBodyText2TextStyle(
              color: ColorConstants.secondaryAppColor.withOpacity(0.3),
            ),
          ),
          style: context.getBodyText2TextStyle(),
          onChanged: onChanged,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(80.h);
}
