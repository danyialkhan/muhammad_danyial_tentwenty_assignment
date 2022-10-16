import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:muhammad_danyial_tentwenty_assignment/app/asset_paths/asset_pathc.dart';
import 'package:muhammad_danyial_tentwenty_assignment/app/localization/locale_keys.g.dart';
import 'package:muhammad_danyial_tentwenty_assignment/src/features/cenema_booking/widgets/seat_selection_widget.dart';
import 'package:muhammad_danyial_tentwenty_assignment/src/features/common_widgets/booking_screen_appbar.dart';
import 'package:muhammad_danyial_tentwenty_assignment/utils/constants/color_constants.dart';
import 'package:muhammad_danyial_tentwenty_assignment/utils/constants/text_styles.dart';
import 'package:muhammad_danyial_tentwenty_assignment/utils/extensions/extensions.dart';
import 'package:muhammad_danyial_tentwenty_assignment/utils/extensions/navigator_extensions.dart';

class SelectScreen extends StatefulWidget {
  final String movieName;
  final String releaseDate;
  const SelectScreen({
    Key? key,
    required this.movieName,
    required this.releaseDate,
  }) : super(key: key);

  @override
  State<SelectScreen> createState() => _SelectScreenState();
}

class _SelectScreenState extends State<SelectScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstants.primaryAppColor,
        appBar: BookingScreenAppBar(
          movieName: widget.movieName,
          releaseDate: LocaleKeys.in_theaters_date.tr(args: [widget.releaseDate.getFormattedDate()]),
          onBackPress: () => context.pop(),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 0.4.sh,
                child: const SeatSelectionWidget(),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 21.w, vertical: 30.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SeatInfoItem(
                          iconPath: AssetPaths.seatPath,
                          info: LocaleKeys.selected.tr(),
                          iconColor: ColorConstants.goldenColor,
                        ),
                        SizedBox(width: 55.w),
                        SeatInfoItem(
                          iconPath: AssetPaths.seatPath,
                          info: LocaleKeys.not_available.tr(),
                          iconColor: ColorConstants.notAvailableColor,
                        )
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SeatInfoItem(
                          iconPath: AssetPaths.seatPath,
                          info: LocaleKeys.vip.tr(args: ['150\$']),
                          iconColor: ColorConstants.purpleColor,
                        ),
                        SizedBox(width: 50.w),
                        SeatInfoItem(
                          iconPath: AssetPaths.seatPath,
                          info: LocaleKeys.regular.tr(args: ['50\$']),
                          iconColor: ColorConstants.buttonColor,
                        )
                      ],
                    ),
                    SizedBox(height: 32.h),
                    Container(
                      width: 95.w,
                      padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.h),
                      decoration: BoxDecoration(
                        color: ColorConstants.notAvailableColor.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: '4/',
                                  style: context.getBodyText2TextStyle(),
                                ),
                                TextSpan(
                                  text: '3 row',
                                  style: context.getBodyText2TextStyle(
                                    fontSize: 10.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 10.w),
                          const Icon(Icons.close),
                        ],
                      ),
                    ),
                    SizedBox(height: 70.h),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 50.h,
                            // margin: EdgeInsets.symmetric(horizontal: 21.w),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              color: ColorConstants.notAvailableColor.withOpacity(0.3),
                            ),
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  LocaleKeys.total_price.tr(),
                                  style: context.getBodyText2TextStyle(
                                    fontSize: 10.sp,
                                  ),
                                ),
                                Text(
                                  '\$ 50',
                                  style: context.getSubtitleTextStyle(),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Expanded(
                          flex: 2,
                          child: Container(
                            height: 50.h,
                            // margin: EdgeInsets.symmetric(horizontal: 21.w),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              color: ColorConstants.buttonColor,
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              LocaleKeys.proceed_to_pay.tr(),
                              style: context.getSubtitleTextStyle(
                                color: ColorConstants.primaryAppColor,
                                fontSize: 14.sp,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SeatInfoItem extends StatelessWidget {
  final String iconPath;
  final String info;
  final Color iconColor;
  const SeatInfoItem({
    Key? key,
    required this.iconPath,
    required this.info,
    required this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          iconPath,
          color: iconColor,
        ),
        SizedBox(width: 10.w),
        Text(
          info,
          style: context.getButtonTextStyle(
            fontWeight: FontWeight.w500,
            color: ColorConstants.screenTextColor,
          ),
        ),
      ],
    );
  }
}
