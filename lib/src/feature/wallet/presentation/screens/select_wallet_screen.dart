import 'package:bdp_payment_app/core/constants/styles.dart';
import 'package:bdp_payment_app/core/extensions/gesture_extension.dart';
import 'package:bdp_payment_app/core/routing/app_navigator.dart';
import 'package:bdp_payment_app/core/utils/app_dialog_util.dart';
import 'package:bdp_payment_app/core/utils/app_theme_util.dart';
import 'package:bdp_payment_app/src/shared_widgets/buttons/bdp_primary_button.dart';
import 'package:bdp_payment_app/src/shared_widgets/common/nav_bar_wrapper.dart';
import 'package:bdp_payment_app/src/shared_widgets/common/v_space.dart';
import 'package:flutter/material.dart';
import '../../../../../core/routing/app_route.dart';
import '../../../../shared_widgets/base/bdp_appbar.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/image_strings.dart';
import '../../../../../core/constants/sizes.dart';
import '../../../../../core/constants/text_strings.dart';
import '../widgets/add_wallet_modal_content.dart';

class SelectWalletScreen extends StatefulWidget {
  const SelectWalletScreen({super.key});

  @override
  State<SelectWalletScreen> createState() => _SelectWalletScreenState();
}

class _SelectWalletScreenState extends State<SelectWalletScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BDPAppBar(
        appBar: AppBar(),
        title: BDPTexts.selectWallet,
        actions: [
          Container(
            height: AppThemeUtil.height(40),
            width: AppThemeUtil.width(50),
            margin: EdgeInsets.only(right: AppThemeUtil.width(20)),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppThemeUtil.radius(20)),
                color: BDPColors.primary
            ),
            child: Icon(
              Icons.add, color:
            BDPColors.white,
              size: AppThemeUtil.radius(16.0),
            ),
          ).onPressed((){
            AppDialogUtil.showScrollableBottomSheet(
              context: context,
              builder: (context) => const AddWalletModalContent(),
            );
          })
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(BDPSizes.defaultSpace),
          child: Column(
            children: [
              Align(
                alignment: Alignment.center,
                child: Image.asset(
                  BDPImages.addWallet,
                  fit: BoxFit.cover,
                ),
              ),
              const VSpace(height: BDPSizes.spaceBtwItems),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: AppThemeUtil.width(20)),
                child: Text(
                  textAlign: TextAlign.center,
                  BDPTexts.selectWalletTitle,
                  style: kMediumFontStyle.copyWith(
                    fontSize: AppThemeUtil.fontSize(14),
                    color: BDPColors.grey,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: NavBarWrapper(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BDPPrimaryButton(
              buttonText: 'Continue',
              onPressed: (){
                AppNavigator.pushNamed(context, AppRoute.topUpWalletScreen);
              },
            ),
            // BDPPrimaryButton(
            //   buttonText: 'Add a wallet',
            //   imageIconFile: BDPImages.add,
            //   onPressed: (){
            //     AppDialogUtil.showScrollableBottomSheet(
            //       context: context,
            //       builder: (context) => const AddWalletModalContent(),
            //     );
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}




class ShowWalletList extends StatelessWidget {
  const ShowWalletList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 0,
      itemBuilder: (context, index) {
        return Container(color: Colors.red, width: double.infinity, height: 40,);
        // return GestureDetector(
        //   onTap: (){
        //     context.read<WalletBloc>().add(GetCurrentWalletEvent(model: item));
        //     Get.to(()=> TopUpWalletDetailsScreen());
        //   },
        //   child: Padding(
        //     padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
        //     child: Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //       children: [
        //         Column(
        //           crossAxisAlignment: CrossAxisAlignment.start,
        //           children: [
        //             Text(
        //               item.walletName ?? "",
        //               style: TextStyle(
        //                 fontSize: 12.sp,
        //                 fontWeight: FontWeight.w500,
        //                 color: Colors.grey,
        //               ),
        //             ),
        //             const SizedBox(
        //               height: BDPSizes.spaceBtwSections * 0.2,
        //             ),
        //             Text(
        //               item.walletNetwork ?? "",
        //               style: TextStyle(
        //                 fontSize: 10.sp,
        //                 fontWeight: FontWeight.w400,
        //                 color: Colors.grey,
        //               ),
        //             ),
        //             const SizedBox(
        //               height: BDPSizes.spaceBtwSections * 0.2,
        //             ),
        //             Text(
        //               item.phoneNumber ?? "",
        //               style: TextStyle(
        //                 fontSize: 10.sp,
        //                 fontWeight: FontWeight.w400,
        //                 color: Colors.grey,
        //               ),
        //             ),
        //           ],
        //         ),
        //       ],
        //     ),
        //   ),
        // );
      }, separatorBuilder: (BuildContext context, int index) {
      return const Divider(
        color: Colors.grey,
        indent: 16,
        endIndent: 16,
      );
    },
    );
  }
}







