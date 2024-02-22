import 'package:bdp_payment_app/features/mainscreens/screens/transfer_details/transfer_details.dart';
import 'package:bdp_payment_app/features/mainscreens/screens/transfer_screen/transaction_blos/transfer_events.dart';
import 'package:bdp_payment_app/features/mainscreens/screens/transfer_screen/transaction_blos/transfer_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../../../../../core/constants/colors.dart';
import '../../saved_beneficiary/saved_beneficiary.dart';
import '../transaction_blos/transfer_blocs.dart';


class TransferOption extends StatelessWidget {
  const TransferOption({
    super.key, required this.transferType, required this.transferLogo,
  });
  final String transferType;
  final String transferLogo;
  @override
  Widget build(BuildContext context) {
    final transferBloc  = context.read<TransferBloc>();
    return GestureDetector(
      onTap: () {
        transferBloc.add(TransferIdEvent(id: "30"));
        Get.to(()=> const TransferDetailsScreen());
      },
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