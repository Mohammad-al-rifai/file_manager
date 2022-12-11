// ignore_for_file: must_be_immutable

import 'package:file_manager/app/resources/assets_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class DefaultLoading extends StatelessWidget {
  DefaultLoading({
    Key? key,
    this.xT = 0.0,
    this.yT = 0.0,
  }) : super(key: key);

  double xT;
  double yT;

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(xT, yT),
      child: Lottie.asset(
        JsonAssets.loading2,
        fit: BoxFit.fitWidth,
        width: 100.0,
      ),
    );
  }
}
