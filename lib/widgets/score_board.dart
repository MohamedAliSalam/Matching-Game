import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

Widget scoreBoard (String title, String info) {
  return Container(
    margin: EdgeInsets.all(26.0),
    padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 26.0),


    child: Column(children: [
      Text(
        title,
        style:
        TextStyle(
          fontSize: 22.0,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      SizedBox(
          height: 6.0
      ),

      Text(
        info,
        style: TextStyle(fontSize: 34.0, fontWeight: FontWeight.bold, color: Colors.white,),


      ),
    ]),
  );
}
