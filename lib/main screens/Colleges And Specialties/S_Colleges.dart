// Done

// ignore_for_file: camel_case_types, must_be_immutable, use_key_in_widget_constructors, file_names, prefer_const_constructors, non_constant_identifier_names, sort_child_properties_last, prefer_const_literals_to_create_immutables, curly_braces_in_flow_control_structures

import 'package:untitled1/main screens/Colleges And Specialties/S_Specialties.dart';

import 'package:untitled1/main screens/Home Page.dart';

import 'package:untitled1/main screens/temp.dart';

import 'package:flutter/material.dart';

// Start Of Colleges Class
class S_Colleges extends StatelessWidget
{

  int num ;

  var x = temp ( ) ;

  S_Colleges ( { required this . num } ) ;

  // Start Of build Widget
  @override
  Widget build ( BuildContext context )
  {
    return Scaffold
    (

      extendBodyBehindAppBar : true,

      appBar : num != 0 ?
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
        padding : EdgeInsets . only ( right : 5 , left : 5 ),
        decoration : BoxDecoration ( gradient : LinearGradient ( colors : [ Color ( 0xff780206 ) , Color ( 0xFF061161 ) ] ) ),
        child : Grid_View ( )
      )

    );
  }
  // End Of build Widget

  // Start Of Grid View Widget
  Widget Grid_View ( ) => GridView . builder
  (

    gridDelegate : SliverGridDelegateWithFixedCrossAxisCount ( crossAxisCount : 2 ),
    itemCount : x . Items . length,

    itemBuilder : ( context , index )
    {

      var item = x . Items [ index ] ;

      return GridTile
      (

        child : InkWell
        (
          onTap : ( ) { Grid_View_On_Tap ( item . College_Name , context ) ; },
          child : Image ( image : AssetImage ( item . image ) , fit : BoxFit . fill )
        ),

        footer : Container
        (
          padding : EdgeInsets . only ( left : 15 , right : 15 , bottom : 25 ),
          child : Text ( item . College_Name , textAlign : TextAlign . center , style : TextStyle ( fontWeight : FontWeight . bold , fontSize : 14 , color : Colors . white ) )
        )

      );

    }

  );
  // End Of Grid View Widget

  // Start of Grid View On Tap Function
  void Grid_View_On_Tap ( String College_Name , BuildContext context )
  {

    if ( College_Name ==  "كلية الهندسة" )
    {

      List < String > College_Specialties_Or_College_Depts = [ ] ;

      if ( num == 0 || num == 1 )
          College_Specialties_Or_College_Depts = x . College_SpecialtieS [ 0 ] .Colleges_SpecialtieS ;
      else
          College_Specialties_Or_College_Depts = x . College_DeptS [ 0 ] . Colleges_Depts ;

          Navigator . push ( context , MaterialPageRoute ( builder : ( _ ) => S_Specialties ( College_Name : College_Name , College_Specialties_Or_College_Depts : College_Specialties_Or_College_Depts , num : num ) ) ) ;

    }

    if ( College_Name ==  "كلية العلوم" )
    {

      List < String > College_Specialties_Or_College_Depts = [ ] ;

      if ( num == 0 || num == 1 )
          College_Specialties_Or_College_Depts = College_Specialties_Or_College_Depts = x . College_SpecialtieS [ 1 ] .Colleges_SpecialtieS ;
      else
          College_Specialties_Or_College_Depts = College_Specialties_Or_College_Depts = x . College_DeptS [ 1 ] . Colleges_Depts ;

          Navigator . push ( context , MaterialPageRoute ( builder : ( _ ) => S_Specialties ( College_Name : College_Name , College_Specialties_Or_College_Depts : College_Specialties_Or_College_Depts , num : num ) ) ) ;

    }

    if ( College_Name ==  "كلية تكنولوجيا المعلومات و الاتصالات" )
    {

      List < String > College_Specialties_Or_College_Depts = [ ] ;

      if ( num == 0 || num == 1 )
          College_Specialties_Or_College_Depts = College_Specialties_Or_College_Depts = x . College_SpecialtieS [ 2 ].Colleges_SpecialtieS ;

      else
        College_Specialties_Or_College_Depts = College_Specialties_Or_College_Depts = x . College_DeptS [ 2 ] . Colleges_Depts ;

        Navigator . push ( context , MaterialPageRoute ( builder : ( _ ) => S_Specialties ( College_Name : College_Name , College_Specialties_Or_College_Depts : College_Specialties_Or_College_Depts , num : num ) ) ) ;

    }

    if ( College_Name ==  "كلية الأعمال" )
    {

      List < String > College_Specialties_Or_College_Depts = [ ] ;

      if ( num == 0 || num == 1 )
        College_Specialties_Or_College_Depts = College_Specialties_Or_College_Depts = x . College_SpecialtieS [ 3 ].Colleges_SpecialtieS ;
      else
        College_Specialties_Or_College_Depts = College_Specialties_Or_College_Depts = x . College_DeptS [ 3 ] . Colleges_Depts ;

        Navigator . push ( context , MaterialPageRoute ( builder : ( _ ) => S_Specialties ( College_Name : College_Name , College_Specialties_Or_College_Depts : College_Specialties_Or_College_Depts , num : num ) ) ) ;

    }

    if ( College_Name ==  "كلية الآداب" )
    {

      List < String > College_Specialties_Or_College_Depts = [ ] ;

      if ( num == 0 || num == 1 )
        College_Specialties_Or_College_Depts = College_Specialties_Or_College_Depts = x . College_SpecialtieS [ 4 ].Colleges_SpecialtieS ;
      else
        College_Specialties_Or_College_Depts = College_Specialties_Or_College_Depts = x . College_DeptS [ 4 ] . Colleges_Depts ;

        Navigator . push ( context , MaterialPageRoute ( builder : ( _ ) => S_Specialties ( College_Name : College_Name , College_Specialties_Or_College_Depts : College_Specialties_Or_College_Depts , num : num ) ) ) ;

    }

    if ( College_Name ==  "كلية العلوم التربوية" )
    {

      List < String > College_Specialties_Or_College_Depts = [ ] ;

      if ( num == 0 || num == 1 )
        College_Specialties_Or_College_Depts = College_Specialties_Or_College_Depts = x . College_SpecialtieS [ 5 ].Colleges_SpecialtieS ;
      else
        College_Specialties_Or_College_Depts = College_Specialties_Or_College_Depts = x . College_DeptS [ 5 ] . Colleges_Depts ;

        Navigator . push ( context , MaterialPageRoute ( builder : ( _ ) => S_Specialties ( College_Name : College_Name , College_Specialties_Or_College_Depts : College_Specialties_Or_College_Depts , num : num ) ) ) ;

    }

  }
  // End of Grid View On Tap Function

}
// End Of Colleges Class