import 'dart:io';
import 'package:coin_identification/Screens/tab_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../Utils/picker.dart';
import '../Widgets/custom_button.dart';

class HomeScreens extends StatefulWidget {
  const HomeScreens({super.key});

  @override
  State<HomeScreens> createState() => _HomeScreensState();
}

class _HomeScreensState extends State<HomeScreens> {
  File? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).colorScheme.primary,
        elevation: 0,
        title: Text(
          'Coin Identification',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Coin Image
            Container(
              height: 200.h,
              width: 200.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                image: DecorationImage(
                  image: image == null
                      ? const AssetImage("assets/Images/coina.png")
                      : FileImage(image!) as ImageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            30.verticalSpace,
            Text(
              "Identify Coins",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w400,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
            15.verticalSpace,
            Text(
              "Click the button below to start identifying coins and get detailed information.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18.sp,
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),
            50.verticalSpace,
            CustomButton(
              title: 'Start Identifying',
              onPressed: () {
                dialog();
              },
              height: 70.h,
              width: 320.w,
              icon: const Icon(
                Icons.search,
                color: Colors.black,
              ),
              iconColor: Colors.white,
              textColor: Colors.black,
              color: Theme.of(context).colorScheme.primary,
            ),
            20.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TabScreen()),
                    );
                  },
                  title: 'Explore More Coins',
                  height: 70.h,
                  width: 320.w,
                  icon: const Icon(
                    Icons.explore_outlined,
                    color: Colors.black,
                  ),
                  iconColor: Colors.white,
                  textColor: Colors.black,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ],
            ),
            40.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Text(
                "© 2024 Coin Identifier. All rights reserved.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Theme.of(context)
                      .colorScheme
                      .onBackground
                      .withOpacity(0.6),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void dialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.topCenter,
            children: [
              Container(
                width: 300.w,
                padding: EdgeInsets.only(
                  top: 50.h,
                  left: 20.w,
                  right: 20.w,
                  bottom: 20.h,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                  color: Theme.of(context).colorScheme.tertiary,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Select Coin Image",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurface,
                        fontSize: 25,
                        fontWeight: FontWeight.w800,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    10.verticalSpace,
                    Text(
                      "Please select an option",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurface,
                        fontSize: 15,
                      ),
                    ),
                    10.verticalSpace,
                    CustomButton(
                      title: 'Gallery',
                      onPressed: () {
                        _gallery();
                        Navigator.of(context).pop();
                      },
                      width: 200.w,
                      height: 50.h,
                      icon: Icon(
                        Icons.photo_library_sharp,
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                      color: Colors.white,
                    ),
                    10.verticalSpace,
                    CustomButton(
                      title: 'Camera',
                      onPressed: () {
                        _camera();
                        Navigator.of(context).pop();
                      },
                      width: 200.w,
                      height: 50.h,
                      icon: Icon(Icons.camera_alt,
                          color: Theme.of(context).colorScheme.inversePrimary),
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // Camera
  Future<void> _camera() async {
    File? image = await Picker.pickImageFromCamera();
    if (image != null) {
      setState(() {
        this.image = image;
      });
    }
  }

  // Gallery
  Future<void> _gallery() async {
    File? image = await Picker.pickImageFromGallery();
    if (image != null) {
      setState(() {
        this.image = image;
      });
    }
  }
}
