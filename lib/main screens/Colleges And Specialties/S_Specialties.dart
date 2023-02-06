// ignore_for_file: camel_case_types, must_be_immutable, non_constant_identifier_names, use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, curly_braces_in_flow_control_structures, use_build_context_synchronously, file_names, avoid_print

import 'package:untitled1/main screens/Colleges And Specialties/Subject/S_Subjects.dart';

import 'package:untitled1/main screens/Home Page.dart';

import 'package:untitled1/main screens/temp.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

// Start Of Specialties Class
class S_Specialties extends StatelessWidget
{

  late bool Is_Empty ;
  late double w , h;
  String College_Name , where_did_you_come_from ;
  final List < String > College_Specialties_Or_College_Depts ;

  S_Specialties ( { required this . College_Name , required this . College_Specialties_Or_College_Depts , required this . where_did_you_come_from } ) ;

  // Start of build Widget
  @override
  Widget build ( BuildContext context )
  {
     w = MediaQuery . of (context) . size . width ;
     h = MediaQuery . of (context) . size . height;

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

        decoration : temp . Box_Decoration (),

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
                  padding : EdgeInsets . only ( top : 80 , left: 15 , right: 0 ),

                  child : ListView . separated
                  (
                    scrollDirection : Axis . horizontal,
                    separatorBuilder : ( context , _ ) => SizedBox (  ),
                    itemCount : temp . Items . length,
                    itemBuilder : ( context , index ) => Horizontal_List_View ( College_Name : temp . Items [ index ] . College_Name , image : temp . Items [ index ] . image , context : context )
                  )

                ),
                // End of Horizontal List View

                // Start Of Arrow Back
                temp . Arrows (top : 145 , left : 3 , icon : Icons . arrow_back_ios_sharp ),
                // End Of Arrow Back

                // Start Of Arrow Forward
                temp . Arrows (top : 145 , left :  w - 40 , icon : Icons . arrow_forward_ios )
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

                  padding : EdgeInsets . only ( top : 45 ),

