import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:sportson/helpers/ApiHandler.dart';
import 'package:sportson/helpers/ErrorHandler.dart';
import 'package:sportson/resources/UrlResources.dart';
import 'package:http/http.dart' as http;

class AuthProvider extends ChangeNotifier
{
  Login(context,params,h) async
  {
    try
    {
      await ApiHandler.postRequest("https://begratefulapp.ca/api/login",body:jsonEncode(params),headers: h).then((json) {
        if(json["result"]=="success")
          {
            var message = json["message"].toString();
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(message,style: TextStyle(color: Colors.white),),
                  backgroundColor: Colors.green,
                )
            );
          }

      });
    }
    on ErrorHandler catch (ex)
    {
      if (ex.message.toString() == "Internet Connection Failure") {
        //rdirect to no internet page

      }
      else if (ex.message.toString() == "Bad Response Format") {
        //redirect to support page
      }
    }

  }
}