import 'package:flutter/material.dart';

class StyleResources
{
  static Color BTN_COLOR = Color(0xff880e4f);
  static ButtonStyle BTN_STYLE = ElevatedButton.styleFrom(
    shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.circular(15.0)
    ),
    backgroundColor: StyleResources.BTN_COLOR,
    foregroundColor: Colors.white,
    
  );
}