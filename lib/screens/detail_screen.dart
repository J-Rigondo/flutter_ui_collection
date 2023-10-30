import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '../theme/colors.dart';
import '../utils/data.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detail',
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 250,
                child: CachedNetworkImage(
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: imageProvider, fit: BoxFit.cover),
                    ),
                  ),
                  imageUrl: courses[0]['image'],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Cousr',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(7),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: AppColor.shadowColor.withOpacity(.1),
                            blurRadius: 1,
                            spreadRadius: 1,
                            offset: const Offset(1, 1),
                          ),
                        ]),
                    child: Icon(
                      Icons.bookmark,
                      color: AppColor.primary,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
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
                        courses[0]['session'],
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 10,
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
                        courses[0]['duration'],
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 10,
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
                        courses[0]['review'],
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'About Course',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
              ),
              const SizedBox(
                height: 10,
              ),
              ReadMoreText(
                courses[0]['description'],
                trimLines: 2,
                colorClickableText: Colors.pink,
                trimMode: TrimMode.Line,
                style: TextStyle(color: Colors.grey.shade600, fontSize: 19),
                // trimCollapsedText: 'Show more',
                // trimExpandedText: 'Show less',
                moreStyle: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: AppColor.primary,
                ),
                lessStyle: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: AppColor.primary,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                child: TabBar(
                  controller: _tabController,
                  tabs: [
                    Tab(
                      child: Text(
                        'Lessons',
                        style:
                            TextStyle(fontSize: 16, color: AppColor.textColor),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Excercises',
                        style:
                            TextStyle(fontSize: 16, color: AppColor.textColor),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 200,
                child: TabBarView(
                  controller: _tabController,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    Center(
                      child: Text('hi'),
                    ),
                    Center(
                      child: Text('hi 2'),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 75,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: AppColor.shadowColor.withOpacity(.05),
                spreadRadius: 1,
                blurRadius: 1,
                offset: Offset(0, 0)),
          ],
        ),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(right: 20),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'price',
                    style: TextStyle(fontSize: 20, color: Colors.grey),
                  ),
                  Text(
                    '\$1,000',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                height: 50,
                margin: EdgeInsets.symmetric(horizontal: 10),
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  gradient: LinearGradient(
                    colors: [Color(0xff8b5cf6), Color(0xff0d9488)],
                  ),
                ),
                child: Text(
                  'Buy Now',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
