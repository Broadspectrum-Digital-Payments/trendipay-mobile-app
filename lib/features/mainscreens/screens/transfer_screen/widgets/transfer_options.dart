import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../utils/constants/colors.dart';
import '../../saved_beneficiary/saved_beneficiary.dart';


class TransferOption extends StatelessWidget {
  const TransferOption({
    super.key, required this.transferType, required this.transferLogo,
  });
  final String transferType;
  final String transferLogo;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(const SavedBeneficiaryScreen()),
      child: Container(
        width: double.infinity, // Adjust width as needed
        height: 40, // Adjust height as needed
        decoration: BoxDecoration(
            border: Border.all(
              color: BDPColors.primary, // Color of the border
              width: 1, // Width of the border
            ),
            borderRadius: BorderRadius.circular(8)
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 18.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(transferLogo), // Icon
              const SizedBox(width: 8), // Spacer between icon and text
              Text(transferType, textAlign: TextAlign.center, style: const TextStyle(
                  fontSize: 14, fontWeight: FontWeight.w600, color: BDPColors.primary
              ),)
            ],
          ),
        ),
      ),
    );
  }
}