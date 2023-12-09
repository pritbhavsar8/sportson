import 'package:flutter/material.dart';
import 'package:sportson/resources/StyleResources.dart';
import '../resources/StringResources.dart';

class PrimaryButton extends StatelessWidget {

  var btntext = "";
  VoidCallback onTap;
  PrimaryButton({required this.btntext,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 230.0,
      child: ElevatedButton(
          style:StyleResources.BTN_STYLE ,
          onPressed:onTap,
          child: Text(btntext)
      ),
    );
  }
}
