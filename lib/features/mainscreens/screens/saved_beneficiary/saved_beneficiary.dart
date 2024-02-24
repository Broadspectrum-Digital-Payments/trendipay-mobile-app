import 'package:bdp_payment_app/core/constants/colors.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/sizes.dart';
import '../../../../src/feature/history/presentation/screens/transfer_info_screen.dart';

class SavedBeneficiaryScreen extends StatelessWidget {
  const SavedBeneficiaryScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, size: 24),
          onPressed: () {
            // Get.back();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(BDPSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            SizedBox(
              width: 377,
              height: 60,
              child: TextField(
                style: const TextStyle(
                  color: BDPColors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                ),
                decoration: InputDecoration(
                  hintText: 'Search for a Beneficiary',
                  hintStyle: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: BDPColors.white,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  filled: true,
                  fillColor: BDPColors.primary,
                  prefixIcon: const Icon(Icons.search, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: BDPSizes.spaceBtwSections),
            const Text(
              'Saved Beneficiary',
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: BDPColors.primary
              ),
            ),
            const SizedBox(height: BDPSizes.spaceBtwInputFields),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildBeneficiaryContainer('Keren Gyamfi', '123456789'),
                  _buildDivider(),
                  _buildBeneficiaryContainer('Keren Gyamfi', '123456789'),
                  _buildDivider(),
                  _buildBeneficiaryContainer('Keren Gyamfi', '123456789'),
                  _buildDivider(),
                  _buildBeneficiaryContainer('Keren Gyamfi', '123456789'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBeneficiaryContainer(String name, String number) {
    return GestureDetector(
      // onTap: () => Get.to(const TransferInfoScreen()),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: BDPColors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: BDPColors.grey),
            ),
            const SizedBox(height: 6),
            Text(number,  style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w400, color: BDPColors.grey),),
          ],
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Divider(
      color: Colors.grey[300],
      thickness: 1,
      height: 0,
    );
  }
}


