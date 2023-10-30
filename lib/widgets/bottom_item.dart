import 'package:flutter/material.dart';

import '../theme/colors.dart';

class BottomItem extends StatelessWidget {
  final IconData icon;
  final bool isActive;
  final GestureTapCallback onTap;

  const BottomItem({
    super.key,
    required this.icon,
    this.isActive = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        padding: EdgeInsets.all(7),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: AppColor.bottomBarColor,
          boxShadow: [
            if (isActive)
              BoxShadow(
                color: AppColor.shadowColor.withOpacity(.1),
                spreadRadius: 2,
                blurRadius: 2,
                offset: Offset(0, 0),
              )
          ],
        ),
        duration: const Duration(milliseconds: 800),
        child: Icon(
          icon,
          color: isActive ? AppColor.primary : Colors.grey,
          size: 27,
        ),
      ),
    );
  }
}
