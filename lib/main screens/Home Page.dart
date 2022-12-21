//Done

// ignore_for_file: must_be_immutab, prefer_const_constructorsle, prefer_const_constructors, use_key_in_widget_constructors, must_be_immutable, file_names

import 'package:flutter/material.dart';

import 'package:untitled1/main%20screens/temp.dart';

// Start Of Home Class
class Home extends StatelessWidget
{

  var x = temp ( ) ;

  // Start Of build Widget
  @override
  Widget build ( BuildContext context )
  {

    return Scaffold
    (

      extendBodyBehindAppBar : true,

      appBar : AppBar ( backgroundColor : Colors . transparent , elevation : 0 ),

      body : Container
      (

        width : 409,
        decoration : BoxDecoration ( image : DecorationImage ( image : AssetImage ( "pic/pic2.jpg" ) , fit : BoxFit . fill , repeat : ImageRepeat . noRepeat ) ),

        child : Padding
        (

          padding : EdgeInsets . only ( top : 40 , bottom : 10 ),

          child :  Column
          (

            children :
            [


              // Start Of الكليات و التخصصات
              x . sdfa ( text : "الكليات و التخصصات" , size : 25 , top : 80 , left : 80 , context : context ),
              // End Of  الكليات و التخصصات

              // Start Of  المدرسين
              x . sdfa ( text : "المدرسين" , size : 35 , top : 69 , left : 80 , context : context ),
              // End Of  المدرسين

              // Start Of  الخارطة
              x . sdfa ( text : "الخارطة" , size : 35 , top : 72 , left : 100 , context : context ),
              // End Of  الخارطة

              // Start Of  المفقودات
              x . sdfa ( text : "المفقودات" , size : 35 , top : 75 , left : 73, context : context  )
              // End Of  المفقودات

            ]

          )

        )

      )

    );

  }
  // End Of build Widget

}
// End Of Home Class