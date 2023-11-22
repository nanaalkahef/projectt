import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:projectt/description.dart';
import 'package:projectt/help/api/getproduect.dart';
import 'package:projectt/help/api/produect.dart';
import 'package:projectt/main.dart';

class showproduect extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
  final produect p;
   return Scaffold(
  backgroundColor:Colors.green[700],
 appBar: AppBar
 (elevation: 0,
 backgroundColor:Colors.green[700],

 
 title: Text("Medicine",style: TextStyle(fontWeight: FontWeight.bold,fontSize:20),),
 actions: [IconButton(onPressed: (() {shardpre!.clear();
   Get.offNamed("/login");
 }), icon:Icon(Icons.menu))],
 ),
   body: Column(
   children: [SizedBox(height: 20),
     Expanded(
       child: Stack(children: [
      Container(margin: EdgeInsets.only(top:70),
        decoration: BoxDecoration(color: Colors.white,
        borderRadius: BorderRadius.only( topLeft: Radius.circular(40),topRight: Radius.circular(40)),),),
        Container(margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          height: 190,decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        
        ),
       FutureBuilder<List<produect>>(
        future: getallproudect().getallproudects(),
           builder:(context, snapshot) {
          if(snapshot.hasData){
            List<produect>p=snapshot.data!;
           return ListView.builder(
         itemCount: p.length,
         itemBuilder: (context, index) =>  InkWell(
          onTap: () {
      
            Get.off(descriptionproduect(p: p[index],));
          },
          child: Stack(
            children: [Container(margin: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
            height: 166,decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
          color:Colors.white,boxShadow: [BoxShadow(
            offset: Offset(0, 25),
            blurRadius: 25,
            color: Colors.black12,
          )])
          ),
          Container(height: 160,
            width:  200,
            margin: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
              child: Image.network(p[index].image,height: MediaQuery.of(context).size.height*0.4,width: MediaQuery.of(context).size.width*0.5,)),
            Container(width: 340,height:160,
              child: Column(mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
                children: [
              
                Text(p[index].category,style: TextStyle(fontWeight: FontWeight.bold, fontSize:20,color: Colors.black),),
                  SizedBox(height: 10,),
                  Text(p[index].category,style: TextStyle(fontSize: 15,color: Colors.grey,fontWeight: FontWeight.bold),),
                  SizedBox(height: 10,),
                 Text("price ${p[index].price}",
                 style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.green[700]),)
              
            
            
            
            
              ],),
            )
              
           
            ]
            ),
        )
          
       );
      
       }
         else{
        return  Center(child: CircularProgressIndicator(),);
       }}
       ,)



       ])
     )
   ])
    );
  }
  
}