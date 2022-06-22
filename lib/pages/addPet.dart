import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../providers/pets_provider.dart';

class addPet extends StatefulWidget {
  const addPet({Key? key}) : super(key: key);

  @override
  _addPetState createState() => _addPetState();
}

final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

String petName = '';
int petAge = 0;
String petGender = '';

class _addPetState extends State<addPet> {
  @override

  Widget TextFo(String hintText, String labelText, void Function(String) OnChanged, IconData icon)
  {
    return  TextFormField(

      decoration:  InputDecoration(
        icon:  Icon(icon),
        hintText: hintText,
        labelText: labelText,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 32.0),

        ),
      ),

      onChanged: (String s) {
        setState(() {
          OnChanged(s);
          print(OnChanged);
        });
      },

    );

  }

  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar (
        title: Text("Add pet"),

      ),
       body: SafeArea (
         child: Form (
           key: _formKey,
           autovalidateMode: AutovalidateMode.always,
           child: ListView(
               padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical:30),

               children: [
                 TextFo("Enter Pet Name", "Pet Name", (value) => setState(() {
                   petName=value;
                 }), Icons.drive_file_rename_outline),

                 SizedBox(height: 20,),
                 TextFo("Enter Pet Age", "Pet Age", (value) => setState(() {
                   petAge=int.parse(value);
                 }), Icons.pets),

                 SizedBox(height: 20,),
                 TextFo("Enter Pet Gender", "Pet Gender", (value) => setState(() {
                   petGender=value;
                 }), Icons.pets),

                 SizedBox(height: 20,),



                 isLoading == true ? Center(child: CircularProgressIndicator()) :
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child:
                    ElevatedButton(
                     onPressed: () {
                       addPet(petName, petAge, petGender);
                     },
                     child: const Padding(
                       padding: EdgeInsets.all(12.0),
                       child: Text("Add Pet"),
                     ),
                   ),
                 ),
  ]
    ),

         ),
       ),
    );
  }
  bool isLoading = false;
  void addPet(String name, int age, String gender) async
  {
    print("j");

    setState(() {
      isLoading = true;

      Provider.of<PetsProvider>(context, listen: false)
          .addPets(name, age, gender);
    });
    setState(() {
      isLoading = false;
      context.pop();

    });
  }
}
