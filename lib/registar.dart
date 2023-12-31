import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
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
import 'package:projectt/showproudect.dart';
import 'package:http/http.dart' as http;


class registar extends StatefulWidget  {
  @override
  registarstate createState() {
    // TODO: implement createState
    return registarstate();
  }
}
class registarstate extends State<registar> with SingleTickerProviderStateMixin{
final TextEditingController _ph=new TextEditingController();
final TextEditingController _pa=new TextEditingController();
final TextEditingController _na=new TextEditingController();
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
    animationController=AnimationController(vsync: this,duration: Duration(milliseconds: 600));
    fadinganimations=Tween<double>(begin:0.2,end: 1).animate(animationController!)..addListener(() {  setState(() {
       animationController?.repeat();
      });
      });
   
    animationController?.forward();}


    registar()async{
      final response =await http.post(Uri.https('testpharma-project.000webhostapp.com','/api/register'),body: {

        "phone":_ph.text,
        "name":_na.text,
        "password":_pa.text
      });
      var data=jsonDecode(response.body);

       if (response.statusCode == 201){
            Get.off(showproduect())  ;}


         else if (response.statusCode ==200){
            AwesomeDialog(
            context: context,
            dialogType: DialogType.info,
            animType: AnimType.rightSlide,
            title: 'Warning',
            desc: 'The account was previously created',
            btnOkOnPress: () {},
            )..show();
            
       }
            
       
       else{      AwesomeDialog(
             context: context,
            dialogType: DialogType.error,
            animType: AnimType.rightSlide,
            title: 'Error',
            desc: 'Server Error',
            btnOkOnPress: () {},
            )..show();
    
       }
                      var apiToken = data['token']; 
                      shardpre!.setString("token", "$apiToken");
    }


@override
  void dispose() {
    animationController!.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

      return Scaffold(backgroundColor: Colors.white,
         body: SingleChildScrollView(
      
            child:
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 45,vertical: 60),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
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
                children: [Text("REGISTER",style: TextStyle(fontSize:16,fontWeight: FontWeight.bold,color: Colors.black),),]),
                SizedBox(height: 5,),
              Row(children:[
                Text("register in your account",style: TextStyle(fontWeight: FontWeight.bold,fontSize:14,color: Colors.grey)),]) ,
                SizedBox(height: 20,),
                filed(th:" user name",icon: Icon(Icons.person),controll:_na,osb:false,
               vaild: (Value) {},
                k: TextInputType.name,),
               SizedBox(height: 20,),
                filed(th:" user phone ",icon: Icon(Icons.phone),controll:_ph,osb:false,vaild:(Value) {
                if(Value!.isNotEmpty&&(!Value.startsWith("09")||Value.length!=10)){
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
                    if(Value!.isNotEmpty&&Value.length<5){
                    return "Password should not be less than five characters ";
                   
                  }
                },),
              
         
                    
         const SizedBox(height: 20,),
              botton(tb: " creat account   ", tap:  ()async {
                


            if(_pa.text.isEmpty||_na.text.isEmpty||_ph.text.isEmpty){
            AwesomeDialog(
             context: context,
            dialogType: DialogType.error,
            animType: AnimType.rightSlide,
            title: 'Warning',
            desc: 'Please enter the faileds',
         
            btnOkOnPress: () {;},
            )..show();
                }
              else if(!_ph.text.startsWith("09")||_ph.text.length!=10||_pa.text.length<5){
                      }
                      
                else{
                    registar();
                }
              
                
               })])  ),
          )
      )

    ;}}
    
     