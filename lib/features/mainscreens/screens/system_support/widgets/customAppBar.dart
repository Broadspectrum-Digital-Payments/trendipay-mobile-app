import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../common/widgets/authHeader/authheaders.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/text_strings.dart';


class CustomAppBars extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(
      kToolbarHeight * 1.5); // Adjust the height as needed

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: BDPColors.white,
      automaticallyImplyLeading: false,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back, size: 24, color: Colors.black),
                onPressed: () {
                  Get.back();
                },
              ),
              const SizedBox(
                width: 2,
              ),
              AuthHeader(
                  icon: BDPImages.bdpIcon, title: BDPTexts.systemSupport),
            ],
          ),
        ],
      ),
    );
  }
}