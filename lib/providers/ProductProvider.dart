import 'package:flutter/material.dart';

import '../helpers/ApiHandler.dart';
import '../helpers/ErrorHandler.dart';
import '../models/AllProduct.dart';
import '../resources/UrlResources.dart';

class ProductProvider extends ChangeNotifier
{

  List<AllProduct>? alldata;
  getallproducts(context) async{
    try
    {
      await ApiHandler.getRequest(UrlResources.VIEW_PRODUCT).then((json) {
        alldata = json["data"].map<AllProduct>((obj) => AllProduct.fromJson(obj)).toList();
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

  bool isinserted=false;
  var insertmessage="";

  addproduct(context,params) async {
    try
    {
      await ApiHandler.postRequest(UrlResources.ADD_PRODUCT,body:params).then((json) {
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
  deleteproduct(context,params) async {
    try {
      await ApiHandler.postRequest(UrlResources.DELETE_PRODUCT, body: params)
          .then((json) {
        if (json["status"] == "true") {
          isdeleted = true;
          deletemessage = json["message"];
          getallproducts(context);
        }
        else {
          isdeleted = false;
          deletemessage = json["message"];
        }
      });
    }
    on ErrorHandler catch (ex) {
      if (ex.message.toString() == "Internet Connection Failure") {
        //rdirect to no internet page

      }
      else if (ex.message.toString() == "Bad Response Format") {
        //redirect to support page
      }
    }
  }

  AllProduct? singleproduct;
  bool isupdateloding=false;

  getsingle(context,pid) async
  {
    isupdateloding=true;
    try {
      var params = {
        "pid":pid
      };
      await ApiHandler.postRequest(UrlResources.GET_SINGLE_PRODUCT, body: params)
          .then((json) {

        if (json["status"] == "true")
        {
          singleproduct = AllProduct.fromJson(json["data"]);
          print(singleproduct!.pname.toString());
          isupdateloding = false;
          notifyListeners();
        }
      });
    }
    on ErrorHandler catch (ex) {
      if (ex.message.toString() == "Internet Connection Failure") {
        //rdirect to no internet page

      }
      else if (ex.message.toString() == "Bad Response Format") {
        //redirect to support page
      }
    }
  }

  bool isupdated=false;
  updateproduct(context,params) async {
    try
    {
      await ApiHandler.postRequest(UrlResources.EDIT_PRODUCT,body:params).then((json) {
        if(json["status"]=="true")
        {
          isupdated=true;
          getallproducts(context);
        }
        else
        {
          isupdated=false;
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