
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedNetworkImageUtil{

  static CachedNetworkImage cacheNetworkImage({
    Key? key,
    required String imageUrl,
    double? width,
    double? height,
    BoxFit? fit,
    int? maxHeightDiskCache,
    int? maxWidthDiskCache,
    Widget Function(BuildContext, String)? placeholder,
    Widget Function(BuildContext, String, dynamic)? errorWidget,
  }){
    return CachedNetworkImage(
      key: key,
      imageUrl: imageUrl,
      width: width,
      height: height,
      fit: fit,
      maxHeightDiskCache: maxHeightDiskCache,
      maxWidthDiskCache: maxWidthDiskCache,
      placeholder: placeholder,
      errorWidget: errorWidget,
      fadeInDuration: const Duration(milliseconds: 200),
      fadeOutDuration: const Duration(milliseconds: 500),
    );
  }


  static CachedNetworkImageProvider cacheNetworkImageProvider(String imageUrl, {
    int? maxHeight,
    int? maxWidth,
    double scale = 1.0,
    void Function(Object)? errorListener,
  }){
    return CachedNetworkImageProvider(
      imageUrl,
      maxHeight: maxHeight,
      maxWidth: maxWidth,
      scale: scale,
      errorListener: errorListener,
    );
  }



}
