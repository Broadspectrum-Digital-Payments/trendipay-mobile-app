import 'package:bdp_payment_app/common/widgets/button/button.dart';
import 'package:bdp_payment_app/features/mainscreens/screens/bank_transfer/widgets/bank_transfer_info.dart';
import 'package:bdp_payment_app/features/mainscreens/screens/bank_transfer/widgets/bank_transfer_steps.dart';
import 'package:bdp_payment_app/features/mainscreens/screens/bank_transfer/widgets/textfield.dart';
import 'package:flutter/material.dart';
import '../../../../src/shared_widgets/common/authheaders.dart';
import '../../../../src/feature/home/presentation/screens/navigation_menu.dart';
import '../../../../core/constants/image_strings.dart';
import '../../../../core/constants/sizes.dart';
import '../../../../core/constants/text_strings.dart';

class BankTransferScreen extends StatelessWidget {
  const BankTransferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            AuthHeader(icon: BDPImages.bdpIcon, title: BDPTexts.bankTransfer),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, size: 24),
          onPressed: () {

          },
        ),
      ),
      body:  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(BDPSizes.defaultSpace),
          child: Column(
            children: [
              const Text(BDPTexts.bankTransferStep, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black),),
              const SizedBox(height: BDPSizes.spaceBtwInputFields,),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  children: [
                    const BankTransferSteps(step: BDPTexts.step1,),
                    const SizedBox(height: BDPSizes.spaceBtwInputFields,),
                    const BankTransferSteps(step: BDPTexts.step2,),
                    const SizedBox(height: BDPSizes.spaceBtwInputFields,),
                    const BankTransferTextfield(number: BDPTexts.beneficiaryNumber,),
                    const SizedBox(height: BDPSizes.spaceBtwInputFields,),
                    const BankTransferSteps(step: BDPTexts.step3,),
                    const SizedBox(height: BDPSizes.spaceBtwInputFields,),
                    const BankTransferSteps(step: BDPTexts.step4,),
                    const SizedBox(height: BDPSizes.spaceBtwInputFields,),
                    const BankTransferSteps(step: BDPTexts.step5,),
                    const SizedBox(height: BDPSizes.spaceBtwInputFields,),
                    const BankTransferTextfield(number: BDPTexts.referenceNumber,),
                    const SizedBox(height: BDPSizes.spaceBtwInputFields,),
                    const BankTransferSteps(step: BDPTexts.step6,),
                    const SizedBox(height: BDPSizes.spaceBtwSections,),
                    const BankTransferInfo(),
                    const SizedBox(
                      height: BDPSizes.spaceBtwItems,
                    ),
                    SizedBox(width: 132, height:50,child: Buttons(buttonName: BDPTexts.proceed, image: BDPImages.rightArrow, onPressed: (){}))
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}




