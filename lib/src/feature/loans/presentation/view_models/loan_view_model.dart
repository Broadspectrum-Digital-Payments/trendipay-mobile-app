
import 'dart:collection';

import 'package:bdp_payment_app/core/utils/app_dialog_util.dart';
import 'package:bdp_payment_app/core/view_models/base_view_model.dart';
import 'package:flutter/material.dart';

import '../../../../../core/errors/failure.dart';
import '../../../../../core/routing/app_navigator.dart';
import '../../../../../core/routing/app_route.dart';
import '../../../../../core/services/git_it_service_locator.dart';
import '../../../../../core/utils/media_file_util.dart';
import '../../../../shared_widgets/modals/error_modal_content.dart';
import '../../../../shared_widgets/modals/success_modal_content.dart';
import '../../data/repositories/loan_repository.dart';
import '../../domain/models/history/loan_history_model.dart';
import '../../domain/models/loan/loan_model.dart';
import '../../domain/models/stats/stats_model.dart';


class LoanViewModel extends BaseViewModel{
  final _loanRepository = sl.get<LoanRepository>();
  Map<String, dynamic> _loanRequestBody = {};
  LoanHistoryModel _loanHistory = const LoanHistoryModel();


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

  Future<void> applyLoan(BuildContext context, {required String userExternalId, required Map<String, dynamic> requestBody}) async{
    AppDialogUtil.loadingDialog(context);
    final result = await _loanRepository.applyLoan(userExternalId: userExternalId, requestBody: requestBody);

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
    }, (loan){
      _loanHistory = _loanHistory.copyWith(
        loans: List.from(_loanHistory.loans?? [])..insert(0, loan),
      );
      AppNavigator.popAndPushNamed(context, AppRoute.loanReviewScreen, arguments: loan);
    });
  }

  UnmodifiableListView<LoanModel> get getLoans => UnmodifiableListView(_loanHistory.loans?? []);
  StatsModel? get getStats => _loanHistory.stats;

  Future<void> fetchLoans(BuildContext context, {String loadingComponent = 'loans', required String userExternalId, required Map<String, dynamic> queryParams}) async{
    setComponentErrorType = null;
    setLoading(true, component: loadingComponent);

    final result = await _loanRepository.fetchLoans(userExternalId: userExternalId, queryParams: queryParams);

    result.fold((left) {
      setComponentErrorType = {
        'error': FailureToMessage.mapFailureToMessage(left),
        'component': loadingComponent
      };
      setLoading(false, component: loadingComponent);
    }, (history){
      _loanHistory = history;
      setLoading(false, component: loadingComponent);
      if(history.meta?.currentPage == 1) _persistLoans();
    });
  }


  Future<void> uploadLoanDocument(BuildContext context, {required String loanExternalId, required Map<String, dynamic> requestBody}) async{
    AppDialogUtil.loadingDialog(context);

    if(requestBody['file'] != null){
      final imagePath = await MediaFileUtil.getMultipartFile(requestBody['file']?? '');
      requestBody['file'] = imagePath;
    }

    final result = await _loanRepository.uploadLoanDocument(loanExternalId: loanExternalId, requestBody: requestBody);

    if(context.mounted) {AppNavigator.pop(context);}

    result.fold((left) {
      WidgetsBinding.instance.addPostFrameCallback((_) async{
        AppDialogUtil.popUpModal(
          context,
          modalContent: ErrorModalContent(
            errorMessage: FailureToMessage.mapFailureToMessage(left),
          ),
        );
      });

    }, (right) {
      /// ATTACH IT TO THE LOAN
      AppDialogUtil.popUpModal(
        context,
        modalContent: SuccessModalContent(
          title: 'Loan Document',
          message: 'Your loan document is uploaded.',
          onButtonPressed: (){
            AppNavigator.pushNamedAndRemoveUntil(context, AppRoute.homeScreen, (p0) => false);
          },
        ),
      );
    });
  }



/// LOCAL DB
  Future<void> _retrieveLoans() async{
    final result = await _loanRepository.retrieveLoans();
    result.fold((l) => null, (history) => _loanHistory = history );
  }

  Future<void> _persistLoans() async{
    final result = await _loanRepository.persistLoans(_loanHistory);
    result.fold((l) => null, (r) => null);
  }

  initState() async{
    await _retrieveLoans();
  }

}