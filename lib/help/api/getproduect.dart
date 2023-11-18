

import 'package:projectt/help/api/api.dart';
import 'package:projectt/help/api/produect.dart';



class getallproudect {
Future <List<produect>>getallproudects()async{

List<dynamic> data= await api().get( uri:"https://fakestoreapi.com/products");
List<produect>p=[];
for(int i=0;i<data.length;i++){
p.add(produect.fromJson(data[i]));
}

return p;

}}