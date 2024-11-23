import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gif/gif.dart';

import 'home_screens.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> animation;
  late GifController gifController;

  @override
  void initState() {
    super.initState();
    gifController = GifController(vsync: this);
    gifController.repeat(
      period: const Duration(seconds: 9),
    );

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 9),
    );
    animation = Tween<double>(begin: 0.7, end: 1.5).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
    _animationController.forward();

    Timer(
      const Duration(seconds: 9),
      () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreens()),
        );
      },
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    gifController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: ScaleTransition(
                scale: animation,
                child: Gif(
                  width: 250,
                  height: 250,
                  image: const AssetImage("assets/animation/lottie.gif"),
                  controller: gifController,
                  autostart: Autostart.loop,
                ),
              ),
            ),
            10.verticalSpace,
            Text(
              "COIN IDENTIFICATION",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
            10.verticalSpace,
            Text(
              "Identify coins instantly with \n precision and ease",
              style: TextStyle(
                fontSize: 14,
                color: Theme.of(context).colorScheme.inversePrimary,
                fontFamily: "Montserrat",
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
