import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class api {



Future<dynamic>get({required String uri,@required String ?token})async{
Map<String,String>header={};

if(token!=null){header.addAll( {'Authorization':'Bearer $token'});}

http.Response respose =await http.get(Uri.parse(uri),headers:header );

if(respose.statusCode==200){

 return  jsonDecode(respose.body);

}
else{
  throw Exception('there is problem in ${respose.statusCode}');
}
}




Future <dynamic>post ({required String uri, @required dynamic body,@required String ?token})async{
  Map<String,String>header={};
if(token!=null){header.addAll( {'Authorization':'Bearer $token',  'Accept': 'application/json',
        'Content-Type': 'application/json; charset=UTF-8', });}

http.Response response=await  http.post(Uri.parse(uri),
body:body,
headers: header,
);
if(response.statusCode==200){
   Map<String,dynamic>data =jsonDecode(response.body);
    return data;}
    
    
    else{
       throw Exception('there is problem in ${response.statusCode}');
    }


}


Future <dynamic>put ({required String uri, @required dynamic body,@required String ?token})async{
  Map<String,String>header={
 
  };
if(token!=null){header.addAll( {
  'Authorization':'Bearer $token'});}

 http.Response response=await  http.put(Uri.parse(uri),
body:body,
headers: header,
);
if(response.statusCode==200){
    Map<String,dynamic>data =jsonDecode(response.body);
    return data;}
    else{
       throw Exception('there is problem in ${response.statusCode}');
    }


}

}