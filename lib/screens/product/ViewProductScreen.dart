import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sportson/helpers/ApiHandler.dart';
import 'package:sportson/providers/ProductProvider.dart';
import '../../resources/UrlResources.dart';
import 'AllProductView.dart';
import 'EditProduct.dart';

class AllProductWithModel extends StatefulWidget
{

  @override
  State<AllProductWithModel> createState() => _AllProductWithModelState();
}

class _AllProductWithModelState extends State<AllProductWithModel>
{

  // try
  // {
  //   var x=10;
  //   var y=2;
  //   var total = x / y;
  //   print(total);
  // }
  // catch(e)
  // {
  //   print("not divide by 0")
  // }


  ProductProvider? provider;

  getdata() async
  {
    await provider!.getallproducts(context);
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
        title: Text("All Product With Model"),
        centerTitle: true,
      ),
      body: (provider!.alldata==null)?Center(child: CircularProgressIndicator(),):ListView.builder(
        itemCount: provider!.alldata!.length,
        itemBuilder: (context, index)
        {
          return InkWell(
            onTap: (){
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => AllProductView(
                  obj: provider!.alldata![index],
                ),),
              );
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.all(10.0),
              child: Card(
                elevation: 5,
                child: Column(
                  children: [
                    Text(provider!.alldata![index].pid.toString()),
                    Text(provider!.alldata![index].pname.toString()),
                    Text(provider!.alldata![index].qty.toString()),
                    Text(provider!.alldata![index].price.toString()),
                    Text(provider!.alldata![index].addedDatetime.toString()),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () async{
                              var pid =provider!. alldata![index].pid.toString();
                              var params =
                              {
                                "pid":pid
                              };

                              await provider!.deleteproduct(context,params);
                              if(provider!.isdeleted)
                              {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(provider!.deletemessage,style: TextStyle(color: Colors.white),),
                                      backgroundColor: Colors.green,
                                    )
                                );
                              }
                              else
                              {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(provider!.deletemessage,style: TextStyle(color: Colors.white),),
                                      backgroundColor: Colors.red,
                                    )
                                );
                              }


                            },
                            icon: Icon(Icons.delete_rounded,color: Colors.red,)
                        ),
                        IconButton(
                            onPressed: (){

                              var pid =provider!.alldata![index].pid.toString();

                              Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context) => EditProduct(
                                    pid: pid,
                                  ),)
                              );
                            },
                            icon: Icon(Icons.edit,color: Colors.green,)
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
