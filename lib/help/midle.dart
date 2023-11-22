
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:projectt/main.dart';
class midl extends GetMiddleware{

// ignore: body_might_complete_normally_nullable
@override
 RouteSettings?  redirect (String? route){
if(shardpre!.getString("token")!=null) return RouteSettings(name: "/three");
}


}