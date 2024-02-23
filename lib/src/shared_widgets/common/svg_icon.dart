import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ZSvgIcon extends StatelessWidget {
  const ZSvgIcon( this.assetName, {
    super.key,
    this.color,
    this.height,
    this.width,
    this.size,
  }) : assert((height != null && width!= null) || size != null);

  final String assetName;
  final Color? color;
  final double? height;
  final double? width;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/svgs/$assetName',
      colorFilter: color ==null? null: ColorFilter.mode(color!, BlendMode.srcIn),
      height: size?? height,
      width: size?? width,
      fit: BoxFit.cover,
    );
  }
}
