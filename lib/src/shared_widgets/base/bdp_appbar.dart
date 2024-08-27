

import 'package:bdp_payment_app/core/utils/app_theme_util.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/image_strings.dart';
import '../../../core/routing/app_navigator.dart';
import '../common/authheaders.dart';

class BDPAppBar extends StatelessWidget implements PreferredSizeWidget {
  final AppBar appBar;
  final String title;
  final void Function()? onPressed;
  final List<Widget>? actions;
  final bool hasLeading;
  final Color? appBarBackgroundColor;
  final bool showSettings;

  const BDPAppBar({
    super.key,
    required this.appBar,
    required this.title,
    this.onPressed,
    this.actions,
    this.hasLeading = true,
    this.appBarBackgroundColor,
    this.showSettings = false,
  });

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: 0,
      centerTitle: false,
      elevation: 0,
      scrolledUnderElevation: 0,
      automaticallyImplyLeading: false,
      backgroundColor: appBarBackgroundColor,
      title: Padding(
        padding: EdgeInsets.only(left: hasLeading? 0 : AppThemeUtil.width(20.0)),
        child: AuthHeader(icon: BDPImages.bdpIcon, title: title, showSettings: showSettings,),
      ),
      leading: hasLeading ? IconButton(
        icon: Icon(Icons.arrow_back, size: AppThemeUtil.radius(24)),
        onPressed: onPressed?? () => AppNavigator.pop(context),
      ) : null,
      actions: actions ?? [],
    );
  }
}