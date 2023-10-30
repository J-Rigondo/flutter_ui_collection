import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:online_course_ui/theme/colors.dart';

class RecommendCard extends StatelessWidget {
  final data;

  const RecommendCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            width: 80,
            height: 80,
            child: CachedNetworkImage(
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image:
                      DecorationImage(image: imageProvider, fit: BoxFit.cover),
                ),
              ),
              imageUrl: data['image'],
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data['name'],
                style: const TextStyle(
                  fontSize: 16,
                  color: AppColor.textColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                data['price'],
                style: TextStyle(
                  color: AppColor.textColor,
                ),
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
        ],
      ),
    );
  }
}
