
import 'package:internet_connection_checker/internet_connection_checker.dart';

class NetworkConnectionService{
  static Future<bool> get isConnected => InternetConnectionChecker().hasConnection;
}