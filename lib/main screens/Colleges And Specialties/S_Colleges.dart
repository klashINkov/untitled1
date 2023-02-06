// Done

// ignore_for_file: camel_case_types, must_be_immutable, use_key_in_widget_constructors, file_names, prefer_const_constructors, non_constant_identifier_names, sort_child_properties_last, prefer_const_literals_to_create_immutables, curly_braces_in_flow_control_structures, avoid_print

import 'package:untitled1/main screens/Home Page.dart';

import 'package:untitled1/main screens/temp.dart';

import 'package:flutter/material.dart';

// Start Of Colleges Class
class S_Colleges extends StatelessWidget
{

  String where_did_you_come_from ;

  S_Colleges ( { required this . where_did_you_come_from } ) ;

  // Start Of build Widget
  @override
  Widget build ( BuildContext context )
  {

    double w = MediaQuery . of ( context ) . size . width , h = MediaQuery . of ( context ) . size . height , image_height = h / 3.6 ;

    return Scaffold
    (

      extendBodyBehindAppBar : true,

      appBar : where_did_you_come_from != "From a student request to view colleges" ?
      AppBar
      (

        title  : Text ( "الكليات" , style : TextStyle ( fontSize : 25 , color : Colors . white , fontWeight : FontWeight . bold ) ),
        backgroundColor : Colors . transparent , elevation : 0 , centerTitle : true,

        actions :
        [
          IconButton
          (
            onPressed : ( ) => Navigator . of ( context ) . pushAndRemoveUntil ( MaterialPageRoute ( builder : ( context ) => Home ( ) ) , ( route ) => false ),
            icon : Icon ( Icons . home , color : Colors . white , size : 40 )
          )
        ]

      ):
      AppBar
      (
        title  : Text ( "الكليات" , style : TextStyle ( fontSize : 25 , color : Colors . white , fontWeight : FontWeight . bold ) ),
        backgroundColor : Colors . transparent , elevation : 0 , centerTitle : true
      ),

      body : Container
      (
        width: temp . w,
        height: temp . h,

        padding : EdgeInsets . only ( top : h / 9 , left: w / 50  ),

        // decoration : temp . Box_Decoration (),
        decoration : BoxDecoration
        (
            gradient : LinearGradient
            (
                colors : [  Color ( 0xff1F1C2C ) , Color ( 0xFF928DAB ) , ] ,
                //   colors : [  Color ( 0xFF003973 ) , Color ( 0xffE5E5BE ) , ] ,
                //   colors : [  Color ( 0xff292E49 ) , Color ( 0xff536976 ) , Color ( 0xFFBBD2C5 ) , ] ,
                begin : Alignment . topCenter,
                end : Alignment . bottomCenter
            )
        ),

        child : Column
        (
          mainAxisAlignment : MainAxisAlignment . center,
          children :
          [

            Row
            (

              children :
               [

                  temp . Custom_Grid_View ( College_Name : temp . Items [ 0 ] . College_Name , image : temp . Items [ 0 ] . image , where_did_you_come_from : where_did_you_come_from , image_height : image_height , context : context ),

                  SizedBox ( width : w / 20 ),

                  temp . Custom_Grid_View ( College_Name : temp . Items [ 1 ] . College_Name , image : temp . Items [ 1 ] . image , where_did_you_come_from : where_did_you_come_from , image_height : image_height , context : context ),
              ]

            ),

            SizedBox ( height : h / 55 ),

            Row
            (

              children :
               [
                temp . Custom_Grid_View ( College_Name : temp . Items [ 2 ] . College_Name , image : temp . Items [ 2 ] . image , where_did_you_come_from : where_did_you_come_from , image_height : image_height , context : context ),

                SizedBox ( width : w / 20 ),

                temp . Custom_Grid_View ( College_Name : temp . Items [ 3 ] . College_Name , image : temp . Items [ 3 ] . image , where_did_you_come_from : where_did_you_come_from , image_height : image_height , context : context ),
              ]

            ),

            SizedBox ( height : h / 55 ),

            Row
           (

              children :
               [
                temp . Custom_Grid_View ( College_Name : temp . Items [ 4 ] . College_Name , image : temp . Items [ 4 ] . image , where_did_you_come_from : where_did_you_come_from , image_height : image_height , context : context ),

                SizedBox ( width : w / 20 ),

                temp . Custom_Grid_View ( College_Name : temp . Items [ 5 ] . College_Name , image : temp . Items [ 5 ] . image , where_did_you_come_from : where_did_you_come_from , image_height : image_height , context : context ),
              ]

            ),

          ]
        )
      )

    );
  }
  // En d Of build Widget

}
// End Of Colleges Class