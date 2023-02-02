//Done

// ignore_for_file: must_be_immutab, prefer_const_constructorsle, prefer_const_constructors, use_key_in_widget_constructors, must_be_immutable, file_names

import 'package:flutter/material.dart';

import 'package:untitled1/main%20screens/temp.dart';

// Start Of Home Class
class Home extends StatelessWidget
{

  // Start Of build Widget
  @override
  Widget build ( BuildContext context )
  {

    return Scaffold
    (

      extendBodyBehindAppBar: false,

      body : Container
      (

        width : 409,
        decoration : BoxDecoration ( image : DecorationImage ( image : AssetImage ( "pic/pic2.jpg" ) , fit : BoxFit . fill , repeat : ImageRepeat . noRepeat ) ),

        child : Column
        (

          mainAxisAlignment: MainAxisAlignment.center,

          children :
          [


            // Start Of الكليات و التخصصات
            temp . sdfa ( text : "الكليات و التخصصات" , context : context ),
            // End Of  الكليات و التخصصات

            // Start Of  المدرسين
            temp . sdfa ( text : "المدرسين" , context : context ),
            // End Of  المدرسين

            // Start Of  الخارطة
            temp . sdfa ( text : "الخارطة" , context : context ),
            // End Of  الخارطة

            // Start Of  المفقودات
            temp . sdfa ( text : "المفقودات" , context : context  )
            // End Of  المفقودات

          ]

        )

      )

    );

  }
  // End Of build Widget

}
// End Of Home Class