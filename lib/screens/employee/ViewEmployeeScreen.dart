import 'dart:convert';
import 'dart:io';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sportson/providers/AllEmployeProvider.dart';
import 'package:sportson/screens/employee/EditEmploye.dart';
import 'package:sportson/screens/product/EditProduct.dart';
import '../../models/AllEmploye.dart';
import 'EmployeViewWithModel.dart';



class AllEmployeWithModel extends StatefulWidget
{
  @override
  State<AllEmployeWithModel> createState() => _AllEmployeWithModelState();
}

class _AllEmployeWithModelState extends State<AllEmployeWithModel>
{
  EmployeProvider? provider;

  getdata() async
  {
    await provider!.GetEmploye(context);
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    provider = Provider.of<EmployeProvider>(context,listen: false);
    getdata();
  }

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<EmployeProvider>(context,listen: true);
    return Scaffold(
      appBar: AppBar(
        title: Text("All Employe With Model"),
        centerTitle: true,
      ),
      body: (provider!.alldata==null)?Center(child: CircularProgressIndicator(),):ListView.builder(
        itemCount: provider!.alldata!.length,
        itemBuilder: (context, index)

        {
          return InkWell(
            onTap: (){
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => EmployeViewWithModel(
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
                    Text(provider!.alldata![index].eid.toString()),
                    Text(provider!.alldata![index].ename.toString()),
                    Text(provider!.alldata![index].salary.toString()),
                    Text(provider!.alldata![index].department.toString()),
                    Text(provider!.alldata![index].gender.toString()),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () async{
                              var eid =provider!.alldata![index].eid.toString();
                              var params =
                              {
                                "eid":eid
                              };

                              await provider!.DeleteEmploye(context,params);
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
                              var eid =provider!.alldata![index].eid.toString();
                              Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context) => EditEmploye(
                                    eid: eid,
                                  ),)
                              );
                            },
                            icon: Icon(Icons.edit,color: Colors.green,)
                        ),
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
