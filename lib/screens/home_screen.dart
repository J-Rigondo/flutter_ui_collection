import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:online_course_ui/screens/sliver_screen.dart';
import 'package:online_course_ui/screens/sliver_search_screen.dart';
import 'package:online_course_ui/screens/sliver_tabbar_screen.dart';
import 'package:online_course_ui/theme/colors.dart';
import 'package:online_course_ui/utils/data.dart';
import 'package:online_course_ui/widgets/gradient_text.dart';

import '../widgets/category_box.dart';
import '../widgets/feature_card.dart';
import '../widgets/recommend_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Futuregoing',
                  style: TextStyle(color: AppColor.labelColor, fontSize: 14),
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  'Good Morning!',
                  style: TextStyle(
                      color: AppColor.textColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            Badge(
              backgroundColor: AppColor.primary,
              // alignment: Alignment.topRight,
              smallSize: 12,
              child: Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.grey.withOpacity(.3),
                  ),
                ),
                child: Icon(
                  Icons.notifications_outlined,
                  color: AppColor.labelColor,
                  size: 30,
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 200,
                  width: double.infinity,
                  child: PageView.builder(
                    onPageChanged: (value) {
                      setState(() {
                        currentIndex = value;
                      });
                    },
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 200,
                        width: double.infinity,
                        margin: const EdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage('assets/slider.jpg'),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Positioned.fill(
                  bottom: 10,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                          4,
                          (index) => AnimatedContainer(
                                duration: const Duration(milliseconds: 500),
                                width: index == currentIndex ? 15 : 8,
                                height: 8,
                                margin: EdgeInsets.only(right: 3),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  //다 둥글게 하고 싶으면 shape
                                  color: index == currentIndex
                                      ? Colors.black
                                      : Colors.transparent,
                                  border: Border.all(color: Colors.black),
                                ),
                              )),
                    ),
                  ),
                ),
              ],
            ),
            SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(5, 10, 0, 10),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                    categories.length,
                    (index) => Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 10),
                          child: CategoryBox(
                            data: categories[index],
                          ),
                        )),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const SliverScreen(),
                    ));
                  },
                  child: Text('basic sliver'),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const SliverSearchScreen(),
                    ));
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      gradient: LinearGradient(
                        colors: [Color(0xff8b5cf6), Color(0xff0d9488)],
                      ),
                    ),
                    child: Text(
                      'input sliver',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const SliverTabbarScreen(),
                    ));
                  },
                  child: Text('tab sliver'),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 20, 15, 10),
              child: Text(
                'Featured',
                style: TextStyle(
                    color: AppColor.textColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 23),
              ),
            ),
            CarouselSlider(
              items: List.generate(
                  features.length,
                  (index) => FeatureCard(
                        data: features[index],
                      )),
              options: CarouselOptions(
                viewportFraction: 0.7,
                height: 310,
                enlargeCenterPage: true,
                disableCenter: true,
                enableInfiniteScroll: true,
                // padEnds: false, // 기본 패딩
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GradientText(
              gradient: LinearGradient(
                colors: [Color(0xff8b5cf6), Color(0xff0d9488)],
              ),
              text: Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
                child: Text(
                  'Recommended',
                  style: TextStyle(
                      color: AppColor.textColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 23),
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                    recommends.length,
                    (index) => Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          child: RecommendCard(
                            data: recommends[index],
                          ),
                        )),
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
