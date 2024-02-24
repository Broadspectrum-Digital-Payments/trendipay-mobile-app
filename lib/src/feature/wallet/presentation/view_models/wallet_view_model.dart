
import 'package:bdp_payment_app/core/utils/app_dialog_util.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constants/common.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/services/git_it_service_locator.dart';
import '../../../../../core/utils/helper_util.dart';
import '../../../../../core/view_models/base_view_model.dart';
import '../../../../shared_widgets/modals/error_modal_content.dart';
import '../../data/repositories/wallet_repository.dart';

class WalletViewModel extends BaseViewModel{
  final _walletRepository = sl.get<WalletRepository>();

  Future<void> topUpWallet(BuildContext context, {required Map<String, dynamic> requestBody}) async{
    AppDialogUtil.loadingDialog(context);

    final result = await _walletRepository.topUpWallet(requestBody: requestBody);

    result.fold((left) {
      if(FailureToMessage.mapFailureToMessage(left) == kAuthentication){
        HelperUtil.onLogout(context);
        return;
      }
      WidgetsBinding.instance.addPostFrameCallback((_) async{
        AppDialogUtil.popUpModal(
          context,
          modalContent: ErrorModalContent(
            errorMessage: FailureToMessage.mapFailureToMessage(left),
          ),
        );
      });
    }, (right) async{

    });
  }


}