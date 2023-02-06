
// ignore_for_file: use_key_in_widget_constructors

import 'package:untitled1/main screens/Home Page.dart';

import 'package:device_preview/device_preview.dart';

import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';

import 'firebase_options.dart';

void main() async
{

  WidgetsFlutterBinding . ensureInitialized ( ) ;
  await Firebase . initializeApp ( options : DefaultFirebaseOptions . currentPlatform ) ;
  runApp ( My ( ) ) ;

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
      builder : DevicePreview . appBuilder ,
      home : Home ()

    );

  }

}
// End Of My

