import 'package:flutter/material.dart';
import 'package:sportson/screens/auth/LoginScreen.dart';
import 'package:sportson/screens/employee/AddEmployeescreen.dart';
import 'package:sportson/screens/employee/ViewEmployeeScreen.dart';
import 'package:sportson/screens/product/AddProductScreen.dart';
import 'package:sportson/screens/product/ViewProductScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HomeScreen"),
        centerTitle: true,
      ),
      drawer: Drawer(
        backgroundColor: Colors.grey.shade50,
        child: SingleChildScrollView(
          child: Column(
            children: [
             Center(
               child: Container(
                 width: MediaQuery.of(context).size.width,
                 margin: EdgeInsets.all(15),
                 color: Colors.green.shade50,
                 child: Column(
                   children: [
                     Text("Product",style:TextStyle(
                         fontSize: 25,
                         fontWeight: FontWeight.bold
                     )),
                     ElevatedButton(
                         onPressed:(){
                           Navigator.of(context).push(
                               MaterialPageRoute(builder: (context) => AddProduct(),)
                           );
                         },
                         child: Text("Add Product")
                     ),

                     ElevatedButton(
                         onPressed:(){
                           Navigator.of(context).push(
                               MaterialPageRoute(builder: (context) => AllProductWithModel(),)
                           );
                         },
                         child: Text("View Product")
                     ),
                   ],
                 ),
               ),
             ),
              //  Employe
              SizedBox(height: 20.0,),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.all(10),
                  color: Colors.orange.shade50,
                  child: Column(
                    children: [
                      Text("Employe",style:TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold
                      )),
                      ElevatedButton(
                          onPressed:(){
                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) => AddEmploye(),)
                            );
                          },
                          child: Text("Add Employe")
                      ),

                      ElevatedButton(
                          onPressed:(){
                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) => AllEmployeWithModel(),)
                            );
                          },
                          child: Text("View Employe")
                      ),
                      ElevatedButton(
                          onPressed:(){
                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) => LoginScreen(),)
                            );
                          },
                          child: Text("Login Screen")
                      ),

                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
