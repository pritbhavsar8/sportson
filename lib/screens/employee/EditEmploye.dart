
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:sportson/providers/AllEmployeProvider.dart';

import 'package:sportson/resources/UrlResources.dart';

class EditEmploye extends StatefulWidget
{
  @override
  State<EditEmploye> createState() => _EditEmploye();
  var eid = "";
  EditEmploye({required this.eid});
}

class _EditEmploye extends State<EditEmploye>
{
  TextEditingController _name = TextEditingController();
  TextEditingController _salary = TextEditingController();
  var selected = "Product";
  var gender = "M";
  bool isloading = false;

  EmployeProvider? provider;


  getdata() async
  {

   await provider!.GetSingleEmploye(context,widget.eid);
    _name.text = provider!.obj!.ename.toString();
    _salary.text = provider!.obj!.salary.toString();
    setState(() {
       selected = provider!.obj!.department.toString();
       gender = provider!.obj!.gender.toString();
    });
   // _name.text = provider!.mydata!.ename.toString();
   //  _salary.text = provider!.mydata!.salary.toString();
   //  gender = provider!.mydata!.gender.toString();
   //  selected= provider!.mydata!.department.toString();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    provider =  Provider.of<EmployeProvider>(context,listen: false);
    getdata();
  }

  @override
  Widget build(BuildContext context) {
    provider =  Provider.of<EmployeProvider>(context,listen: true);
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 600,
            margin: EdgeInsets.all(15.0),
            padding: EdgeInsets.all(15.0),
            color: Color(0xfffff3e0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.0,),
                Text("Name"),
                SizedBox(
                  width: 300.0,
                  child: TextField(
                    controller: _name,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11.0),
                        borderSide: BorderSide(
                            color: Colors.grey
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.0,),
                Text("Salary"),
                SizedBox(
                  width: 300.0,
                  child: TextField(
                    controller: _salary,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11.0),
                        borderSide: BorderSide(
                            color: Colors.grey
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.0,),
                Text("gender"),
                SizedBox(height: 15.0,),
                Row(
                  children: [
                    Radio(
                        value: "M",
                        groupValue: gender,
                        onChanged: (val){
                          setState(() {
                            gender=val!;
                          });
                        }
                    ),
                    Text("Male"),
                    SizedBox(width: 15.0,),
                    Radio(
                        value: "F",
                        groupValue: gender,
                        onChanged: (val){
                          setState(() {
                            gender=val!;
                          });
                        }
                    ),
                    Text("Female"),
                  ],
                ),
                SizedBox(height: 10.0,),
                Text("Department"),
                DropdownButton(
                  dropdownColor: Colors.orangeAccent.shade100,
                  value: selected,
                  onChanged: (val){
                    setState(() {
                      selected=val!;
                    });
                  },
                  items: [
                    DropdownMenuItem(
                      child: Text("HR"),
                      value: "hr",
                    ),
                    DropdownMenuItem(
                      child: Text("Product"),
                      value: "Product",
                    ),
                    DropdownMenuItem(
                      child: Text("Purchase"),
                      value: "Purchase",
                    ),
                  ],
                ),
                SizedBox(height: 10.0,),
                //Button

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 300.0,
                      child: ElevatedButton(
                        onPressed: () async{
                          var name = _name.text.toString();
                          var salary = _salary.text.toString();
                          var Gender = gender;
                          var department = selected;

                          var para = {
                            "ename":name,
                            "salary": salary,
                            "department":department,
                            "gender": Gender,
                            "eid":widget.eid
                          };
                          provider!.UpdateEmploye(context,para);
                          if(provider!.isupdate)
                            {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(provider!.updatemsg,style: TextStyle(color: Colors.white),),
                                    backgroundColor: Colors.green,
                                  )
                              );
                              Navigator.of(context).pop();
                            }
                        },
                        child: Text("Update"),
                        style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.blue,
                            shape: ContinuousRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
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
