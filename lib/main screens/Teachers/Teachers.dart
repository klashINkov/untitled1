// Done

// ignore_for_file: must_be_immutab, use_key_in_widget_constructorsle, use_key_in_widget_constructors, must_be_immutable, camel_types, prefer_const_constructors, avoid_unnecessary_containers, non_constant_identifier_names, prefer_const_literals_to_create_immutables, camel_case_types, file_names, prefer_typing_uninitialized_variables, unnecessary_null_comparison, curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';

import 'package:untitled1/main%20screens/temp.dart';

import 'package:firebase_auth/firebase_auth.dart';

// Start Of _Teachers class
class Teachers extends StatefulWidget
{

  String Image1_url , Image2_Url , Image1_text , Image2text ;
  Teachers ( { required this . Image1_url , required this . Image1_text , required this . Image2_Url , required this . Image2text } ) ;

  @override
  State < Teachers > createState ( ) => _Teachers ( ) ;

}

class _Teachers extends State < Teachers >
{

  bool  ? islog ;

  @override
  void initState ( )
  {

    super . initState ( ) ;

    var user = FirebaseAuth . instance . currentUser ;


    if ( user == null )
      islog = false ;

    else
      islog = true ;

  }

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

        child : Column
        (

          children :
          [

            temp . Pic ( context : context , image : widget . Image1_url , txt : widget . Image1_text , flag : islog!  ),

            temp . Pic ( context : context , image : widget . Image2_Url , txt : widget . Image2text , flag : islog!  ),

          ]

        )

      )

    );

  }

}
// End Of _Teachers class