                  child : Center
                  (

                    child : Text ( where_did_you_come_from != "From a student request to display teacher data" ? "تخصصات الكلية" : "اقسام الكلية" , style : TextStyle ( fontSize : 25 , fontWeight : FontWeight . bold , color : Colors . white ) )

                  )

                ),
                // End Of تخصصات الكلية Text

                // STart Of List View
                Container
                (

                  margin : EdgeInsets . only ( left : 15 , right : 25 , top : 30 ),
                  height : h-300,
                  width : w ,
                  decoration : BoxDecoration
                  (
                    border : Border . all ( color : Colors . blueAccent . shade700 , width : 10 ),
                    borderRadius : BorderRadius . circular ( 50 )
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
                temp . Arrows (top : 55 , left :  w - 70 , icon : Icons . keyboard_arrow_up ),
                // End Of Arrow Up

                // Start Of Arrow down
                temp . Arrows (top : h-360 , left :  w -70 , icon : Icons . keyboard_arrow_down )
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
      margin : EdgeInsets . only ( right : w / 12.5, ) ,
      width : 150,
      decoration : BoxDecoration ( image : DecorationImage ( image : AssetImage ( image ) , fit : BoxFit . fill  ) ),

      child : Center
      (

        child : Padding
        (

          padding : EdgeInsets . only ( top : 130 , left : 15 , right : 15 ),
          child : Text ( College_Name , textAlign : TextAlign . center  , style : TextStyle ( color : Colors . white70 , fontWeight : FontWeight . bold ) )

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
              border : Border . all ( color : Colors . blueAccent . shade700 , width : 5 ),
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
      late String source ;

    if ( College_Name ==  "كلية الهندسة" )
    {

      List < String > College_Specialties_Or_College_Depts = [ ] ;

      if ( where_did_you_come_from == "From a student request to view colleges" || where_did_you_come_from == "From a teacher's request to add a subject" )

              College_Specialties_Or_College_Depts = temp . College_SpecialtieS [ 0 ] . Colleges_SpecialtieS ;
        else
              College_Specialties_Or_College_Depts = temp . College_DeptS [ 0 ] . Colleges_Depts ;

        Navigator . of ( context ) . pop ( ) ;
        Navigator . push ( context , MaterialPageRoute ( builder : ( _ ) => S_Specialties ( College_Name : College_Name , College_Specialties_Or_College_Depts : College_Specialties_Or_College_Depts , where_did_you_come_from : where_did_you_come_from ) ) ) ;

    }

    if ( College_Name ==  "كلية العلوم" )
    {

      List < String > College_Specialties_Or_College_Depts = [ ] ;

      if ( where_did_you_come_from == "From a student request to view colleges" || where_did_you_come_from == "From a teacher's request to add a subject" )

            College_Specialties_Or_College_Depts = College_Specialties_Or_College_Depts = temp . College_SpecialtieS [ 1 ] .Colleges_SpecialtieS ;
      else
            College_Specialties_Or_College_Depts = College_Specialties_Or_College_Depts = temp . College_DeptS [ 1 ] . Colleges_Depts ;

      Navigator . of ( context ) . pop ( ) ;
      Navigator . push ( context , MaterialPageRoute ( builder : ( _ ) => S_Specialties ( College_Name : College_Name , College_Specialties_Or_College_Depts : College_Specialties_Or_College_Depts , where_did_you_come_from : where_did_you_come_from ) ) ) ;

    }

    if ( College_Name ==  "كلية تكنولوجيا المعلومات و الاتصالات" )
    {

      List < String > College_Specialties_Or_College_Depts = [ ] ;

      if ( where_did_you_come_from == "From a student request to view colleges" || where_did_you_come_from == "From a teacher's request to add a subject" )
          {
            College_Specialties_Or_College_Depts = College_Specialties_Or_College_Depts = temp . College_SpecialtieS [ 2 ].Colleges_SpecialtieS ;

             if (where_did_you_come_from == "From a student request to view colleges")
                  source = "من الضغط على زر الكليات و التخصصات في الشاشة الرئيسه //////////////// ثم الضغط على زر $College_Name في ال Horizontal List View" ;
            else
                  source = "من الضغط على زر اضافة مادة من قبل المدرس //////////////// ثم الضغط على زر $College_Name في ال Horizontal List View" ;

            print ( "where_did_you_come_from = $where_did_you_come_from ( $source )" ) ;
          }
      else
            College_Specialties_Or_College_Depts = College_Specialties_Or_College_Depts = temp . College_DeptS [ 2 ] . Colleges_Depts ;

      Navigator . of ( context ) . pop ( ) ;
      Navigator . push ( context , MaterialPageRoute ( builder : ( _ ) => S_Specialties ( College_Name : College_Name , College_Specialties_Or_College_Depts : College_Specialties_Or_College_Depts , where_did_you_come_from : where_did_you_come_from ) ) ) ;

    }

    if ( College_Name ==  "كلية الأعمال" )
    {

      List < String > College_Specialties_Or_College_Depts = [ ] ;

      if ( where_did_you_come_from == "From a student request to view colleges" || where_did_you_come_from == "From a teacher's request to add a subject" )

            College_Specialties_Or_College_Depts = College_Specialties_Or_College_Depts = temp . College_SpecialtieS [ 3 ].Colleges_SpecialtieS ;
      else
            College_Specialties_Or_College_Depts = College_Specialties_Or_College_Depts = temp . College_DeptS [ 3 ] . Colleges_Depts ;

      Navigator . of ( context ) . pop ( ) ;
      Navigator . push ( context , MaterialPageRoute ( builder : ( _ ) => S_Specialties ( College_Name : College_Name , College_Specialties_Or_College_Depts : College_Specialties_Or_College_Depts , where_did_you_come_from : where_did_you_come_from ) ) ) ;

    }

    if ( College_Name ==  "كلية الآداب" )
    {

      List < String > College_Specialties_Or_College_Depts = [ ] ;

      if ( where_did_you_come_from == "From a student request to view colleges" || where_did_you_come_from == "From a teacher's request to add a subject" )

            College_Specialties_Or_College_Depts = College_Specialties_Or_College_Depts = temp . College_SpecialtieS [ 4 ].Colleges_SpecialtieS ;
      else
            College_Specialties_Or_College_Depts = College_Specialties_Or_College_Depts = temp . College_DeptS [ 4 ] . Colleges_Depts ;

      Navigator . of ( context ) . pop ( ) ;
      Navigator . push ( context , MaterialPageRoute ( builder : ( _ ) => S_Specialties ( College_Name : College_Name , College_Specialties_Or_College_Depts : College_Specialties_Or_College_Depts , where_did_you_come_from : where_did_you_come_from ) ) ) ;

    }

    if ( College_Name ==  "كلية العلوم التربوية" )
    {

      List < String > College_Specialties_Or_College_Depts = [ ] ;

      if ( where_did_you_come_from == "From a student request to view colleges" || where_did_you_come_from == "From a teacher's request to add a subject" )

            College_Specialties_Or_College_Depts = College_Specialties_Or_College_Depts = temp . College_SpecialtieS [ 5 ].Colleges_SpecialtieS ;
      else
            College_Specialties_Or_College_Depts = College_Specialties_Or_College_Depts = temp . College_DeptS [ 5 ] . Colleges_Depts ;

      Navigator . of ( context ) . pop ( ) ;
      Navigator . push ( context , MaterialPageRoute ( builder : ( _ ) => S_Specialties ( College_Name : College_Name , College_Specialties_Or_College_Depts : College_Specialties_Or_College_Depts , where_did_you_come_from : where_did_you_come_from ) ) ) ;

    }

  }
  // End of Horizontal List View Function

  // Start of List View On Tap Function
  void List_View_On_Tap ( String Specialty_Name_Or_Dept_Name , BuildContext context ) async
  {

    late String path , array , Doc ;

    if ( where_did_you_come_from == "From a student request to display teacher data" ) { path = "المدرسين" ; Doc = College_Name ; array = "مدرسين $Specialty_Name_Or_Dept_Name" ; }

    else { path = "/الكليات و التخصصات/$College_Name/$Specialty_Name_Or_Dept_Name" ; Doc = "وصف التخصص و اسماء المواد و بياناتها" ; array = "مواد التخصص" ; }

    FirebaseFirestore . instance . collection ( path ) .doc ( Doc ) . get ( ) . then ( ( value ) => ( value . data ( ) ! [ array ] . length == 0 ) ? Is_Empty = true : Is_Empty = false ) ;

    DocumentSnapshot < Map < String , dynamic > > variable = await FirebaseFirestore . instance . collection ( path ) . doc ( Doc ) . get ( ) ;

    Navigator . push ( context , MaterialPageRoute ( builder : ( _ ) => where_did_you_come_from == "From a student request to view colleges" ?

      S_Subjects
      (
        Specialty_Name_Or_Dept_Name: Specialty_Name_Or_Dept_Name,
        where_did_you_come_from: where_did_you_come_from,
        subjects_Or_Doctors_Names: variable [ array ],
        desc: variable [ "وصف التخصص" ],
        College_Name: College_Name,
        Is_Empty: Is_Empty
      ) :

      S_Subjects
      (
        Specialty_Name_Or_Dept_Name: Specialty_Name_Or_Dept_Name,
        where_did_you_come_from: where_did_you_come_from,
        subjects_Or_Doctors_Names: variable [ array ],
        College_Name: College_Name,
        Is_Empty: Is_Empty
      )));

  }
  // End of List View On Tap Function

}
// End Of Specialties Class