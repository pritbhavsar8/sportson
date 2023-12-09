import 'package:flutter/material.dart';

import '../../resources/StyleResources.dart';
import '../../widgets/PrimaryButton.dart';

class RegisterScreen extends StatefulWidget
{
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen>
{
  TextEditingController _fullname = TextEditingController();
  TextEditingController _phoneno = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold (
      backgroundColor: Color(0xffFBFAFF),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20.0,),
            Text("Create New Account",style: TextStyle(
              fontFamily: "SourceSansPro",
              fontWeight: FontWeight.w700,
              color: Color(0xff010101),
              fontSize: 20.0,
            ),),
            SizedBox(height: 20.0,),
            //Text Field,
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.all(15.0),
              child: TextField(
                controller: _fullname,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                    label : Text("FullName",style: TextStyle(
                        color:Colors.grey
                    ),),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide(
                          color: Colors.red,
                        )
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide(
                            color: Colors.grey
                        )
                    )
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.all(15.0),
              child: TextField(
                controller: _phoneno,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    label : Text("PhoneNo",style: TextStyle(
                        color:Colors.grey
                    ),),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide(
                          color: Colors.red,
                        )
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide(
                          color: Colors.grey,
                        )
                    )
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.all(15.0),
              child: TextField(
                controller: _email,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    label : Text("Email",style: TextStyle(
                        color:Colors.grey
                    ),),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide(
                          color: Colors.red,
                        )
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide(
                          color: Colors.grey,
                        )
                    )
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.all(15.0),
              child: TextField(
                obscureText: true,
                controller: _password,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    suffixIcon: Icon(Icons.remove_red_eye_sharp),
                    label : Text("Password",style: TextStyle(
                        color:Colors.grey
                    ),),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide(
                          color: Colors.red,
                        )
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide(
                          color: Colors.grey,
                        )
                    )
                ),
              ),
            ),
            //button
            PrimaryButton(
              btntext: "Sign Up",
              onTap: (){},
            ),
            // Container(
            //   width: 130.0,
            //   child: ElevatedButton(
            //       style:StyleResources.BTN_STYLE ,
            //       onPressed: (){
            //         var fullname = _fullname.text.toString();
            //         var phoneno = _password.text.toString();
            //         var email = _email.text.toString();
            //         var password = _password.text.toString();
            //       },
            //       child: Text("Register")
            //   ),
            // ),
            SizedBox(height: 10.0,),
          ],
        ),
      ),

    );
  }
}
