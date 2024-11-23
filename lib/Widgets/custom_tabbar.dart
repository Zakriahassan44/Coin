import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTabBar extends StatelessWidget {
  final int selectedIndex;
  final List<String> tabs;
  final Function(int) onTabSelected;
  final Color activeColor;
  final Color inactiveColor;
  final TextStyle activeTextStyle;
  final TextStyle inactiveTextStyle;
  final Color indicatorColor;
  final double indicatorHeight;

  const CustomTabBar({
    Key? key,
    required this.selectedIndex,
    required this.tabs,
    required this.onTabSelected,
    this.activeColor = Colors.blue,
    this.inactiveColor = Colors.grey,
    this.activeTextStyle = const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
    this.inactiveTextStyle = const TextStyle(fontSize: 14),
    this.indicatorColor = Colors.blue,
    this.indicatorHeight = 3.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: tabs.asMap().entries.map((entry) {
            int index = entry.key;
            String label = entry.value;
            bool isSelected = selectedIndex == index;

            return GestureDetector(
              onTap: () => onTabSelected(index),
              child: Column(
                children: [
                  Text(
                    label,
                    style: isSelected
                        ? activeTextStyle.copyWith(
                      color: activeColor,
                      fontSize: 16.sp,
                    )
                        : inactiveTextStyle.copyWith(
                      color: inactiveColor,
                      fontSize: 14.sp,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  if (isSelected)
                    Container(
                      height: indicatorHeight.h,
                      width: 20.w,
                      color: indicatorColor,
                    ),
                ],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
