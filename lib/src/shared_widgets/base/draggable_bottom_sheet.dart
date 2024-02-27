import 'package:flutter/material.dart';

import '../../../core/utils/helper_util.dart';

class DraggableBottomSheet extends StatelessWidget {
  const DraggableBottomSheet({
    super.key,
    this.initialChildSize = 0.93,
    this.minChildSize = 0.85,
    this.maxChildSize = 1.0,
    this.snap = false,
    this.closeModal = true,
    required this.builder,
  });

  final double initialChildSize;
  final double minChildSize;
  final double maxChildSize;
  final bool snap;
  final bool closeModal;
  final Widget Function(BuildContext, ScrollController) builder;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: closeModal ? (){
        Navigator.pop(context);
      } : null,
      child: GestureDetector(
        onTap: (){},
        child: DraggableScrollableSheet(
          initialChildSize: HelperUtil.isIOS ? (initialChildSize-0.05) : initialChildSize,
          minChildSize: HelperUtil.isIOS ? (minChildSize-0.05) : minChildSize,
          maxChildSize: HelperUtil.isIOS ? (maxChildSize-0.05) : maxChildSize,
          snap: snap,
          builder: builder,
        ),
      ),
    );
  }
}
