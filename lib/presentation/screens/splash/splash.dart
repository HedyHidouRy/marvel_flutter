import 'dart:async';

import 'package:flutter/material.dart';
import 'package:marvel/config/images.dart';
import 'package:marvel/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    scheduleMicrotask(() async {
      await Future<void>.delayed(const Duration(milliseconds: 400));
      await AppNavigator.replaceWith<void>(Routes.characters);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Image(
        image: AppImages.splash,
        fit: BoxFit.fitHeight,
        height: double.infinity,
        width: double.infinity,
      ),
    );
  }
}
