
import 'package:bdp_payment_app/core/constants/colors.dart';
import 'package:bdp_payment_app/core/extensions/shimmer_extension.dart';
import 'package:flutter/material.dart';

class CachedImagePlaceholder extends StatelessWidget {
  const CachedImagePlaceholder({
    super.key,
    this.shape = BoxShape.rectangle,
  });

  final BoxShape shape;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: BDPColors.white,
        shape: shape,
      ),
    ).applyShimmer();
  }
}
