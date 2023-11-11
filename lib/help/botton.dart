import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';




class botton extends StatelessWidget{
 String tb;
 VoidCallback tap;
 botton({required this.tb,required this.tap});
  @override
  Widget build(BuildContext context) {
   return GestureDetector(
    onTap :tap ,
   child:Container(
    width: 350,
    height: 50,
    decoration: BoxDecoration(
     color: Colors.green[700],
    borderRadius: BorderRadius.circular(20),
      
    ),

    child: Center(child: Text("${tb}",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
    
    ))) ,
  





   );}}