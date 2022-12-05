import 'dart:async';

import 'package:file_manager/app/resources/assets_manager.dart';
import 'package:file_manager/features/auth/presentation/screens/login_screen.dart';
import 'package:flutter/material.dart';

import '../../../../app/resources/color_manager.dart';
import 'package:lottie/lottie.dart';

import '../../../../app/resources/constants_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;

  _startDelay() {
    _timer = Timer(
      const Duration(
        seconds: AppConstants.splashDelay,
      ),
      _goNext,
    );
  }

  _goNext() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => LoginScreen()));
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Lottie.asset(
            JsonAssets.splashScreen,
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          Lottie.asset(
            JsonAssets.fileManager,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
