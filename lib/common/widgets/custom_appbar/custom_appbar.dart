import 'package:flutter/material.dart';
import '../../../src/feature/wallet/presentation/widgets/wallet_user.dart';
import '../../../core/constants/image_strings.dart';
import '../../../src/shared_widgets/common/authheaders.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String appBarTitle;

  const CustomAppBar({super.key, required this.appBarTitle});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight * 1.5);
}

class _CustomAppBarState extends State<CustomAppBar> {
  Size get preferredSize => const Size.fromHeight(kToolbarHeight * 1.5);
 // Adjust the height as needed
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      flexibleSpace: Padding(
        padding: const EdgeInsets.only(left: 28.0, right: 18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // WalletUser(controller: controller,),
            AuthHeader(icon: BDPImages.bdpIcon, title: widget.appBarTitle),
          ],
        ),
      ),
    );
  }
}
