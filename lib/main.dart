import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sportson/providers/AllEmployeProvider.dart';
import 'package:sportson/providers/AuthProvider.dart';
import 'package:sportson/providers/ProductProvider.dart';
import 'package:sportson/screens/Home/HomeScreen.dart';
import 'package:sportson/screens/auth/LoginScreen.dart';
import 'package:sportson/screens/product/AddProductScreen.dart';

import 'screens/product/ViewProductScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=> ProductProvider()),
        ChangeNotifierProvider(create: (context)=> EmployeProvider()),
        ChangeNotifierProvider(create: (context)=> AuthProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: HomeScreen(),
      ),
    );
  }
}

