import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final double width;
  final double height;
  final Icon icon;
  final Color? iconColor;
  final Color? textColor;

  const CustomButton({
    super.key,
    required this.title,
    required this.onPressed,
    required this.width,
    required this.height,
    required this.icon,
    this.iconColor,
    this.textColor,
    required Color color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width.w,
      height: height.h,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(14.r),
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.25),
            offset: Offset.fromDirection(2, 3),
            blurRadius: 2.r,
          ),
        ],
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            10.horizontalSpace,
            Text(
              title,
              style: TextStyle(
                color: textColor ?? Colors.black,
                fontSize: 22.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
