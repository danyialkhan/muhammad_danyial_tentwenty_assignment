import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:muhammad_danyial_tentwenty_assignment/app/asset_paths/asset_pathc.dart';
import 'package:muhammad_danyial_tentwenty_assignment/src/features/common_widgets/comming_soon.dart';
import 'package:muhammad_danyial_tentwenty_assignment/src/features/home/bloc/bloc.dart';
import 'package:muhammad_danyial_tentwenty_assignment/utils/globals.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class HomeTabScreen extends StatelessWidget {
  const HomeTabScreen({Key? key}) : super(key: key);

  HomeTabBloc get homeTabBloc => sl<HomeTabBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: homeTabBloc,
      child: const HomeTabScreenContent(),
    );
  }
}

class HomeTabScreenContent extends StatefulWidget {
  const HomeTabScreenContent({Key? key}) : super(key: key);

  @override
  State<HomeTabScreenContent> createState() => _HomeTabScreenContentState();
}

class _HomeTabScreenContentState extends State<HomeTabScreenContent> {
  late PersistentTabController _controller;

  @override
  void initState() {
    _controller = PersistentTabController(initialIndex: 0);
    super.initState();
  }

  List<Widget> _buildScreens() {
    return [
      ComingSoon(),
      ComingSoon(),
      ComingSoon(),
      ComingSoon(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(AssetPaths.dashboardIconPath),
        title: ("dashboard".tr()),
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(AssetPaths.watchIconPath),
        title: ("Settings"),
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(AssetPaths.mediaLibraryIconPath),
        title: ("Settings"),
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(AssetPaths.moreIconPath),
        title: ("Settings"),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows: true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style6, // Choose the nav bar style with this property.
    );
  }
}
