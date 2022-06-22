import 'package:adopt_app/models/User.dart';
import 'package:adopt_app/pages/SignUp.dart';
import 'package:dio/dio.dart';

import '../models/pet.dart';

class AuthServices {

  final dio = new Dio();



  Future <String> SignUp(String Username, String Password ) async {
    String token = '';

    User U = User(UserName: Username, password: Password);
    try {
      Response Res = await dio.post("https://coded-pets-api-auth.herokuapp.com/signup", data: U.toJson()  );

      /*   print(Res);
      print('ed');
      print(Res.data);
*/
      token = Res.data["token"];
      print (token);

    }
    on DioError catch (e)
    {
      print(e.message);
    }
    return token;
  }

}