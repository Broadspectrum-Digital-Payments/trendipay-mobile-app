
import 'dart:collection';

import 'package:bdp_payment_app/core/utils/app_dialog_util.dart';
import 'package:bdp_payment_app/core/view_models/base_view_model.dart';
import 'package:flutter/material.dart';

import '../../../../../core/errors/failure.dart';
import '../../../../../core/routing/app_navigator.dart';
import '../../../../../core/routing/app_route.dart';
import '../../../../../core/services/git_it_service_locator.dart';
import '../../../../shared_widgets/modals/error_modal_content.dart';
import '../../data/repositories/loan_repository.dart';


class LoanViewModel extends BaseViewModel{
  final _loanRepository = sl.get<LoanRepository>();
  Map<String, dynamic> _loanRequestBody = {};


  set setLoanRequestBody(Map<String, dynamic> request){
    _loanRequestBody = {..._loanRequestBody, ...request};
  }

  UnmodifiableMapView<String, dynamic> get getLoanRequestBody => UnmodifiableMapView(_loanRequestBody);

  void clearLoanRequestBody(){
    _loanRequestBody.clear();
  }

  Future<void> requestAmortization(BuildContext context, {required Map<String, dynamic> queryParams}) async{
    AppDialogUtil.loadingDialog(context);
    final result = await _loanRepository.requestAmortization(queryParams: queryParams);

    if(context.mounted) AppNavigator.pop(context);

    result.fold((failure){
      WidgetsBinding.instance.addPostFrameCallback((_) async{
        AppDialogUtil.popUpModal(
          context,
          modalContent: ErrorModalContent(
            errorMessage: FailureToMessage.mapFailureToMessage(failure),
          ),
        );
      });
    }, (amortize){
      AppNavigator.pushNamed(context, AppRoute.loanSummaryScreen, arguments: amortize);
    });
  }

  Future<void> applyLoan(BuildContext context, {required Map<String, dynamic> requestBody}) async{
    AppDialogUtil.loadingDialog(context);
    final result = await _loanRepository.applyLoan(requestBody: requestBody);

    if(context.mounted) AppNavigator.pop(context);

    result.fold((failure){
      WidgetsBinding.instance.addPostFrameCallback((_) async{
        AppDialogUtil.popUpModal(
          context,
          modalContent: ErrorModalContent(
            errorMessage: FailureToMessage.mapFailureToMessage(failure),
          ),
        );
      });
    }, (amortize){
      AppNavigator.pushNamed(context, AppRoute.loanSummaryScreen, arguments: amortize);
    });
  }

  Future<void> fetchLoans(BuildContext context, {String loadingComponent = 'loans', required Map<String, dynamic> queryParams}) async{
    setComponentErrorType = null;
    setLoading(true, component: loadingComponent);

    final result = await _loanRepository.fetchLoans(queryParams: queryParams);

    result.fold((left) {
      setComponentErrorType = {
        'error': FailureToMessage.mapFailureToMessage(left),
        'component': loadingComponent
      };
      setLoading(false, component: loadingComponent);
    }, (history){
      setLoading(false, component: loadingComponent, notify: false);
    });
  }


/// LOCAL DB

}