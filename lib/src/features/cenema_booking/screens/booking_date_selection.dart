import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:muhammad_danyial_tentwenty_assignment/app/localization/locale_keys.g.dart';
import 'package:muhammad_danyial_tentwenty_assignment/src/features/common_widgets/booking_screen_appbar.dart';
import 'package:muhammad_danyial_tentwenty_assignment/utils/constants/color_constants.dart';
import 'package:muhammad_danyial_tentwenty_assignment/utils/constants/text_styles.dart';
import 'package:muhammad_danyial_tentwenty_assignment/utils/extensions/extensions.dart';
import 'package:muhammad_danyial_tentwenty_assignment/utils/extensions/navigator_extensions.dart';
import 'package:muhammad_danyial_tentwenty_assignment/utils/router/route_params.dart';
import 'package:muhammad_danyial_tentwenty_assignment/utils/router/routes.dart';

class BookingDateSelectionScreen extends StatefulWidget {
  final String movieName;
  final String releaseDate;
  const BookingDateSelectionScreen({
    Key? key,
    required this.movieName,
    required this.releaseDate,
  }) : super(key: key);

  @override
  State<BookingDateSelectionScreen> createState() => _BookingDateSelectionScreenState();
}

class _BookingDateSelectionScreenState extends State<BookingDateSelectionScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: BookingScreenAppBar(
          movieName: widget.movieName,
          releaseDate: LocaleKeys.in_theaters_date.tr(args: [widget.releaseDate.getFormattedDate()]),
          onBackPress: () => context.pop(),
        ),
        body: Stack(
          children: [
            CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 60.h,
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 21.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          LocaleKeys.date.tr(),
                          style: context.getButtonTextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 20.h),
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    height: 32.h,
                    margin: EdgeInsets.symmetric(horizontal: 21.w),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 32.h,
                          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
                          margin: EdgeInsets.only(right: 12.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            color: index == 0 ? ColorConstants.buttonColor : ColorConstants.cardGreyColor.withOpacity(0.1),
                          ),
                          child: Text(
                            'Mar ${index + 1}',
                            style: context.getButtonTextStyle(
                              fontWeight: FontWeight.w600,
                              color: index == 0 ? ColorConstants.primaryAppColor : ColorConstants.secondaryAppColor,
                            ),
                          ),
                        );
                      },
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 30.h,
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    height: 0.3.sh,
                    margin: EdgeInsets.symmetric(horizontal: 21.w),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: '12:30',
                                    style: context.getButtonTextStyle(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const TextSpan(text: ' '),
                                  TextSpan(
                                    text: 'Cinetech + hall 1',
                                    style: context.getButtonTextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: ColorConstants.testGreyColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 0.2.sh,
                              margin: EdgeInsets.only(right: 12.w),
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.r), border: Border.all(color: ColorConstants.buttonColor, width: 1)),
                              child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 0.3.sw),
                                child: const Icon(Icons.ac_unit),
                              ),
                            ),
                            SizedBox(height: 15.h),
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'From',
                                    style: context.getButtonTextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: ColorConstants.testGreyColor,
                                    ),
                                  ),
                                  const TextSpan(text: ' '),
                                  TextSpan(
                                    text: '50\$',
                                    style: context.getButtonTextStyle(
                                      color: ColorConstants.secondaryAppColor,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'or',
                                    style: context.getButtonTextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: ColorConstants.testGreyColor,
                                    ),
                                  ),
                                  const TextSpan(text: ' '),
                                  TextSpan(
                                    text: '2500 bonus',
                                    style: context.getButtonTextStyle(
                                      color: ColorConstants.secondaryAppColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                      itemCount: 2,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 20.h,
              left: 0,
              right: 0,
              child: GestureDetector(
                onTap: () {
                  context.pushNamed(
                    route: selectSeatScreenRoute,
                    rootNavigator: true,
                    arguments: BookingScreenParams(
                      movieName: widget.movieName,
                      releaseDate: widget.releaseDate,
                    ),
                  );
                },
                child: Container(
                  height: 50.h,
                  margin: EdgeInsets.symmetric(horizontal: 21.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: ColorConstants.buttonColor,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    LocaleKeys.select_seats.tr(),
                    style: context.getSubtitleTextStyle(
                      color: ColorConstants.primaryAppColor,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
