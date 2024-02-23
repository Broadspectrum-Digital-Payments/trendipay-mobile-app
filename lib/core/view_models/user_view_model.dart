// import 'dart:collection';
//
// import 'package:aider_mobile_app/core/routing/app_navigator.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:provider/provider.dart';
//
// import '../../src/shared_widgets/modals/success_modal_content.dart';
// import '../auth/data/repositories/user_repository.dart';
// import '../constants/common.dart';
// import '../errors/failure.dart';
// import '../routing/app_route.dart';
// import '../services/git_it_service_locator.dart';
// import '../services/logger_service.dart';
// import '../services/socket_service.dart';
// import '../utils/app_dialog_util.dart';
// import '../utils/helper_util.dart';
// import '../../src/shared_widgets/modals/error_modal_content.dart';
// import '../auth/domain/models/user/user_model.dart';
// import 'location_view_model.dart';
//
import 'dart:collection';

import 'package:bdp_payment_app/core/extensions/string_extension.dart';
import 'package:bdp_payment_app/core/utils/app_dialog_util.dart';
import 'package:bdp_payment_app/core/view_models/base_view_model.dart';
import 'package:bdp_payment_app/src/shared_widgets/modals/success_modal_content.dart';
import 'package:flutter/material.dart';

import '../../src/shared_widgets/modals/error_modal_content.dart';
import '../auth/domain/models/user/user_model.dart';
import '../auth/data/repositories/user_repository.dart';
import '../errors/failure.dart';
import '../routing/app_navigator.dart';
import '../routing/app_route.dart';
import '../services/git_it_service_locator.dart';
import '../utils/helper_util.dart';
import '../utils/media_file_util.dart';

class UserViewModel extends BaseViewModel{
  final _userRepository = sl.get<UserRepository>();
  Map<String, dynamic> _signupRequestBody = {};

  UserModel _user = const UserModel();

  set setUser(UserModel user){
    _user = user;
    notifyListeners();
    _persistUser();
  }

  get getUser => _user;

  set setSignupRequestBody(Map<String, dynamic> request){
    _signupRequestBody = {..._signupRequestBody, ...request};
  }

  UnmodifiableMapView<String, dynamic> get getSignupRequestBody => UnmodifiableMapView(_signupRequestBody);

  Future<void> authentication(BuildContext context, {String type = 'login', required Map<String, dynamic> requestBody}) async{
    AppDialogUtil.loadingDialog(context);
    final result = type == 'login'?
    await _userRepository.login(requestBody: requestBody)
        :
    await _userRepository.signup(requestBody: requestBody);

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
    }, (user){
      setUser = user;
      AppNavigator.pushNamedAndRemoveUntil(context, AppRoute.homeScreen, (p0) => false);
    });
  }

  Future<void> changePin(BuildContext context, {bool isResend = false, required Map<String, dynamic> requestBody}) async{
    print('CHANGE PIN: ${requestBody}');
    final result = await _userRepository.changePin(requestBody: requestBody);

    if(context.mounted) AppNavigator.pop(context);

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
      AppNavigator.pushReplacementNamed(context, AppRoute.otpVerificationScreen);
    });
  }

  bool _selfieUploaded = false;
  bool get selfieUploaded => _selfieUploaded;

  Future<void> uploadKYCFile(BuildContext context, {required Map<String, dynamic> requestBody}) async{
    AppDialogUtil.loadingDialog(context);

    if(requestBody['selfie'] != null){
      final imagePath = await MediaFileUtil.getMultipartFile(requestBody['selfie']?? '');
      requestBody['selfie'] = imagePath;
    }
    if(requestBody['ghana-card-front'] != null){
      final imagePath = await MediaFileUtil.getMultipartFile(requestBody['ghana-card-front']?? '');
      requestBody['ghana-card-front'] = imagePath;
    }
    if(requestBody['ghana-card-back'] != null){
      final imagePath = await MediaFileUtil.getMultipartFile(requestBody['ghana-card-back']?? '');
      requestBody['ghana-card-back'] = imagePath;
    }

    final result = await _userRepository.uploadKYCFile(requestBody: requestBody);

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
      _selfieUploaded = true;
      notifyListeners();
      final photoType = requestBody['selfie']!= null? 'Selfie': requestBody['ghana-card-front'] != null? 'Ghana Card Front':'Ghana Card Back';
      AppDialogUtil.popUpModal(
        context,
        modalContent: SuccessModalContent(
          title: photoType,
          message: '${photoType.toLowerCase().capitalize()} photo uploaded.',
        ),
      );
    });
  }

  Future<void> fetchUser() async{
    setComponentErrorType = null;
    setLoading(true, component: 'fetchUser');
    final result = await _userRepository.fetchUser();

    result.fold((left) {
      setComponentErrorType = {
        'error': FailureToMessage.mapFailureToMessage(left),
        'component': 'fetchUser'
      };
      setLoading(false, component: 'fetchUser');

    }, (user) {
      setLoading(false, component: 'fetchUser', notify: false);
      setUser = user;
    });
  }

  Future<void> logout(BuildContext context) async{
    HelperUtil.onLogout(context);
  }


  Future<void> _retrieveUser() async{
    final result = await _userRepository.retrieveUser();
    result.fold((l) => null, (user) => _user = user);
  }

  Future<void> _persistUser() async{
    final result = await _userRepository.persistUser(_user);
    result.fold((l) => null, (user) => null);
  }

  Future<bool> isLoggedIn() async => await _userRepository.isLoggedIn();

  initState() async{
    await _retrieveUser();
  }

}