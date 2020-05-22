import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';



class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
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
      body:ListView(
        children: <Widget>[
          Stack(
      children: <Widget>[
          Container(
          alignment: Alignment(0.0, -0.40),
      height: 100.0,
      color: Colors.white70,
      child: Text('Create Profile',
        style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 20.0
        ),),

    ),
        SizedBox(height: 30.0,),
        Container(
          margin: EdgeInsets.fromLTRB(80.0, 250, 10.0, 0.0),
          child: _signInButton(),
        )


    ]
          )
        ],
      )
    );
  }
}

//login with

Widget _signInButton() {
  return OutlineButton(
    splashColor: Colors.grey,
    onPressed: () {},
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
    highlightElevation: 0,
    borderSide: BorderSide(color: Colors.grey),
    child: Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image(image: AssetImage("images/google_logo.png"), height: 35.0),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              'Sign in with Google',
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey,
              ),
            ),
          )
        ],
      ),
    ),
  );
}
