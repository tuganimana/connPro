import 'dart:convert';

import 'package:http/http.dart' as http ;
import 'package:shared_preferences/shared_preferences.dart';

class CallApi{
final String _url = 'http://telesbackend.herokuapp.com/';

postData(data, apiUrl) async{
  var fullurl = _url+apiUrl + await getToken();
  return await http.post(
   fullurl,
    body:json.encode(data),
    headers: _setHeaders()
      
  );
}

getData(apiUrl ) async{
  var fullUrl = _url +apiUrl + await getToken();
  return await http.get(
     fullUrl,
      headers: _setHeaders()

  );

}

_setHeaders()=>{
  'Content-type':'application/json',
  'Accept':'application/json',


};
 getToken() async{
   SharedPreferences localStorage = await SharedPreferences.getInstance();
   var token = localStorage.getString('token') ;

   return '?token=$token';
 }

 getUser() async{
   SharedPreferences localStorage = await SharedPreferences.getInstance();
   var abauser = localStorage.getString('user') ;

   return abauser;

 }
}