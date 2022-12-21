// ignore_for_file: camel_case_types, must_be_immutable, deprecated_member_use, non_constant_identifier_names, prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:untitled1/main%20screens/Home%20Page.dart';
import 'package:untitled1/main%20screens/temp.dart';

// Start Of Personal_Lost Class
class Personal_Lost extends StatelessWidget
{

  var x = temp ( ) ;

  // Start Of Build Widget
  @override
  Widget build ( BuildContext context )
  {

    return Scaffold
    (

      extendBodyBehindAppBar : true,

      appBar : AppBar
      (
        title  : Text ( "المفقودات" , style : TextStyle ( fontSize : 42 , color : Colors . white , fontWeight : FontWeight . bold ) ),
        backgroundColor : Colors . transparent , elevation : 0 , centerTitle : true
      ),

      body : Container
      (

        decoration : BoxDecoration ( gradient : LinearGradient ( colors : [ Color ( 0xff780206 ) , Color ( 0xFF061161 ) ] ) ),

        padding : EdgeInsets . only ( top : 20 , left : 15 , right : 15 ),

        child : Stack
        (

          children :
          [

            StreamBuilder < List < Post > >
            (
              stream : get_post ( ),
              builder : ( context , snapshot )
              {
                if ( snapshot . hasData )
                  {
                    final post = snapshot . data! ;
                    return Flexible
                    (
                      child : ListView
                      (
                        shrinkWrap : true,
                        children : post . map ( Post_Text ) . toList ( )
                      )
                    );
                  }

                else
                    return SizedBox ( ) ;
              }
            ),

            // Start Of Add subject Button
            Padding
            (
              padding : EdgeInsets . only ( top : 590 ),
              child : Center
              (
                child : FloatingActionButton
                (
                  backgroundColor : Colors . blueAccent . shade700,
                  onPressed : ( ) => Navigator . push ( context , MaterialPageRoute( builder : ( _ ) => ADD_Post ( ) ) ),
                  child : Icon ( Icons . add )

                )
              )
            )
            // End Of Add subject Button
          ]
        )
      )
    );

  }
  // End Of Build Widget

  Stream < List < Post > > get_post ( ) => FirebaseFirestore . instance . collection ( "المفقودات" ) .snapshots ( ) . map ( ( event ) => event . docs . map ( ( e ) => Post . fromjson ( e . data ( ) ) ) . toList ( ) ) ;

  Widget Post_Text ( Post post ) => Container
  (

    width : 300,
    height : 300,

    decoration : BoxDecoration
    (
      color : Colors . black,
      border : Border . all ( color : Colors . blueAccent . shade700 , width : 5 ),
      borderRadius : BorderRadius . circular ( 40 )
    ),

    margin : EdgeInsets . only ( bottom : 20 ),
    padding : EdgeInsets . all ( 15 ),

    child : Center
    (

      child : SingleChildScrollView ( child : Text ( post . Post_Text , textAlign : TextAlign . center , style : TextStyle ( fontSize : 20 , color : Colors . white , fontWeight : FontWeight . bold ) ) )

    )

  );


}
// End Of Personal_Lost Class

class ADD_Post extends StatefulWidget { @override State < ADD_Post > createState ( ) => _ADD_Post ( ) ; }

// Start Of _ADD_Post Cl
class _ADD_Post extends State < ADD_Post >
{

  final text = TextEditingController ( ) ;

  @override
  void initState ( )
  {
    super . initState ( ) ;
    text  . addListener ( ( ) => setState ( ( ) { } ) ) ;
  }

  @override
  Widget build(BuildContext context)
  {

    return Scaffold
      (

        extendBodyBehindAppBar : true,

        appBar : AppBar
        (

          title : Text ( "اضافة منشور" , style : TextStyle ( fontSize : 35 ) ),
          backgroundColor : Colors . transparent , elevation : 0 , centerTitle : true,
          actions :
          [

            IconButton
            (

              onPressed : ( ) => Navigator . of ( context ) . pushAndRemoveUntil ( MaterialPageRoute ( builder : ( context ) => Home ( ) ) , ( route ) => false ),

              icon : Icon ( Icons . home , color : Colors . white , size : 40 )

            )

          ]

        ),

        body : Container
        (

          height: 683,

          padding : EdgeInsets . only ( top : 5 , left : 15 , right : 15 ),

          decoration : BoxDecoration ( gradient :  LinearGradient ( colors : [ Color ( 0xff780206 ) , Color ( 0xFF061161 ) ] ) ),

          child : ListView
          (

            children :
            [

              TextFormField
              (

                controller : text,
                keyboardType : TextInputType . text,
                textInputAction : TextInputAction . newline ,
                style : TextStyle ( fontSize : 25 , color : Colors . white ),
                textAlign : TextAlign . center,
                cursorColor : Colors . white,
                cursorWidth : 5,
                maxLines : 15,

                decoration : InputDecoration
                (

                  filled : true,
                  fillColor : Colors . black,
                  enabledBorder : OutlineInputBorder
                  (
                    borderRadius : BorderRadius . circular ( 50 ),
                    borderSide : BorderSide ( color : Colors . blueAccent . shade700 , width : 5 )
                  ),
                  focusedBorder : OutlineInputBorder
                  (
                    borderRadius : BorderRadius . circular ( 50 ),
                    borderSide : BorderSide ( color : Colors . blueAccent . shade700 , width : 5 )
                  )

                )

              ),

              SizedBox ( height : 5 ) ,

              Container
              (

                height : 80,
                width : 300,
                margin : EdgeInsets . only ( top : 20 ),

                decoration : BoxDecoration
                (
                  color : Colors . black,
                  border : Border . all ( color : Colors . blueAccent . shade700 , width : 5 ),
                  borderRadius : BorderRadius . circular ( 50 )
                ),

                child : FloatingActionButton
                (
                  backgroundColor : Colors.transparent,
                  onPressed : ()
                  {   if ( text . text != "" )
                  {
                    Add_post ( text . text ) ;
                    Navigator . pushReplacement ( context , MaterialPageRoute ( builder : ( _ ) => Personal_Lost ( ) ) ) ;
                  }
                  },
                  child : Text ( "نشر" , style : TextStyle ( color : Colors . white , fontSize : 35 ) )
                )

              )

            ]

          )

        )

    );

  }

  Add_post ( String Post_Text  ) async
  {
    final docUser = FirebaseFirestore . instance . collection ( "المفقودات" ) . doc (  ) ;
    final post = Post ( Post_Text : Post_Text ) ;
    final json = post . tojson ( );
    await docUser . set ( json ) ;
  }

}
// End Of Personal_Lost Class

class Post
{

  final String Post_Text ;

  Post ( { required this . Post_Text } ) ;

  Map < String , dynamic > tojson ( ) => { "Post_Text" : Post_Text  } ;

  static Post fromjson ( Map < String , dynamic > json ) => Post ( Post_Text : json [ "Post_Text" ]  ) ;

}