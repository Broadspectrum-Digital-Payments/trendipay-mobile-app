import 'package:bdp_payment_app/common/widgets/success_screen/success_screen.dart';
import 'package:bdp_payment_app/navigation_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../../common/styles/spacing_styles.dart';
import '../../../../common/widgets/authHeader/authheaders.dart';
import '../../../../common/widgets/button/button.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';

class TransactionVerifyOTP extends StatelessWidget {
  const TransactionVerifyOTP({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0, // Removes the shadow
        automaticallyImplyLeading: false,
        title: AuthHeader(
          icon: BDPImages.bdpIcon,
          title: BDPTexts.transactionOTP,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: BDPSpacingStyle.paddingWithAppBarHeight,
          child: Padding(
            padding: const EdgeInsets.only(top: 48.0),
            child: Column(
              children: [
                const SizedBox(
                  height: BDPSizes.spaceBtwSections,
                ),
                /// FORM
                Center(
                  child: SizedBox(
                    height: 80,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(
                          4,
                          (index) => SizedBox(
                            width: 56,
                            child: TextField(
                              style: TextStyle(color: BDPColors.primary),
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType
                                  .number, // Set input type to only numbers
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ], // Restrict input to only digits
                              decoration: const InputDecoration(
                                hintText: "",
                                counterText:
                                    '', // Set counterText to empty string to remove the counter
                              ),
                              onChanged: (value) {
                                if (value.length == 1) {
                                  // Focus on the next TextField if a character is entered
                                  FocusScope.of(context).nextFocus();
                                }
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: BDPSizes.spaceBtwSections,
                ),
                SizedBox(
                  width: 149,
                  height: 50,
                  child: Buttons(
                    buttonName: BDPTexts.verifyOtp,
                    image: BDPImages.rightArrow,
                    onPressed: () {
                      Get.to(
                        SuccessScreen(
                          image: BDPImages.transactionSuccess,
                          title: BDPTexts.transactionSuccessful,
                          onPressed: () { Get.to(const NavigationMenu());}, buttonName: BDPTexts.backHome, imageButton: BDPImages.rightArrow,

                        ),
                      );
                    },
                  ),
                ),

                const SizedBox(
                  height: BDPSizes.spaceBtwItems,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      BDPTexts.noOtp,
                      style: TextStyle(
                        color: Color(0xff332f2e),
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: const Text(
                        "10s Resend OTP",
                        style: TextStyle(
                          color: BDPColors.primary,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
