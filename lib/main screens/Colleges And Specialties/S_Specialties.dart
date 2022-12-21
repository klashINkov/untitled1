// ignore_for_file: camel_case_types, unused_local_variable, must_be_immutable, non_constant_identifier_names, use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, curly_braces_in_flow_control_structures, use_build_context_synchronously

import 'package:untitled1/main%20screens/Colleges%20And%20Specialties/Subject/S_Subjects.dart';
import 'package:flutter/material.dart';

import 'package:untitled1/main screens/Home Page.dart';

import 'package:untitled1/main%20screens/temp.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

// Start Of Specialties Class
class S_Specialties extends StatelessWidget
{

  var x = temp ( ) ;
  int num , _num = 0 ;
  bool isempty = false ;

  final String College_Name ;
  final List < String > College_Specialties_Or_College_Depts ;

  S_Specialties ( { required this . College_Name , required this . College_Specialties_Or_College_Depts , required this . num } ) ;

  // Start of build Widget
  @override
  Widget build ( BuildContext context )
  {

    _num = num ;

    return Scaffold
    (

      extendBodyBehindAppBar : true,

      appBar : AppBar
      (

        title : Text ( College_Name , style : TextStyle ( fontSize : 18 , color : Colors . white , fontWeight : FontWeight . bold ) ),

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

        decoration : BoxDecoration ( gradient : LinearGradient ( colors : [ Color ( 0xff780206 ) , Color ( 0xFF061161 ) ] ) ),

        child : Column
        (

          children :
          [

            // Start of Horizontal List View
            Stack
            (

              children :
              [

                // Start of Horizontal List View
                Container
                (

                  height : 255,
                  padding : EdgeInsets . only ( top : 80 ),

                  child : ListView . separated
                  (
                    scrollDirection : Axis . horizontal,
                    separatorBuilder : ( context , _ ) => SizedBox ( ),
                    itemCount : x . Items . length,
                    itemBuilder : ( context , index ) => Horizontal_List_View ( College_Name : x . Items [ index ] . College_Name , image : x . Items [ index ] . image , context : context )
                  )

                ),
                // End of Horizontal List View

                // Start Of Arrow Back
                x . Arrows (top : 115 , left : 0 , icon : Icons . arrow_back_ios_sharp ),
                // End Of Arrow Back

                // Start Of Arrow Forward
                x . Arrows (top : 115 , left : 330 , icon : Icons . arrow_forward_ios )
                // End Of Arrow Forward

              ]

            ),
            // End of Horizontal List View

            // Start of List View
            Stack
            (

              children :
              [

                // Start Of تخصصات الكلية Text
                Padding
                (

                  padding : EdgeInsets . only ( top : 30 ),

                  child : Center
                  (

                    child : Text ( _num != 2 ? "تخصصات الكلية" : "اقسام الكلية" , style : TextStyle ( fontSize : 25 , fontWeight : FontWeight . bold , color : Colors . white ) )

                  )

                ),
                // End Of تخصصات الكلية Text

                // STart Of List View
                Container
                (

                  margin : EdgeInsets . only ( left : 15 , right : 25 , top : 15 ),
                  height : 400,

                  decoration : BoxDecoration
                  (
                    border : Border . all ( color : Colors . blueAccent . shade700 , width : 10 ),
                    borderRadius : BorderRadius . circular ( 50 ),
                  ),

                  child : Padding
                  (

                    padding : EdgeInsets . only ( top : 50 , bottom : 15 ),

                    child : Column
                    (
                      mainAxisAlignment : MainAxisAlignment . center,
                      children :
                      [
                        List_View ( )
                      ]
                    )

                  )

                ),
                // End Of List View

                // Start Of Arrow Up
                x . Arrows (top : 40 , left : 342 , icon : Icons . keyboard_arrow_up ),
                // End Of Arrow Up

                // Start Of Arrow down
                x . Arrows (top : 300 , left : 342 , icon : Icons . keyboard_arrow_down )
                // End Of Arrow down

              ]

            )
            // End of List View

          ]

        )

      )

    );

  }
  // End of build Widget

  // Start of Horizontal List View Widget
  Widget Horizontal_List_View ( { required String College_Name , required String image , required BuildContext context } ) => InkWell
  (

    onTap : ( ) { Horizontal_List_View_On_Tap ( College_Name , context ) ; },

    child : Container
    (

      width : 150,

      decoration : BoxDecoration ( image : DecorationImage ( image : AssetImage ( image ) , fit : BoxFit . fill  ) ),

      child : Center
      (

        child : Padding
        (

          padding : EdgeInsets . only ( top : 65 , left : 15 , right : 15 ),

          child : Text ( College_Name , textAlign : TextAlign . center  , style : TextStyle ( color : Colors . white , fontWeight : FontWeight . bold ) )

        )

      )

    )

  );
  // End of Horizontal List View Widget

  // Start of List View Widget
  Widget List_View ( ) => Flexible
  (

    child : ListView . builder
    (

      shrinkWrap : true,
      padding : EdgeInsets . only ( top : 0 ),
      itemCount : College_Specialties_Or_College_Depts . length,

      itemBuilder : ( context , index )
      {

        String Specialty_Name_Or_Dept_Name = College_Specialties_Or_College_Depts [ index ] ;

        return ListTile
        (

          onTap : ( ) => List_View_On_Tap ( Specialty_Name_Or_Dept_Name , context ),

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

            child : Text ( Specialty_Name_Or_Dept_Name , textAlign : TextAlign . center , style : TextStyle ( fontSize : 16 , color : Colors . white , fontWeight : FontWeight . bold ) )

          )

        );

      }

    )

  );
  // End of List View Widget

  // Start of Horizontal List View Function
  void Horizontal_List_View_On_Tap ( String College_Name , BuildContext context )
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
  // End of Horizontal List View Function

  // Start of List View On Tap Function
  void List_View_On_Tap ( String Specialty_Name_Or_Dept_Name , BuildContext context ) async
  {

    String path = "" , array = "" , Doc = ""  ;

    if ( _num == 2 ) { path = "المدرسين" ; Doc = College_Name ; array = "مدرسين $Specialty_Name_Or_Dept_Name" ; }

    else { path = "/الكليات و التخصصات/$College_Name/$Specialty_Name_Or_Dept_Name" ; Doc = "وصف التخصص و اسماء المواد و بياناتها" ; array = "مواد التخصص" ; }

      final  varr = await FirebaseFirestore . instance . collection ( path ) .
      doc ( Doc ) . get ( ) . then ( ( value ) => ( value . data ( )! [ array ] . length == 0 ) ?
      isempty = true : isempty = false ) ;

      var varibel = await FirebaseFirestore . instance . collection ( path ) . doc ( Doc ) . get ( ) ;

      Navigator . push ( context , MaterialPageRoute ( builder : ( _ ) =>_num == 0 ?

      S_Subjects(Specialty_Name_Or_Dept_Name: Specialty_Name_Or_Dept_Name, College_Name: College_Name, Desc: varibel [ "وصف التخصص" ], subjects_Or_Doctors_Names: varibel [ array ], is_empty: isempty, num: _num) :

      S_Subjects(Specialty_Name_Or_Dept_Name: Specialty_Name_Or_Dept_Name, College_Name: College_Name, Desc: "", subjects_Or_Doctors_Names: varibel [ array ], is_empty: isempty, num: _num)) ) ;

  }
  // End of List View On Tap Function

}
// End Of Specialties Class