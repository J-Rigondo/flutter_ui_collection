import 'package:flutter/material.dart';
import 'package:online_course_ui/screens/explore_screen.dart';
import 'package:online_course_ui/screens/home_screen.dart';
import 'package:online_course_ui/theme/colors.dart';

import '../widgets/bottom_item.dart';

class RootApp extends StatefulWidget {
  const RootApp({super.key});

  @override
  State<RootApp> createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(),
      bottomNavigationBar: buildBottomBar(),
    );
  }

  List tabItems = [
    {'page': HomePage()},
    {'page': ExploreScreen()},
    {'page': Container()},
    {'page': Container()},
    {'page': Container()},
  ];

  buildBody() {
    return IndexedStack(
      index: activeIndex,
      children:
          List.generate(tabItems.length, (index) => tabItems[index]['page']),
    );
  }

  buildBottomBar() {
    return Container(
      width: double.infinity,
      height: 65,
      padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
      decoration: BoxDecoration(
        color: AppColor.bottomBarColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColor.shadowColor.withOpacity(.1),
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(1, 1),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BottomItem(
            icon: Icons.home_outlined,
            isActive: activeIndex == 0,
            onTap: () {
              setState(() {
                activeIndex = 0;
              });
            },
          ),
          BottomItem(
            icon: Icons.search_sharp,
            isActive: activeIndex == 1,
            onTap: () {
              setState(() {
                activeIndex = 1;
              });
            },
          ),
          BottomItem(
            icon: Icons.play_circle_outline,
            isActive: activeIndex == 2,
            onTap: () {
              setState(() {
                activeIndex = 2;
              });
            },
          ),
          BottomItem(
            icon: Icons.comment_outlined,
            isActive: activeIndex == 3,
            onTap: () {
              setState(() {
                activeIndex = 3;
              });
            },
          ),
          BottomItem(
            icon: Icons.account_circle_outlined,
            isActive: activeIndex == 4,
            onTap: () {
              setState(() {
                activeIndex = 4;
              });
            },
          ),
        ],
      ),
    );
  }
}
