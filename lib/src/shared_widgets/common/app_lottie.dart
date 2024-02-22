import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


class AppLottie extends StatelessWidget {
  const AppLottie({
    super.key,
    required this.filePath,
    this.assetFile = true,
    this.repeat,
    this.height,
    this.width,
    this.fit,
  });

  final String filePath;
  final bool assetFile;
  final bool? repeat;
  final double? width;
  final double? height;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    if(assetFile) {
      return Lottie.asset(
        filePath,
        fit: fit?? BoxFit.cover,
        repeat: repeat,
        width: width,
        height: height,
      );
    }

    return Lottie.network(
      filePath,
      fit: fit?? BoxFit.cover,
      repeat: repeat,
      width: width,
      height: height,
    );
  }
}
