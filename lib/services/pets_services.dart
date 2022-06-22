import 'package:dio/dio.dart';

import '../models/pet.dart';

class DioClient {

  final dio = new Dio();

  Future<List<Pet>> getPets() async {
    print("fv");
    try {
      Response Res = await dio.get(
          "https://coded-pets-api-crud.herokuapp.com/pets");

      print(Res);
      print('ed');
      print(Res.data);

      List<Pet> pets = (Res.data as List).map((e) => Pet.fromJson(e)).toList();
      print(pets[0].name);
      return pets;
    }
    on DioError catch (e)
    {
      print(e.message);
    }
    return [];
  }

  void addPet(String name, int age, String gender) async {
    print("fv");
    var formData = FormData.fromMap({

      "id": 1,
      "name": name,
      "adopted": false,
      "image": "https://i.ibb.co/HBRR9sp/cat-kitty-1.png",
      "age": age,
      "gender": gender,

    });
    try {
      Response Res = await dio.post("https://coded-pets-api-crud.herokuapp.com/pets", data: formData );

   /*   print(Res);
      print('ed');
      print(Res.data);
*/

    }
    on DioError catch (e)
    {
      print(e.message);
    }
  }

}