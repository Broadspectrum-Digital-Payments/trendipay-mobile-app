import 'package:flutter/material.dart';
import '../../../features/mainscreens/screens/wallets/widgets/wallet_user.dart';
import '../../../utils/constants/image_strings.dart';
import '../authHeader/authheaders.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String appBarTitle;

  const CustomAppBar({Key? key, required this.appBarTitle}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight * 1.5); // Adjust the height as needed

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
            const WalletUser(),
            AuthHeader(icon: BDPImages.bdpIcon, title: appBarTitle),
          ],
        ),
      ),
    );
  }
}
