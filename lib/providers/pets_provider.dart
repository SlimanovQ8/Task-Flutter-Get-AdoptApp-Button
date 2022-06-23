import 'package:adopt_app/models/pet.dart';
import 'package:adopt_app/services/pets_services.dart';
import 'package:flutter/material.dart';

class PetsProvider extends ChangeNotifier {
  List<Pet> pets = [];

  Future<void> getsPets() async
  {
    DioClient DC = DioClient();
    pets = await DC.getPets() ;
    notifyListeners();
  }

  void addPets(String name, int age, String gender) async
  {
    DioClient DC = DioClient();
     DC.addPet(name, age, gender) ;
     pets = await DC.getPets();
    notifyListeners();

  }
}
