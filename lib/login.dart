import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_notifier.dart';
import 'package:get_storage/get_storage.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:projectt/help/botton.dart';
import 'package:projectt/help/faild.dart';
import 'package:projectt/main.dart';
import 'package:projectt/registar.dart';
import 'package:http/http.dart' as http;
import 'package:projectt/showproudect.dart';


class login extends StatefulWidget  {
  @override
  loginstate createState() {
    // TODO: implement createState
    return loginstate();
  }
}
class loginstate extends State<login> with SingleTickerProviderStateMixin{
final TextEditingController _ph=new TextEditingController();
final TextEditingController _pa=new TextEditingController();
AnimationController ?animationController;
Animation ?fadinganimations;
bool eyes=true;
showeyes(){
  setState(() {
    eyes=!eyes;
  });
}
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController=AnimationController(vsync: this,duration: Duration(microseconds: 600 ));
    fadinganimations=Tween<double>(begin:0.2,end: 1).animate(animationController!)..addListener(() {  setState(() {
      animationController?.repeat();
      });
      });
   
    animationController?.forward();
  }@override
  void dispose() {
    animationController!.dispose();
    // TODO: implement dispose
    super.dispose();

  }
    login()async{
      final response =await http.post(Uri.parse("testpharma-project.000webhostapp.com/api/login"),body: {

        "phone":_ph.text,
        "password":_pa.text
      });
      final data=jsonDecode(response.body);

       if (response.statusCode == 201){
                  showDialog(context: context, builder:(context) => AlertDialog(
                   title: Text(" informating "),
                   content: Text("login Success"),
                   actions: [TextButton(onPressed:() { Get.off(showproduect())  ;}, child: Text("Ok"))],

                  ),);
       }
         else if (response.statusCode == 422){
                  showDialog(context: context, builder:(context) => AlertDialog(
                   title: Text("Warning"),
                   content: Text("Please enter the faileds"),
                   actions: [TextButton(onPressed:() { Navigator.pop(context); ;}, child: Text("Ok"))],

                  ),);
       }
           else if (response.statusCode == 401){
                  showDialog(context: context, builder:(context) => AlertDialog(
                   title: Text("Warning"),
                   content: Text("phone or password is incorrect !!!"),
                   actions: [TextButton(onPressed:() { Navigator.pop(context); ;}, child: Text("Ok"))],

                  ),);
           }
       else{ showDialog(context: context, builder:(context) => AlertDialog(
                  title: Text(" Error "),
                 content: Text("Server Error"),
                  actions: [TextButton(onPressed:() { Navigator.pop(context); ;}, child: Text("Ok"))],));}

                      var apiToken = data['token']; 
                      shardpre!.setString("token", "$apiToken");
    }

  @override
  Widget build(BuildContext context) {

      return Scaffold(backgroundColor: Colors.white,
         body:SingleChildScrollView(
      
            child:
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 45,vertical: 60),
              child: Column(mainAxisAlignment: MainAxisAlignment.center,
              children: [Stack(
                clipBehavior: Clip.none,
              
                children: [Image.asset("lib/images/logo.jpg",width: 250,height: 250,),
                Positioned(top: 130,left: 140,child:
               
                   Opacity(opacity: fadinganimations!.value,
                   
                    child: Text("صيدليتي",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.green[700],
                      fontFamily: "Poppions",fontSize: 40),),
                  ),
                )
                
                
                ],),
                SizedBox(height: 10,),
               Row(mainAxisAlignment: MainAxisAlignment.start,
                children: [Text("LOGIN",style: TextStyle(fontSize:16,fontWeight: FontWeight.bold,color: Colors.black),),]),
                SizedBox(height: 5,),
              Row(children:[
                Text("login to your account",style: TextStyle(fontWeight: FontWeight.bold,fontSize:14,color: Colors.grey)),]) ,
               SizedBox(height: 20,),
                filed(th:" user phone ",icon: Icon(Icons.phone),controll:_ph,osb:false,vaild:(Value) {
                if(Value!.isNotEmpty&&!Value.startsWith("09")){
                    return "The number is invalid ";
                   
                  }
                },k: TextInputType.phone,
              ),
                SizedBox(height: 20,),
                 filed(th: " password ",icon: Icon(Icons.lock),osb: eyes,
                 sufix: IconButton(color: Colors.green[700],
                  icon:eyes
                  
                 ? Icon(Icons.visibility_off,size: 20,) 
                 :Icon(Icons.visibility,size: 20,), onPressed: () {showeyes() ; },),

                 k:TextInputType.visiblePassword,controll:_pa,vaild: (Value) {
              
                },),
              
         
                SizedBox(height: 8,),
              
         FittedBox(child:    Row(
            children: [
                Text("if you dont have account please",style: TextStyle(fontSize:14,color:Colors.grey),),
                SizedBox(width:6,),
                InkWell(onTap: (() {
                  Get.off(registar());
                  
                  ;}),
                  child: Text("click on",style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color: Colors.green[700]),),
                ),
                       ],),),
                    
                   SizedBox(height: 20,),
              botton(tb: " login   ", tap:  ()async {
                    if(!_ph.text.startsWith("09")){
                       Navigator.pop(context);}
                
                
               else{
                    login();}
              

              })])  ),
          )
      )
    ;}}