import 'package:flutter/material.dart';

import '../theme/colors.dart';

class CategoryBox extends StatelessWidget {
  final data;

  const CategoryBox({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(17),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: AppColor.shadowColor.withOpacity(.1),
                spreadRadius: 1,
                blurRadius: 1,
                offset: Offset(1, 1),
              )
            ],
          ),
          child: Icon(Icons.grid_view_rounded),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          data['name'],
          maxLines: 1,
          overflow: TextOverflow.fade,
          style: TextStyle(
            color: AppColor.textColor,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
