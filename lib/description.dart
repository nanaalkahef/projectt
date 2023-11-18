import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:projectt/help/api/produect.dart';
import 'package:projectt/showproudect.dart';


class descriptionproduect extends StatelessWidget  {

   final produect p;
   descriptionproduect({super.key, required this.p});
 
  @override
  Widget build(BuildContext context) {

   return Scaffold(

appBar: AppBar(
  elevation: 0,
  backgroundColor: Colors.white,
  title: Text("Description",style: TextStyle(fontWeight: FontWeight.bold,fontSize:20),),
 leading : IconButton(onPressed: (() {
    Get.off(showproduect());
  }), icon: Icon(Icons.arrow_back,color:Colors.green[700],)),
),

  backgroundColor:Colors.green[700],
  body: Column(
    children: [
      
          Center(
            child: Container(height: 450,
            width: double.infinity,
            padding: EdgeInsets.only(top: 50,left: 50,right: 50),
              decoration: BoxDecoration(color:Colors.white,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40),bottomRight: Radius.circular(40)),
              ),
          
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Center(
                    child: Container(
                     // padding: EdgeInsets.symmetric(vertical:20,horizontal: 1),
                      width:250,height: 250,
                      child: Center(
                        child: Stack(
                                      alignment: Alignment.center,
                          children: [
                              Row(
                        children: [IconButton(onPressed: (){}, icon: Icon(Icons.add_shopping_cart)),
                        SizedBox(width: 10,),
                        IconButton(onPressed: (){}, icon: Icon(Icons.heart_broken_outlined)),
                  
                        
                        ],
                      ),
                            Container(
                              width: 300,
                              height: 300,
                            
                                    
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow:[BoxShadow(color:Colors.grey,blurRadius:3,spreadRadius: 5)],
                                shape: BoxShape.circle
                                
                              ),),
                                      
                          
                                Image.network(p.image ,height: 150,width: 150,fit:BoxFit.contain,),
                              ],),
                      )
                          ),
                  ),
                       SizedBox(height: 30,),
                        Text(p.category,style: TextStyle(fontSize:20,fontWeight: FontWeight.bold),),
                       SizedBox(height: 10,),
                       
                       Text(p.category,style: TextStyle(fontSize:15,color: Colors.grey,fontWeight: FontWeight.bold),),
                              SizedBox(height: 10,),
                              Text("Price ${p.price}",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,
                                color: Colors.green[700],)),
                          
                  
                     
                  
          
          
                      ],
                    ),
            ),
          ),
          Container(child: Column(
            children: [
              SizedBox(height: 5,),
               Row(
                 children: [
                   Text("Scientifice Name :  ",style: TextStyle(fontSize:16,color:Colors.white,fontWeight: FontWeight.bold),),
                   Text(p.category,style: TextStyle(color: Colors.black45,fontWeight: FontWeight.bold,fontSize: 15),)
                 ],
               ), SizedBox(height: 5,),
                  Row(
                 children: [
                   Text("The Manufacture Company :   ",style: TextStyle(fontSize:16,color:Colors.white,fontWeight: FontWeight.bold),),
                    Text(p.category,style: TextStyle(color: Colors.black45,fontWeight: FontWeight.bold,fontSize: 15),)
                 ],
               ), SizedBox(height: 5,),
                  Row(
                 children: [
                   Text("Quantity Available :   ",style: TextStyle(fontSize:16,color:Colors.white,fontWeight: FontWeight.bold),),
                    Text(p.category,style: TextStyle(color: Colors.black45,fontWeight: FontWeight.bold,fontSize: 15),)
                 ],
               ), SizedBox(height: 5,),
                  Row(
                 children: [
                   Text("Expiry Date  :   ",style: TextStyle(fontSize:16,color:Colors.white,fontWeight: FontWeight.bold),),
                    Text(p.category,style: TextStyle(color: Colors.black45,fontWeight: FontWeight.bold,fontSize: 15),)
                 ],
               ),SizedBox(height: 80,),
               
                         Row(crossAxisAlignment: CrossAxisAlignment.end,
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                    Container(color: Colors.white,width: 180,height: 50,
                      child: MaterialButton(onPressed: (){},child: Row(children: [Text("Add To Favoriet",),SizedBox(width:25,),
                      Icon(  Icons.favorite,size:25,color: Colors.red,)],),)),
                  

                   Container(color: Colors.white,width: 180,height: 50,
                      child: MaterialButton(onPressed: (){},child: Row(children: [Text("Add To Card"),SizedBox(width:30,),
                      Icon(  Icons.add_shopping_cart,size:25,color: Colors.green[700],)],),)),
                    
                  
                        
                        ],
                      ),
            ],
            
          )
          ,margin:EdgeInsets.only(top: 20,left: 10,right: 10),)

    ],
  ),



   );}}