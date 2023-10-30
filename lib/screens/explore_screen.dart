import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:online_course_ui/theme/colors.dart';
import 'package:online_course_ui/utils/data.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: AppColor.appBarColor,
              pinned: true,
              title: Container(
                child: Row(
                  children: [
                    Text(
                      'Explore',
                      style: TextStyle(
                          color: AppColor.textColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 24),
                    )
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: AppColor.shadowColor.withOpacity(.05),
                                spreadRadius: .5,
                                blurRadius: .5,
                                offset: Offset(0, 0),
                              ),
                            ]),
                        child: TextField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.grey,
                            ),
                            border: InputBorder.none,
                            hintText: 'search',
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: AppColor.primary,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        Icons.tune_outlined,
                        size: 30,
                        weight: 1,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(left: 15, top: 15, bottom: 15),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                        categories.length,
                        (index) => Container(
                              margin: EdgeInsets.only(right: 10),
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: index == 0
                                    ? AppColor.primary
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.computer,
                                    color: index == 0
                                        ? Colors.white
                                        : Colors.grey.shade700,
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    categories[index]['name'],
                                    style: TextStyle(
                                      color: index == 0
                                          ? Colors.white
                                          : Colors.grey.shade700,
                                    ),
                                  ),
                                ],
                              ),
                            )),
                  ),
                ),
              ),
            ),
            SliverList(
                delegate: SliverChildBuilderDelegate(
              childCount: courses.length,
              (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Container(
                    // width: 200,
                    height: 310,
                    padding: EdgeInsets.all(15),
                    margin: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: AppColor.shadowColor.withOpacity(.1),
                          blurRadius: 1,
                          spreadRadius: 1,
                          offset: const Offset(1, 1),
                        ),
                      ],
                    ),
                    child: Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 200,
                          child: CachedNetworkImage(
                            imageBuilder: (context, imageProvider) => Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                    image: imageProvider, fit: BoxFit.cover),
                              ),
                            ),
                            imageUrl: courses[index]['image'],
                          ),
                        ),
                        Positioned(
                            top: 180,
                            right: 15,
                            child: Container(
                              alignment: Alignment.center,
                              // width: 40,
                              // height: 40,
                              padding: EdgeInsets.all(7),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color:
                                          AppColor.shadowColor.withOpacity(.1),
                                      blurRadius: 1,
                                      spreadRadius: 1,
                                      offset: const Offset(1, 1),
                                    ),
                                  ]),
                              child: Icon(
                                Icons.bookmark,
                                color: AppColor.primary,
                              ),
                            )),
                        Positioned(
                          top: 210,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 6,
                              ),
                              Text(
                                courses[index]['name'],
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 23),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              SizedBox(
                                width: 220,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.play_circle_outline,
                                          size: 18,
                                          color: AppColor.labelColor,
                                        ),
                                        SizedBox(
                                          width: 3,
                                        ),
                                        Text(
                                          courses[index]['session'],
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.schedule_outlined,
                                          size: 18,
                                          color: AppColor.labelColor,
                                        ),
                                        SizedBox(
                                          width: 3,
                                        ),
                                        Text(
                                          courses[index]['duration'],
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          size: 18,
                                          color: Colors.yellow,
                                        ),
                                        SizedBox(
                                          width: 3,
                                        ),
                                        Text(
                                          courses[index]['review'],
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ))
          ],
        ),
      ),
    );
  }
}
