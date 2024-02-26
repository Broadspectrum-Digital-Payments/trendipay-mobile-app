

import 'package:bdp_payment_app/core/constants/common.dart';

import '../../../services/local_storage_service.dart';
import '../../../services/logger_service.dart';
import '../../domain/models/user/user_model.dart';

abstract class UserLocalDataSource{
  Future<UserModel> retrieveUser();
  Future<void> persistUser(UserModel user);
  Future<bool> isLoggedIn();
  Future<bool> retrieveHideCardBalance();
  Future<void> persistHideCardBalance(bool value);
}

class UserLocalDataSourceImpl extends UserLocalDataSource{
  UserLocalDataSourceImpl({required this.localStorageService,});

  final LocalStorageService localStorageService;

  @override
  Future<UserModel> retrieveUser() async{
    final authUserData = await localStorageService.decodeAndReadMap('userModel');
    ZLoggerService.logOnInfo('RETRIEVING USER');
    return UserModel.fromJson(authUserData);
  }

  @override
  Future<void> persistUser(UserModel user) async{
    await localStorageService.encodeAndWrite('userModel', user.toJson());
    ZLoggerService.logOnInfo('PERSISTING USER');
  }

  @override
  Future<bool> isLoggedIn() async => (await localStorageService.getToken()).isNotEmpty;

  @override
  Future<void> persistHideCardBalance(bool value) async{
    await localStorageService.write(kCardHideBalance, value? 'yes': '');
    ZLoggerService.logOnInfo('PERSISTING HIDE CARD BALANCE');
  }

  @override
  Future<bool> retrieveHideCardBalance() async{
    final result = await localStorageService.read(kCardHideBalance);
    ZLoggerService.logOnInfo('RETRIEVING HIDE CARD BALANCE');
    return result == 'yes';
  }
}