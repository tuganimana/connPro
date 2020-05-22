import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:kiboo/api/api.dart';
import 'package:dio/dio.dart';
import 'package:kiboo/register.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kiboo ',
      theme: ThemeData(

        primarySwatch: Colors.blue,

      ),
      home: MyHomePage(title: 'Conn Pro'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);



  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  List data;
  @override
 void initState(){
   super.initState();
   this.getData();// fetching data from  database
 }


 final String url="http://telesbackend.herokuapp.com/user/professional";
  Future<String> getData() async {
    final token =await getToken();
    var response = await http.get(
        Uri.encodeFull(url)
//        headers: {HttpHeaders.authorizationHeader:"JWT $token"
//        }
    );
//    print("my token is:$token ");
    this.setState(() {
      data = jsonDecode(response.body);
    });
    print(data);


    return "Success!";
  }

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(

        title:FlutterLogo(
          colors: Colors.green,
          size:26.0
        ),
        elevation: 0.0 ,//idufasha gushyiraho background,
        centerTitle: true,
        backgroundColor: Colors.white70,
        leading:IconButton(

          icon: Icon(Icons.supervised_user_circle,
          color: Colors.grey,),
        ),
        actions: <Widget>[
          IconButton(
            icon:Icon(Icons.menu),
            color:Colors.lightBlue
          )
        ],
      ),
      body: ListView(
        shrinkWrap: true, //allow shrink when it is needed
        children: <Widget>[
          Stack(
            children: <Widget>[
               Container(
                 alignment: Alignment(0.0, -0.40),
                 height: 100.0,
                 color: Colors.white70,
                 child: Text('Get started',
                 style: TextStyle(
                   fontFamily: 'Montserrat',
                   fontSize: 20.0
                 ),),

               ),
//              hano harajya container ijyaho ibintu dushaka kwerekana- aho aba professional bangana
            Container(
              margin: EdgeInsets.fromLTRB(25.0, 90.0, 25.0, 0.0),
//              dushyireho uko box izakuba imeze - na shadow
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0),
//                dushyireho shadow
                boxShadow:[
                  BoxShadow(
                    blurRadius: 2.0,
                    color: Colors.grey
                  )
                ]
              ),
       child: Row(
         crossAxisAlignment:CrossAxisAlignment.center,
         children: <Widget>[
           Stack(
             children: <Widget>[
              Container(
                
                padding: EdgeInsets.fromLTRB(25.0,25.0, 5.0, 5.0),
                child: Text(
                  'Professional',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12.0,
                    fontFamily:'Montserrat',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
               Container(

                 padding: EdgeInsets.fromLTRB(25.0,45.0, 5.0, 25.0),
                 child: Text(
                   '1000',
                   style: TextStyle(
                     color: Colors.grey,
                     fontSize: 30.0,
                     fontFamily:'Montserrat',
                     fontWeight: FontWeight.bold,
                   ),
                 ),
               )
             ],
           ),
           SizedBox(width: 100.0,),
           Container(
             height: 50.0,
             width: 125.0,
             decoration: BoxDecoration(
               color: Colors.blueAccent[100].withOpacity(0.7),
               borderRadius: BorderRadius.circular(12.0)
             ),
             child: Center(
               
               child: FlatButton(
                 child: Text(
                   'Apply now',
                   style: TextStyle(
                     fontWeight: FontWeight.bold,
                     fontSize: 15.0,
                     fontFamily: 'Quicksand',


                   ),

                 ),
                 onPressed:() {
                   Navigator.push(
                       context, MaterialPageRoute(builder: (context) {
                     return Register();
                   }
                   ));

                 }
               ),
             ),
           )
         ],
       ),
            )
            ],
          ),

//          agace ko kw applying karangiriye aha

        SizedBox(height: 30.0,),
          Container(
            padding: EdgeInsets.only(left:25.0,right: 25.0),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Recent Conn Pro',
                  style: TextStyle(fontFamily: 'Montserrat',
                  fontSize: 12.0,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold),
                ),
                Text(
                  'DOMAINS',
                  style: TextStyle(fontFamily: 'Montserrat',
                      fontSize: 15.0,
                       color: Colors.blueAccent[200],
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
SizedBox(height: 20.0,),
//          ======================Adding Professional Account
//          kugira habeho grid - turakoresh widget ya Gridview
        GridView.count(crossAxisCount: 2,
          crossAxisSpacing: 2.0,
        shrinkWrap: true,
        mainAxisSpacing: 4.0,
//        duhamagare ya widget
        children: data.map((prof) =>
            _buildCard(prof['firstname'].toString(),prof['experience'].toString(), prof['profile'].toString(), 'Django- MERN stack','', 1,)
        ).toList()
        )
        ],
      )
    );
  }

//  dushyire wiget iribufate aba professionals
 Widget _buildCard(String names, String domains,String image,String status, String experience,int cardIndex){
    return Card(
//      ize kuza iri rounded
      shape: RoundedRectangleBorder(
        borderRadius:BorderRadius.circular(11.0),


      ),
      elevation: 7.0,
      child: Column(
         mainAxisSize: MainAxisSize.min,
        children: <Widget>[

          Stack(
            children: <Widget>[
              Container(
                height: 120.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white,
                  image: DecorationImage(
                    image: NetworkImage("http://telesbackend.herokuapp.com/${image.substring(8)}"),


                  )
                ),
              ),
              SizedBox(height: 3.0,),
             Container(
               margin: EdgeInsets.fromLTRB(0.0, 120.0, 0.0, 0.0),
               child: Center(

                 child:Text(names,

                   style: TextStyle(fontWeight:FontWeight.bold,fontFamily: 'Montserrat',fontSize: 14.0,color: Colors.grey),

                 ),
               ),
             ),

      Container(
        margin: EdgeInsets.fromLTRB(0.0, 150, 0.0, 5.0),
      child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[


        Container(

            child: Flexible(
              child: Center(
                child: Text(
                  domains,
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    fontSize: 12.0,

                  ),
                ),
              ),
            ),
          ),

        ],
      ),
      ),
      SizedBox(height: 10.0,),
             Container(
               margin: EdgeInsets.fromLTRB(40.0, 167.0, 0.0, 0.0),

               width:100.0,
               decoration: BoxDecoration(
                   color:Colors.teal[700],
                   borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10.0),
                       bottomRight: Radius.circular(10.0)
                   )
               ),
               child: Center(
                 child: Text(
                   'Talkee',

                   style: TextStyle(fontSize: 20.0,fontFamily:'Montserrat',fontWeight: FontWeight.bold,color: Colors.white),
                 ),
               ),
             )

            ],
          )
        ],
      ),
      margin: cardIndex.isEven ?EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 10.0): EdgeInsets.fromLTRB(25.0, 0.0, 5.0, 10.0),
    );
 }
}



_setHeaders()=>{
  'Content-type':'application/json',
  'Accept':'application/json',


};

getToken() async{
  SharedPreferences kubika = await SharedPreferences.getInstance();
  var token = kubika.getString('token') ;

  return '$token';
}