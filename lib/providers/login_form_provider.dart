

import 'package:flutter/material.dart';

class LoginFormProvider extends ChangeNotifier{

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String name = '';
  String password = '';

  bool _isLoading = false;

  get isLoading => _isLoading;

  set isLoading(isLoading){
    _isLoading = isLoading;
    notifyListeners();
  }


  bool isValidate(){
    return formKey.currentState?.validate() ?? false;
  }


}