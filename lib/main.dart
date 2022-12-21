import 'package:flutter/material.dart';



// ignore: depend_on_referenced_packages
import 'package:firebase_core/firebase_core.dart';
import 'package:untitled1/main%20screens/Home%20Page.dart';

void main ( ) async
{

  WidgetsFlutterBinding . ensureInitialized ( ) ;
  await Firebase . initializeApp ( ) ;
  runApp ( My ( ) );

}

// Start Of My
class My extends StatelessWidget
{

  @override
  Widget build ( BuildContext context )
  {

    return MaterialApp
    (

      debugShowCheckedModeBanner : false,

      title : "Ershad",

      home : Home ()

    );

  }

}
// End Of My

