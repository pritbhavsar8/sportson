import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:sportson/providers/ProductProvider.dart';
import 'package:sportson/resources/UrlResources.dart';

import 'ViewProductScreen.dart';



class EditProduct extends StatefulWidget
{
  var pid="";
  EditProduct({required this.pid});

  @override
  State<EditProduct> createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct>
{
  TextEditingController _name = TextEditingController();
  TextEditingController _price = TextEditingController();
  TextEditingController _qty = TextEditingController();
  ProductProvider? provider;

  getdata() async
  {
    await provider!.getsingle(context, widget.pid);
    _name.text = provider!.singleproduct!.pname.toString();
    _qty.text = provider!.singleproduct!.qty.toString();
    _price.text = provider!.singleproduct!.price.toString();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    provider = Provider.of<ProductProvider>(context,listen: false);
    getdata();
  }
  @override
  Widget build(BuildContext context) {
    provider = Provider.of<ProductProvider>(context,listen: true);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade200,
        toolbarHeight: 70.0,
        title: Text("EditProduct"),
        centerTitle: true,
      ),
      body:  (provider!.isupdateloding)?Center(child: CircularProgressIndicator(),):SingleChildScrollView(
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 500,
            margin: EdgeInsets.all(15.0),
            padding: EdgeInsets.all(15.0),
            color: Color(0xfffff3e0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.0,),
                Text("Name:"),
                SizedBox(
                  width: 300.0,
                  child: TextField(
                    controller: _name,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11.0),
                      ),
                      focusedBorder:OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11.0),
                          borderSide: BorderSide(
                              color: Colors.grey
                          )
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.0,),
                Text("Qty:"),
                SizedBox(
                  width: 300.0,
                  child: TextField(
                    controller: _qty,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11.0),
                      ),
                      focusedBorder:OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11.0),
                          borderSide: BorderSide(
                              color: Colors.grey
                          )
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.0,),
                Text("Price:"),
                SizedBox(
                  width: 300.0,
                  child: TextField(
                    controller: _price,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11.0),
                      ),
                      focusedBorder:OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11.0),
                          borderSide: BorderSide(
                              color: Colors.grey
                          )
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.0,),

                //Button
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 300.0,
                      child: ElevatedButton(
                        onPressed: () async{
                          var name  = _name.text.toString();
                          var qty  = _qty.text.toString();
                          var price  = _price.text.toString();

                          var params = {
                            "pname":name,
                            "qty":qty,
                            "price":price,
                            "pid":widget.pid
                          };
                          
                          await provider!.updateproduct(context, params);
                          if(provider!.isupdated)
                            {
                              Navigator.of(context).pop();
                            }
                          else
                            {
                              print("Error");
                            }

                        },
                        child: Text("Update"),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.white,
                            shape: ContinuousRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            )
                        ),

                      ),
                    ),
                  ],
                ),

              ],
            ),
          ),
        ),
      ),

    );
  }
}
