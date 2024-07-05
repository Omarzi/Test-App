import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:test_app/config/app_assets.dart';
import 'package:test_app/config/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  Animation<double>? fadingAnimation;

  @override
  void initState() {
    super.initState();

    initSlidingAnimation();

    navigateToHome();
  }

  @override
  void dispose() {
    animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: fadingAnimation!,
              builder: (context, child) {
                return Opacity(
                  opacity: fadingAnimation!.value,
                  child: Image.asset(AppAssets.logoIcon2),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void initSlidingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );

    fadingAnimation =
        Tween<double>(begin: 0.2, end: 1).animate(animationController!);

    animationController!.repeat(reverse: true);
  }

  void navigateToHome() {
    Future.delayed(
      const Duration(seconds: 2),
        () {
        Navigator.pushNamedAndRemoveUntil(context, RouteName.loginRoute, (route) => false);
        }
    );
  }
}
