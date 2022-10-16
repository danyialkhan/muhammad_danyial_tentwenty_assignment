import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:muhammad_danyial_tentwenty_assignment/app/localization/locale_keys.g.dart';
import 'package:muhammad_danyial_tentwenty_assignment/src/features/common_widgets/booking_screen_appbar.dart';
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
        appBar: BookingScreenAppBar(
          movieName: widget.movieName,
          releaseDate: LocaleKeys.in_theaters_date.tr(args: [widget.releaseDate.getFormattedDate()]),
          onBackPress: () => context.pop(),
        ),
      ),
    );
  }
}
