import 'package:adopt_app/providers/authProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../providers/pets_provider.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

String Username = '';
String Password = '';

class _SignUpState extends State<SignUp> {
  @override

  Widget TextFo(String hintText, String labelText, bool isEncrypt, void Function(String) OnChanged, IconData icon)
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


      obscureText: isEncrypt,
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
        title: Text("Sign Up"),

      ),
      body: SafeArea (
        child: Form (
          key: _formKey,
          autovalidateMode: AutovalidateMode.always,
          child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical:30),

              children: [
                TextFo("Enter username", "UserName", false, (value) => setState(() {
                  Username=value;
                }), Icons.person),

                SizedBox(height: 20,),
                TextFo("Enter Password", "Password", true ,  (value) => setState(() {
                  Password=value;
                }), Icons.password),


                SizedBox(height: 20,),



                isLoading == true ? Center(child: CircularProgressIndicator()) :
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:
                  ElevatedButton(
                    onPressed: () {
                      SignUp(Username, Password);
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Text("Sign Up"),
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
  void SignUp(String name, String password) async
  {
    print("j");

    setState(() {
      isLoading = true;

      Provider.of<authProvider>(context, listen: false)
          .SignUp(Username, Password);
    });
    setState(() {
      isLoading = false;
      context.pop();

    });
  }
}
