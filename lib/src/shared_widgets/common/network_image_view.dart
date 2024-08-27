
import 'package:flutter/material.dart';

import '../../../core/utils/app_theme_util.dart';
import '../../../core/utils/cached_network_image_util.dart';
import 'cached_image_error.dart';
import 'cached_image_placeholder.dart';

class NetworkImageView extends StatelessWidget {
  const NetworkImageView({
    super.key,
    required this.imageUrl,
    this.height,
    this.width,
    this.cacheHeight,
    this.cacheWidth,
    this.radius,
    this.borderRadius,
    this.shape = BoxShape.rectangle,
    this.fit,
  });

  final double? height;
  final double? cacheHeight;
  final double? width;
  final double? cacheWidth;
  final String imageUrl;
  final double? radius;
  final BorderRadiusGeometry? borderRadius;
  final BoxShape shape;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ClipRRect(
        borderRadius: borderRadius??  BorderRadius.circular(AppThemeUtil.radius(radius?? 0.0)),
        child: CachedNetworkImageUtil.cacheNetworkImage(
          key: UniqueKey(),
          imageUrl: imageUrl,
          fit: fit?? BoxFit.cover,
          height: cacheHeight,
          width: cacheWidth,
          placeholder: (context, url) =>  CachedImagePlaceholder(shape: shape,),
          errorWidget: (context, url, error) => const CachedImageError(),
        ),
      ),
    );
  }
}
