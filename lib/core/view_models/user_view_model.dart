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
    setIsSubmitted(true);
    final result = type == 'login'?
    await _userRepository.login(requestBody: requestBody)
        :
    await _userRepository.signup(requestBody: requestBody);

    result.fold((failure){
      setIsSubmitted(false);
      WidgetsBinding.instance.addPostFrameCallback((_) async{
        AppDialogUtil.popUpModal(
          context,
          modalContent: ErrorModalContent(
            errorMessage: FailureToMessage.mapFailureToMessage(failure),
          ),
        );
      });
    }, (user){
      setIsSubmitted(false, false);
      setUser = user;
      AppNavigator.pushNamedAndRemoveUntil(context, AppRoute.homeScreen, (p0) => false);
    });
  }

  Future<void> changePin(BuildContext context, {bool isResend = false, required Map<String, dynamic> requestBody}) async{
   setIsSubmitted(true);
    final result = await _userRepository.changePin(requestBody: requestBody);

    result.fold((left) {
      setIsSubmitted(false);
      WidgetsBinding.instance.addPostFrameCallback((_) async{
        AppDialogUtil.popUpModal(
          context,
          modalContent: ErrorModalContent(
            errorMessage: FailureToMessage.mapFailureToMessage(left),
          ),
        );
      });

    }, (right) {
      setIsSubmitted(false);
      AppNavigator.pushReplacementNamed(context, AppRoute.otpVerificationScreen);
    });
  }

  Future<void> uploadSelfie(BuildContext context, {required Map<String, dynamic> requestBody}) async{
    AppDialogUtil.loadingDialog(context);

    final imagePath = await MediaFileUtil.getMultipartFile(requestBody['selfie']?? '');
    requestBody['selfie'] = imagePath;
    final result = await _userRepository.uploadSelfie(requestBody: requestBody);

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
      AppDialogUtil.popUpModal(
        context,
        modalContent: const SuccessModalContent(
          title: 'Selfie',
          message: 'Selfie photo uploaded.',
        ),
      );
    });
  }


//   Future<void> forgotPassword(BuildContext context, {bool isResend = false, required Map<String, dynamic> requestBody}) async{
//     if(!isResend) AppDialogUtil.loadingDialog(context);
//
//     final result = await _userRepository.forgotPassword(requestBody: requestBody);
//
//     if(context.mounted && !isResend) {AppNavigator.pop(context);}
//
//     result.fold((left) {
//       WidgetsBinding.instance.addPostFrameCallback((_) async{
//         AppDialogUtil.popUpModal(
//           context,
//           modalContent: ErrorModalContent(
//             errorMessage: FailureToMessage.mapFailureToMessage(left),
//           ),
//         );
//       });
//
//     }, (right) {
//       // setResendOtpCode = right;
//       if(isResend) return;
//       // AppNavigatorUtil.pushNamed(context, AppRoute.verifyForgotPasswordOtp, arguments: right);
//     });
//   }
//
//   Future<void> resetPassword(BuildContext context, {bool inApp = false, required Map<String, dynamic> requestBody}) async{
//     AppDialogUtil.loadingDialog(context);
//
//     final result = await _userRepository.resetPassword(requestBody: requestBody);
//
//     if(context.mounted) {AppNavigator.pop(context);}
//
//     result.fold((left) {
//       WidgetsBinding.instance.addPostFrameCallback((_) async{
//         AppDialogUtil.popUpModal(
//           context,
//           modalContent: ErrorModalContent(
//             errorMessage: FailureToMessage.mapFailureToMessage(left),
//           ),
//         );
//       });
//
//     }, (right) {
//       if(right){
//         AppDialogUtil.popUpModal(
//           context,
//           modalContent: SuccessModalContent(
//             title: 'Reset Password',
//             message: inApp? 'Your password is reset':'Your password is reset. You can login now',
//             onButtonPressed: (){
//               if(inApp){
//                 AppNavigator.pop(context);
//                 AppNavigator.pop(context);
//                 return;
//               }
//               AppNavigator.pushNamedAndRemoveUntil(context, AppRoute.onboardingScreen, (p0) => false);
//             },
//           ),
//         );
//       }
//     });
//   }
//
//   Future<void> deleteAccount(BuildContext context, {required Map<String, dynamic> requestBody}) async{
//     AppDialogUtil.loadingDialog(context);
//
//     final result = await _userRepository.deleteAccount(requestBody: requestBody);
//
//     if(context.mounted) {AppNavigator.pop(context);}
//
//     result.fold((left) {
//       if(FailureToMessage.mapFailureToMessage(left) == kAuthentication){
//         HelperUtil.logOut(context);
//         return;
//       }
//
//       WidgetsBinding.instance.addPostFrameCallback((_) async{
//         AppDialogUtil.popUpModal(
//           context,
//           modalContent: ErrorModalContent(
//             errorMessage: FailureToMessage.mapFailureToMessage(left),
//           ),
//         );
//       });
//
//     }, (right) {
//       AppDialogUtil.popUpModal(
//         context,
//         modalContent: SuccessModalContent(
//           title: 'Account deleted',
//           message: '',
//           onButtonPressed: (){
//             HelperUtil.logOut(context);
//           },
//         ),
//       );
//     });
//   }
//
//   Future<void> updateUser(BuildContext context, { required Map<String, dynamic> requestBody}) async{
//     AppDialogUtil.loadingDialog(context);
//
//     if(context.mounted && (requestBody['placeId'] != null && requestBody['placeId'].toString().isNotEmpty)){
//       final locationDetails = await context.read<LocationViewModel>().fetchLocationDetails(requestBody['placeId']);
//       final locality = HelperUtil.getLocalityFromAddressComponents(locationDetails?.addressComponents?? []);
//       final address = {
//         "latitude": locationDetails?.geometry?['location']['lat']?? 0,
//         "longitude": locationDetails?.geometry?['location']['lng']?? 0,
//         "country": "Nigeria",
//         "countryCode": 'NG',
//         "originName": requestBody['originName'],
//         "city": locality.first.isEmpty ? requestBody['originName'] : locality.first
//       };
//       requestBody["address"] = address;
//     }
//
//     final result = await _userRepository.updateUser(requestBody: requestBody);
//
//     if(context.mounted) AppNavigator.pop(context);
//
//     result.fold((left) {
//       WidgetsBinding.instance.addPostFrameCallback((_) async{
//         AppDialogUtil.popUpModal(
//           context,
//           modalContent: ErrorModalContent(
//             errorMessage: FailureToMessage.mapFailureToMessage(left),
//           ),
//         );
//       });
//
//     }, (right) {
//       AppDialogUtil.popUpModal(
//         context,
//         modalContent: const SuccessModalContent(
//           title: 'Updated',
//           message: 'User profile updated',
//         ),
//       );
//       _user = right;
//       notifyListeners();
//       _persistUser();
//     });
//   }

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