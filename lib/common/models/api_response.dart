

import 'package:bdp_payment_app/common/constants/general_repository.dart';
import 'package:bdp_payment_app/common/constants/global_constants.dart';
import 'package:bdp_payment_app/features/authentication/screens/login/login.dart';
import 'package:get/get.dart';

class ApiResponse {
  int? code;
  String? message;
  bool? status;
  dynamic body;
  List? errors;

  ApiResponse({this.status, this.code, this.message, this.body, this.errors});

  List get payload => body["payload"];

  List get listWithoutPayloadfKey => body;

  String get getMessage => body['messages'];

  Map? get mappedData => body["payload"];

  Map get mappedObjects => body;

  bool? get allGood => body['status'] == true;
  bool? get failedStatus => body['status'] == false;

  bool? get sessionExpired => body['sessionExpired'] = true;

  bool? get noBody => errors?.isEmpty;

  factory ApiResponse.parse(response) {
    if (response != null) {
      //TODO: dont forget to change when real api starts
      int? code = response.statusCode;
      dynamic body = response.data ?? null;
      List? errors = [];
      String? message = "";
      String? status = "";
      switch (code) {
        case 200:
          if (body is String) {
            message = body;
          } else if (body is List) {
            message = "Success";
          } else if (body.containsKey("payload")) {
            if (body["payload"] is Map) {
              if (body.containsKey('messages')) {
                List <dynamic> messages = body['messages'];
                message = messages[0]['longMessage'];
              }
              if (body.containsKey('errors')) {
                List <dynamic> messages = body['errors'];
                message = messages[0]['longMessage'];
              }
            }
          } else {
            if (body is Map) {
              if(body.containsKey('messages')) {
                List <dynamic> messages = body['messages'];
                message = messages[0]['longMessage'];
              }else {
                message = "Success";
              }

            }
          }

          break;
        case 201:
          if (body is String) {
            message = body;
          } else {
            if (body.containsKey("data")) {
              if (body["data"] is Map) {
                List <dynamic> messages = body['messages'];
                message = messages[0]['longMessage'];
              }
            }
          }
          break;
        case 204:
          message = "Operation successful";
          break;
        case 401:
          if (body["errors"] != null) errors.add(body["errors"]);
          if (body["errors"] == null) {
            List<dynamic> messages = body['messages'];
            errors.add(messages[0]['longMessage']);
          }
          message = errors[0];
          break;
        // case 403:
        //   if (body["data"] == null) {
        //     errors.add(body["message"]);
        //     message = errors[0];
        //     //Log the user out
        //     final router = locator<RouterService>();
        //     locator<LoginService>().isAuthenticated().then((value) {
        //       if (value) {
        //         locator<DialogService>().showAlertDialog(
        //             context: router.navigatorKey.currentState!.context,
        //             message: "Session has expired",
        //             type: AlertDialogType.error);
        //         //Workmanager().cancelAll().then((value) => );
        //         locator<LoginService>().logout();
        //
        //       }
        //     });
        //   } else {
        //     errors.add(body["data"]["message"]);
        //     message = errors[0];
        //     //Log the user out
        //     final router = locator<RouterService>();
        //     locator<LoginService>().isAuthenticated().then((value) {
        //       if (value) {
        //         locator<DialogService>().showAlertDialog(
        //             context: router.navigatorKey.currentState!.context,
        //             message: "Session has expired",
        //             type: AlertDialogType.error);
        //         locator<LoginService>().logout();
        //
        //       }
        //     });
        //   }
        //   break;
        case 400:
          if (body["errors"] != null) {
            List<dynamic> bodyErrors = body['errors'];
            message = bodyErrors[0]['longMessage'];
          }
          errors.add(message);
          if (body is Map){
            if (body.containsKey("sessionExpired")) {
              if (body['sessionExpired'] == true) {
                GlobalConstants.storageService.removeKey(GeneralRepository.sessionKey);
                Get.offAll(()=> const LoginScreen());
                GeneralRepository.showSnackBar("Error", "Session Expired");
              }
            }
          }
          break;
        case 404:
          if (body["message"] != null) {
            List<dynamic> bodyMessage = body['messages'];
            message = bodyMessage[0]['longMessage'];
          } else {
            message = "Not found";
          }
          errors.add(message);
          if (body is Map){
            if (body.containsKey("sessionExpired")) {
              if (body['sessionExpired'] == true) {
                GlobalConstants.storageService.removeKey(GeneralRepository.sessionKey);
                Get.offAll(()=> const LoginScreen());
                GeneralRepository.showSnackBar("Error", "Session Expired");
              }
            }
          }
          break;
        // case 422:
        //   body["errors"].forEach((final String key, final value) {
        //     for (int i = 0; i < body["errors"][key].length; i++) {
        //       errors.add(body["errors"][key][i]);
        //     }
        //   });
        //   message = errors[0];
        //   break;
        case 500:
          message = "Something went wrong, please contact support.";
          errors.add(message);
          break;
        default:
          message = "Unknown application error.";
          errors.add(message);
          break;
      }
      return ApiResponse(
        code: code,
        message: message,
        body: code == 204
            ? null
            : body is String
            ? null
            : body,
        errors: errors,
      );
    } else {
      return ApiResponse(
          code: 500, message: "Something went wrong. Please try again");
    }
  }
}