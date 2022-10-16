import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:muhammad_danyial_tentwenty_assignment/app/asset_paths/asset_pathc.dart';
import 'package:muhammad_danyial_tentwenty_assignment/app/localization/locale_keys.g.dart';
import 'package:muhammad_danyial_tentwenty_assignment/src/features/cenema_booking/data/seates_data.dart';
import 'package:muhammad_danyial_tentwenty_assignment/utils/constants/color_constants.dart';
import 'package:muhammad_danyial_tentwenty_assignment/utils/constants/text_styles.dart';
import 'package:zoom_widget/zoom_widget.dart';

class SeatSelectionWidget extends StatelessWidget {
  const SeatSelectionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Zoom(
      initTotalZoomOut: true,
      canvasColor: ColorConstants.secondaryAppGreyColor,
      backgroundColor: ColorConstants.secondaryAppGreyColor,
      child: const SeatsWidgetWithArc(),
    );
  }
}

class SeatsWidgetWithArc extends StatelessWidget {
  const SeatsWidgetWithArc({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(AssetPaths.arcPath),
        Text(
          LocaleKeys.screen.tr(),
          style: context.getButtonTextStyle(
            fontSize: 8.sp,
            fontWeight: FontWeight.w500,
            color: ColorConstants.screenTextColor,
          ),
        ),
        const SeatsWidget(flexible: false),
      ],
    );
  }
}

class SeatsWidget extends StatelessWidget {
  final bool flexible;
  const SeatsWidget({Key? key, this.flexible = true}) : super(key: key);

  Widget _getRow(BuildContext context, List<Seat> seats) {
    if (flexible) {
      return Flexible(
        child: Row(
          children: [
            ..._getRowItem(context, seats),
          ],
        ),
      );
    }
    return Row(
      children: [
        ..._getRowItem(context, seats),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20.h),
        _getRow(context, row1),
        _getRow(context, row2),
        _getRow(context, row3),
        _getRow(context, row4),
        _getRow(context, row5),
        _getRow(context, row6),
        _getRow(context, row7),
        _getRow(context, row8),
        _getRow(context, row9),
        _getRow(context, row10),
      ],
    );
  }
}

List<Widget> _getRowItem(BuildContext context, List<Seat> seats) {
  List<Widget> widgets = [];

  for (var seat in seats) {
    switch (seat.seatType) {
      case SeatType.regular:
        widgets.add(
          Container(
            margin: EdgeInsets.symmetric(vertical: 5.h),
            child: SvgPicture.asset(
              AssetPaths.seatPath,
              color: ColorConstants.buttonColor,
              height: 5.h,
            ),
          ),
        );
        widgets.add(SizedBox(
          width: 5.w,
        ));
        break;
      case SeatType.selected:
        widgets.add(
          Container(
            margin: EdgeInsets.symmetric(vertical: 5.h),
            child: SvgPicture.asset(
              AssetPaths.seatPath,
              color: ColorConstants.goldenColor,
              height: 5.h,
            ),
          ),
        );
        widgets.add(SizedBox(width: 5.w));
        break;
      case SeatType.notAvailable:
        widgets.add(
          Container(
            margin: EdgeInsets.symmetric(vertical: 5.h),
            child: SvgPicture.asset(
              AssetPaths.seatPath,
              color: ColorConstants.notAvailableColor,
              height: 5.h,
            ),
          ),
        );
        widgets.add(SizedBox(width: 5.w));
        break;
      case SeatType.vip:
        widgets.add(
          Container(
            margin: EdgeInsets.symmetric(vertical: 5.h),
            child: SvgPicture.asset(
              AssetPaths.seatPath,
              color: ColorConstants.purpleColor,
              height: 5.h,
            ),
          ),
        );
        widgets.add(SizedBox(width: 5.w));
        break;
      case SeatType.empty:
        widgets.add(SizedBox(width: 5.w));
        widgets.add(SizedBox(width: 5.w));
        break;
      case SeatType.number:
        widgets.add(
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              seat.data,
              style: context.getButtonTextStyle(
                fontSize: 5.sp,
                color: ColorConstants.secondaryAppColor,
              ),
            ),
          ),
        );
        widgets.add(SizedBox(width: 5.w));
        break;
      case SeatType.space:
        widgets.add(SizedBox(width: 5.w));
        widgets.add(SizedBox(width: 5.w));
        break;
    }
  }
  return widgets;
}
