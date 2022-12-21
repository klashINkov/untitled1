// Done

// ignore_for_file: unused_element, file_names, use_key_in_widget_constructors, must_be_immutable, prefer_const_constructors, camel_case_types, non_constant_identifier_names, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import 'package:untitled1/main%20screens/temp.dart';

// Start Of Map Class
class Map extends StatelessWidget
{

  String What_Do_You_Wont ;
  Map ( { required this . What_Do_You_Wont } ) ;

  var x = temp ( ) ;
  final double maxScale = 4 ;
  final double minScale = 1 ;

  List < String >  Floor = [ "الطابق الاول" , "الطابق الثاني" , "الطابق الثالث" , "الطابق الرابع" ] ;

  // Start Of build Widget
  @override
  Widget build ( BuildContext context )
  {

    return Scaffold
    (

      extendBodyBehindAppBar : true,

      appBar : AppBar
      (
          title : Text
          (
            What_Do_You_Wont == "floor image" ?
            "مجمع القاعات الطابق الرابع" :
            What_Do_You_Wont == "building floors" ?
            "مجمع القاعات" : "",
            style : TextStyle ( fontSize : 25 )
          ),
          backgroundColor : Colors . transparent , elevation : 0 , centerTitle : true
      ),

      body : What_Do_You_Wont == "Map" ?
      Container
      (

        height : 684,
        width : 409,

        decoration : BoxDecoration ( image : DecorationImage ( image : AssetImage ( "pic/pic3.png" ) , fit : BoxFit . fill , repeat : ImageRepeat . noRepeat ) ),

        child : Stack
        (

          children :
          [

            // Start of مجمع القاعات
             x . TXT ( txt : "مجمع\nالقاعات" , size : 25 , quarterTurns : 0 , bottom : 0 , top : 50 , left : 25 , context : context ) ,
            // Start of مجمع القاعات

            // Start of محمع الرياضي
             x . TXT ( txt : "المجمع الرياضي" , size : 25 , quarterTurns : 1 , bottom : 215 , top : 0 , left : 10 , context : context ) ,
            // Start of محمع الرياضي

            // Start of عمادة شؤون الطلبة
             x . TXT ( txt : "عمادة شؤون\nالطلبة" , size : 18 , quarterTurns : 1, bottom : 130 , top : 0 , left : 10 , context : context ) ,
            // Start of عمادة شؤون الطلبة

            // Start of المشاغل الهندسيه
             x . TXT ( txt : "المشاغل\nالهندسيه" , size : 18 , quarterTurns : 0 , bottom : 0 , top : 30 , left : 290 , context : context ) ,
            // Start of المشاغل الهندسيه

            // Start of مركز الحاسوب
             x . TXT ( txt : "مركز\nالحاسوب" , size : 18 , quarterTurns : 0 , bottom : 0 , top : 155 , left : 70 , context : context ) ,
            // Start of مركز الحاسوب

            // Start of كلية الاعمال
             x . TXT ( txt : "كلية الاعمال" , size : 16 , quarterTurns : 1 , bottom : 210 , top : 0 , left : 245 , context : context ) ,
            // Start of كلية الاعمال

            // Start of القبول و التسحيل
             x . TXT ( txt : "القبول و التسحيل" , size : 16 , quarterTurns : 1 , bottom : 275 , top : 0 , left : 200 , context : context ) ,
            // Start of القبول و التسحيل

            // Start of عيادة الجامعة
             x . TXT ( txt : "عيادة\nالجامعة" , size : 18 , quarterTurns : 0 , bottom : 0 , top : 400 , left : 50 , context : context ) ,
            // Start of عيادة الجامعة

            // Start of كلية الهندسة
             x . TXT ( txt : "كلية الهندسة" , size : 18 , quarterTurns : 0 , bottom : 0 , top : 480 , left : 120 , context : context ) ,
            // Start of كلية الهندسة

            // Start of رئاسة الجامعة
             x . TXT ( txt : "رئاسة\nالجامعة" , size : 18 , quarterTurns : 1 , bottom : 270 , top : 0 , left : 350 , context : context ) ,
            // Start of رئاسة الجامعة

            // Start of كلية العلوم
             x . TXT ( txt : "كلية\nالعلوم" , size : 18 , quarterTurns : 1 , bottom : 95 , top : 0 , left : 545 , context : context ) ,
            // Start of كلية العلوم

            // Start of المالية
             x . TXT ( txt : "المالية" , size : 18 , quarterTurns : 1 , bottom : 220 , top : 0 , left : 390 , context : context )
            // Start of المالية

          ]

        )

      ) : What_Do_You_Wont == "building floors" ?
      Container
      (

        height : 683,
        width : 411,
        padding : EdgeInsets . only ( top : 70 , left : 10 , right : 10 , bottom: 10 ),
        decoration : BoxDecoration ( gradient : LinearGradient ( colors : [ Color ( 0xff780206 ) , Color ( 0xFF061161 ) ] ) ),

        child : Column
        (

          mainAxisAlignment : MainAxisAlignment . center,

          children :
          [

            Flexible
            (

              child : ListView . builder
              (

                shrinkWrap : true,
                padding : EdgeInsets . only ( top : 0 ),
                itemCount : Floor . length,

                itemBuilder : ( context , index )
                {

                  String floor = Floor [ index ] ;

                  return ListTile
                  (

                    onTap : ( ) => Navigator . push ( context , MaterialPageRoute ( builder : ( _ ) =>  Map ( What_Do_You_Wont : "floor image"  ) ) ) ,

                    title : Container
                    (

                      decoration : BoxDecoration
                      (
                        color : Colors . black,
                        border : Border . all ( color : Colors . blueAccent . shade700 , width : 10 ),
                        borderRadius : BorderRadius . circular ( 40 )
                      ),

                      margin : EdgeInsets . only ( bottom : 7 ),
                      padding : EdgeInsets . only ( top : 15 , bottom : 15 ),

                      child : Text ( floor , textAlign : TextAlign . center , style : TextStyle ( fontSize : 16 , color : Colors . white , fontWeight : FontWeight . bold ) )

                    )

                  );

                }

              )

            )

          ]

        )

      ) :
      Container
      (

        height: 683,
        width : 411,

        padding : EdgeInsets . only ( top : 70 , left : 10 , right : 10 , bottom : 10 ),

        decoration : BoxDecoration ( gradient :  LinearGradient ( colors : [ Color ( 0xff780206 ) , Color ( 0xFF061161 ) ] ) ),

        child : InteractiveViewer
        (

        minScale : minScale,
        maxScale : maxScale,

        child : Image ( image: AssetImage ( "pic/4.jpg" ) , fit: BoxFit . fill )

        )

      )

    );

  }
  // End Of build Widget

}
// End Of Map Class