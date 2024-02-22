
import 'package:flutter/material.dart';

class BaseViewModel extends ChangeNotifier {
  bool _isLoading = false;
  String _component = '';
  Object? errorType;
  Map<String, dynamic>? componentErrorType;

  bool get isLoading => _isLoading;
  bool getComponentLoading(String component) => _isLoading && _component == component;

  void setLoading(bool value, {String component = '', bool notify = true,}) {
    _isLoading = value;
    _component = component;
    if(notify) notifyListeners();
  }

  set setError(Object? error) {
    errorType = error;
  }

  bool isComponentErrorType(String component) => componentErrorType!=null && componentErrorType?['component'] == component;

  set setComponentErrorType(Map<String, dynamic>? error) {
    componentErrorType = error;
  }




}
