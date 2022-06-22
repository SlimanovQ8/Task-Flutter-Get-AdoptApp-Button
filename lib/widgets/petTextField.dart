import 'package:flutter/material.dart';
class TextField extends StatefulWidget {
  const TextField({Key? key}) : super(key: key);

  @override
  _TextFieldState createState() => _TextFieldState();
}

class _TextFieldState extends State<TextField> {
  @override
  Widget TextFormf(String hintText, String labelText, String onChanged, IconData icon)
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
          onChanged = s;
          print(onChanged);
        });
      },

    );

  }
  Widget build(BuildContext context) {
    return Container();
  }
}
