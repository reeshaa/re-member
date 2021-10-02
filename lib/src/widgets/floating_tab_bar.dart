import 'package:flutter/material.dart';
import 'package:re_member/src/configs/palette.dart';
import 'package:re_member/src/utils/constants.dart';

class FloatingTabBar extends StatelessWidget implements PreferredSizeWidget {
  const FloatingTabBar({
    Key? key,
    required this.tabController,
    required this.collectionTabs,
    this.height = 40.0,
    this.scrollable = true,
  }) : super(key: key);

  final TabController tabController;
  final List<Tab> collectionTabs;
  final double height;
  final bool scrollable;

  @override
  Size get preferredSize => Size.fromHeight(height);

  void onTap(int val) async {
    tabController.animateTo(
      val,
      duration: Duration(milliseconds: 100),
      curve: Curves.linear,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: scrollable ? 0.0 : 10.0, right: scrollable ? 0.0 : 10.0),
      child: Container(
        height: height,
        // margin: const EdgeInsets.only(top: 10.0,),
        decoration: BoxDecoration(
          color: Colors.grey[50],
          border: Border.all(
            color: Colors.black54,
            width: 0.5,
          ),
          borderRadius: borderRadiusLarge,
        ),
        child: TabBar(
          onTap: onTap,
          isScrollable: scrollable,
          unselectedLabelColor: Palette.inactiveText,
          indicatorSize: TabBarIndicatorSize.tab,
          indicator: BoxDecoration(
            color: Palette.selectedTab,
            borderRadius: borderRadiusLarge,
          ),
          labelColor: Colors.white,
          labelStyle: TextStyle(fontWeight: FontWeight.normal),
          unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w300),
          controller: tabController,
          tabs: collectionTabs,
        ),
      ),
    );
  }
}
