import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../screens/detail_screen.dart';
import '../theme/colors.dart';

class FeatureCard extends StatelessWidget {
  final data;

  const FeatureCard({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => DetailScreen(),
        ));
      },
      child: Container(
        width: 250,
        height: 310,
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(bottom: 5, top: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: AppColor.shadowColor.withOpacity(.1),
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(1, 1),
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
                imageUrl: data['image'],
              ),
            ),
            Positioned(
              top: 180,
              right: 15,
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColor.primary,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  data['price'],
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Positioned(
              top: 215,
              child: Container(
                width: 260,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data['name'],
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: AppColor.textColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              data['session'],
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
                              data['duration'],
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
                              data['review'],
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
