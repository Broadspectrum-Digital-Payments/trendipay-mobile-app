import 'package:bdp_payment_app/features/mainscreens/screens/transfer_screen/transaction_blos/transfer_blocs.dart';
import 'package:bdp_payment_app/features/mainscreens/screens/transfer_screen/transaction_blos/transfer_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common/constants/general_repository.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';


class TransferAmoutContainer extends StatelessWidget {
  const TransferAmoutContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransferBloc, TransferStates>(
      builder: (context, state) {
        return Container(
          width: double.infinity,
          height: 140,
          decoration:  BoxDecoration(
            color: BDPColors.primary,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(24.r),
              bottomRight: Radius.circular(24.r),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Enter Amount',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20.sp,
                    color: BDPColors.white),
              ),
              const SizedBox(
                height: BDPSizes.spaceBtwItems,
              ),
              Text(
                GeneralRepository.formatNumber(value: num.tryParse(state.amount!)),
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20.sp,
                    color: BDPColors.white),
              ),
            ],
          ),
        );
      }
    );
  }
}