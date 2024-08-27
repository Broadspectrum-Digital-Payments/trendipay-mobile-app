import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BaseView2<A, B> extends StatelessWidget {
  final Widget Function(BuildContext context, A model, B model2, Widget? child) builder;
  final Widget? child;

  const BaseView2({
    super.key,
    required this.builder,
    this.child,
  });


  @override
  Widget build(BuildContext context) {
    return Consumer2<A, B>(builder: builder, child: child,);
  }
}
