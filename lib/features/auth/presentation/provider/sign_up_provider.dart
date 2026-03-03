import 'package:cartivo_mart/app/network_caller_set_up.dart';
import 'package:cartivo_mart/core/models/network_response_model.dart';
import 'package:flutter/cupertino.dart';

import '../../../../app/urls.dart';
import '../../data/models/sign_up_params.dart';

class SignUpProvider extends ChangeNotifier {
  bool _signUpInProgress = false;

  bool get signUpInProgress => _signUpInProgress;

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  Future<bool> signUp(SignUpParams params) async {
    bool isSuccess = false;
    _signUpInProgress = true;
    notifyListeners();
    final NetworkResponse response = await getNetworkCaller().postRequest(
      Urls.signUpUrl,
      body: params.toJson(),
    );
    if (response.isSuccess) {
      _errorMessage = null;
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    _signUpInProgress = false;
    notifyListeners();
    return isSuccess;
  }
}
