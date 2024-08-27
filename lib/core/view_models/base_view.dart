import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BaseView<T> extends StatelessWidget {
  final Widget Function(BuildContext context, T model, Widget? child) builder;
  final Widget? child;

  const BaseView({
    super.key,
    required this.builder,
    this.child,
  });


  @override
  Widget build(BuildContext context) {
    return Consumer<T>(builder: builder, child: child,);
  }
}
