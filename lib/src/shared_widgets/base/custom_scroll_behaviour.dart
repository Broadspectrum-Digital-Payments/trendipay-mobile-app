import 'package:flutter/material.dart';

class CustomScrollBehaviour extends StatelessWidget {
  const CustomScrollBehaviour({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overScroll) {
          overScroll.disallowIndicator();
          return true;
        },
        child: child
    );
  }
}
