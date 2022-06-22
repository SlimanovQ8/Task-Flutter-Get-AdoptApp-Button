import 'package:adopt_app/models/pet.dart';
import 'package:adopt_app/pages/SignUp.dart';
import 'package:adopt_app/services/pets_services.dart';
import 'package:adopt_app/services/authServices.dart';
import 'package:flutter/material.dart';

class authProvider extends ChangeNotifier {


  late String token;

  void SignUp(String Username, String Password) async
  {
    AuthServices AS = AuthServices();
   token =  await AS.SignUp(Username, Password);
   print(token);
    notifyListeners();

  }
}
