import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projectt/login.dart';

import 'package:shared_preferences/shared_preferences.dart';
SharedPreferences? shardpre;
void main() async{
WidgetsFlutterBinding.ensureInitialized();
shardpre=await SharedPreferences.getInstance();

  runApp(const MyApp());
}


class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,


      initialRoute: "/log",
      getPages: [ 
      GetPage(name: "/log", page: () => login())
    ],

    );}}
