
import 'package:bdp_payment_app/core/constants/colors.dart';
import 'package:bdp_payment_app/core/utils/app_theme_util.dart';
import 'package:bdp_payment_app/src/shared_widgets/common/zloader.dart';
import 'package:flutter/material.dart';

class AppLoadMore extends StatefulWidget {
  const AppLoadMore({
    super.key,
    this.isFinish = false,
    required this.onLoadMore,
    required this.children,
    this.isLoaderVisible = true,
  });

  final bool isFinish;
  final Future<void> Function() onLoadMore;
  final List<Widget> children;
  final bool isLoaderVisible;

  @override
  State<AppLoadMore> createState() => _AppLoadMoreState();
}

class _AppLoadMoreState extends State<AppLoadMore> {
  void loadMore() async{
    await widget.onLoadMore.call();
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener(
      onNotification: (scrollInfo){
        if (scrollInfo is ScrollEndNotification && scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
          if(!widget.isFinish){
            loadMore();
          }
        }
        return true;
      },
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: widget.children.length+1,
        itemBuilder: (context, index){
          if(index < widget.children.length){
            return widget.children[index];
          }else{
            return widget.isLoaderVisible ?
            Visibility(
              visible: !(widget.isFinish || (widget.children.length+1) == 1),
              child: Container(
                padding: EdgeInsets.only(
                  top: AppThemeUtil.height(8.0),
                  bottom: AppThemeUtil.height(24.0),
                ),
                alignment: Alignment.center,
                child: const ZLoader(loaderColor: BDPColors.primary, size: 20,),
              ),
            )
            :
            const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
