import 'package:flutter/material.dart';
import 'package:sportson/helpers/ApiHandler.dart';
import 'package:sportson/helpers/ErrorHandler.dart';
import 'package:sportson/models/AllEmploye.dart';
import 'package:sportson/resources/UrlResources.dart';

class EmployeProvider extends ChangeNotifier
{
  List<AllEmploye>? alldata;
  GetEmploye(context) async{
    try
    {
      await ApiHandler.getRequest(UrlResources.VIEW_EMPLOYE).then((json) {
        alldata = json["data"].map<AllEmploye>((obj) => AllEmploye.fromJson(obj)).toList();
        notifyListeners();
      });
    }
    on ErrorHandler catch (ex)
    {
      if(ex.message.toString()=="Internet Connection Failure")
      {
        //rdirect to no internet page

      }
      else if(ex.message.toString()=="Bad Response Format")
      {
        //redirect to support page
      }
    }
  }

  bool isinserted= false;
  var insertmessage= "";
  AddEmploye(context,para) async
  {
    try
    {
      await ApiHandler.postRequest(UrlResources.ADD_EMPLOYE,body:para).then((json) {
        if(json["status"]=="true")
        {
          isinserted=true;
          insertmessage = json["message"];
        }
        else
        {
          isinserted=false;
          insertmessage = json["message"];
        }

      });
    }
    on ErrorHandler catch (ex)
    {
      if(ex.message.toString()=="Internet Connection Failure")
      {
        //rdirect to no internet page

      }
      else if(ex.message.toString()=="Bad Response Format")
      {
        //redirect to support page
      }
    }
  }

  bool isdeleted=false;
  var deletemessage="";
  DeleteEmploye(context,params) async{
    try
    {
      await ApiHandler.postRequest(UrlResources.DELETE_EMPLOYE,body:params).then((json) {
        if (json["status"] == "true") {
          isdeleted = true;
          deletemessage = json["message"];
          (context);
        }
        else {
          isdeleted = false;
          deletemessage = json["message"];
        }
        GetEmploye(context);

      });
    }
    on ErrorHandler catch (ex)
    {
      if(ex.message.toString()=="Internet Connection Failure")
      {
        //rdirect to no internet page

      }
      else if(ex.message.toString()=="Bad Response Format")
      {
        //redirect to support page
      }
    }
  }

  //var mydata;
  AllEmploye? obj;
  bool isupdateloding=false;
  GetSingleEmploye(context,eid) async
  {
    try
    {
      isupdateloding = true;
      var para =
      {
        "eid": eid
      };
      await ApiHandler.postRequest(UrlResources.GET_SINGLE_EMPLOYE,body:para).then((json) {
        // mydata=json;
        obj = AllEmploye.fromJson(json["data"]);
        isupdateloding = false;
        notifyListeners();
      });
    }
    on ErrorHandler catch (ex)
    {
      if(ex.message.toString()=="Internet Connection Failure")
      {
        //rdirect to no internet page

      }
      else if(ex.message.toString()=="Bad Response Format")
      {
        //redirect to support page
      }
    }
  }

  bool isupdate =false;
  var updatemsg ="";
  UpdateEmploye(context,para) async
  {
    try
    {
      await ApiHandler.postRequest(UrlResources.EDIT_EMPLOYE,body:para).then((json) {
        print(json.toString());
        if(json["status"]=="true")
        {
          isupdate=true;
          updatemsg=json["message"];
          GetEmploye(context);
        }
        else
        {
          isupdate=false;
        }

      });

    }
    on ErrorHandler catch (ex)
    {
      if(ex.message.toString()=="Internet Connection Failure")
      {
        //rdirect to no internet page

      }
      else if(ex.message.toString()=="Bad Response Format")
      {
        //redirect to support page
      }
    }
  }

}
