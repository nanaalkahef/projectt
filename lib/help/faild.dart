
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';



class filed extends StatelessWidget{
  String th;
 final TextEditingController controll;
  var icon,sufix;
  bool osb=false ;
  String? Function (String?)vaild;
 TextInputType? k;
  filed({required this.th,this.sufix,  required this.controll,this.k,this.icon,required this.osb, required this. vaild});
  @override
  Widget build(BuildContext context) {
   return TextFormField(
    cursorColor: Colors.black,
    keyboardType:k ,
    controller: controll,
    validator:vaild,
    autovalidateMode: AutovalidateMode.always,
    obscureText:osb,
    decoration: InputDecoration(
    filled: true,
    fillColor: Colors.white,
    prefixIcon: icon,
    suffixIcon: sufix,
    prefixIconColor: Colors.black,
    hintText: th,
   enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
   focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20),borderSide: BorderSide( color: Colors.green.shade700,)),
   errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.red)),

    ),
  

   );}}