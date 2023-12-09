import 'package:flutter/material.dart';

class Textbox extends StatelessWidget
{
  TextEditingController? Controller;
  TextInputType KeyboardType;
  var Label;
  bool ispassword;

  Textbox({required this.Controller,required this.KeyboardType,required this.Label,required this.ispassword});
  @override
  Widget build(BuildContext context)
  {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.all(15.0),
      child: TextField(
        controller: Controller,
        keyboardType:KeyboardType,
        decoration: InputDecoration(
            label : Text(Label,style: TextStyle(
                color:Colors.grey
            ),),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: BorderSide(
                  color: Colors.red,
                )
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: BorderSide(
                    color: Colors.grey
                )
            )
        ),
      ),
    );
  }
}
