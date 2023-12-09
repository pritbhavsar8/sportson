import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sportson/providers/AuthProvider.dart';
import 'package:sportson/resources/StringResources.dart';
import 'package:sportson/resources/StyleResources.dart';
import 'package:sportson/screens/auth/RegisterScreen.dart';
import 'package:sportson/widgets/PrimaryButton.dart';

import '../../widgets/Textbox.dart';

class LoginScreen extends StatefulWidget
{
  const LoginScreen({Key? key}) : super(key: key);
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
{
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  @override
  AuthProvider? provider;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    provider = Provider.of<AuthProvider>(context,listen: false);
  }
  Widget build(BuildContext context)
  {
    provider = Provider.of<AuthProvider>(context,listen: true);
    return  Scaffold(
      backgroundColor: Color(0xffFBFAFF),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30.0,),
            Text("Login",style: TextStyle(
              fontFamily: "SourceSansPro",
              fontWeight: FontWeight.w700,
              color: Color(0xff010101),
              fontSize: 20.0,
            ),),
            SizedBox(height: 20.0,),
            //Text Field,
            Textbox(
              KeyboardType: TextInputType.emailAddress,
              Controller: _email,
              Label: "Email",
              ispassword: false,
            ),
            // Container(
            //   width: MediaQuery.of(context).size.width,
            //   margin: EdgeInsets.all(15.0),
            //   child: TextField(
            //     controller: _email,
            //     keyboardType: TextInputType.emailAddress,
            //     decoration: InputDecoration(
            //         label : Text("Email",style: TextStyle(
            //             color:Colors.grey
            //         ),),
            //         focusedBorder: OutlineInputBorder(
            //             borderRadius: BorderRadius.circular(15.0),
            //             borderSide: BorderSide(
            //               color: Colors.red,
            //             )
            //         ),
            //         enabledBorder: OutlineInputBorder(
            //             borderRadius: BorderRadius.circular(15.0),
            //             borderSide: BorderSide(
            //               color: Colors.grey,
            //             )
            //         )
            //     ),
            //   ),
            // ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.all(15.0),
              child: TextField(
                obscureText: true,
                controller: _password,
                keyboardType: TextInputType.visiblePassword,

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
              btntext: "Sign In",
              onTap: () async{
                var name = _email.text.toString();
                var password = _password.text.toString();
                var params = {
                  "name": name,
                  "password": password,
                  "device_token":"12345678",
                  "device_os":"android"
                };

                var h = {
                  "Content-Type":"application/json"
                };
                provider!.Login(context,params,h);


              },
            ),
            // Container(
            //   width: 130.0,
            //   child: ElevatedButton(
            //       style:StyleResources.BTN_STYLE ,
            //       onPressed: (){
            //         var email = _email.text.toString();
            //         var password = _password.text.toString();
            //       },
            //       child: Text(StringResources.BTN_LOGIN_TEXT)
            //   ),
            // ),
            SizedBox(height: 10.0,),
            RichText(
                text: TextSpan(
                    children: [
                      TextSpan(
                          text: "Don’t Have an account?",
                          style: TextStyle(
                            fontFamily: "SourceSansPro",
                            fontWeight: FontWeight.w600,
                            color: Color(0xff010101),
                            fontSize: 15.0,
                          )
                      ),
                      TextSpan(
                          text: " Create",
                          recognizer: TapGestureRecognizer()..onTap = (){
                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) => RegisterScreen(),)
                            );
                          },
                          style: TextStyle(
                            fontFamily: "SourceSansPro",
                            fontWeight: FontWeight.w600,
                            color: Color(0xffFE7551),
                            fontSize: 15.0,
                          )
                      ),
                    ]
                )
            )
          ],
        ),
      ),

    );
  }
}
