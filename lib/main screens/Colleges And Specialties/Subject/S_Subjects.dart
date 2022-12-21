// Done

// ignore_for_file: file_names, camel_case_types, must_be_immutable, non_constant_identifier_names, use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously

import 'package:untitled1/main%20screens/Teachers/Add_Subjects.dart';
import 'package:flutter/material.dart';

import 'package:untitled1/main screens/Home Page.dart';

import 'package:untitled1/main screens/Colleges And Specialties/Subject/S_Subject.dart';

import 'package:untitled1/main%20screens/Teachers/C_Doctor_data_view.dart';

import 'package:untitled1/main%20screens/temp.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

// Start Of Subjects Class
class S_Subjects extends StatelessWidget
{

  var x = temp ( ) ;
  String Specialty_Name_Or_Dept_Name , College_Name , Desc ;
  bool is_empty ;
  int num ;
  List < dynamic > subjects_Or_Doctors_Names ;

  S_Subjects ( { required this . Specialty_Name_Or_Dept_Name , required this . College_Name , required this . Desc , required this . subjects_Or_Doctors_Names , required this . is_empty , required this . num } ) ;

  // Start of build Widget
  @override
  Widget build ( BuildContext context )
  {

    return Scaffold
    (

      extendBodyBehindAppBar : true,

      appBar : AppBar
      (

        title  : Padding
        (

          padding : EdgeInsets . only ( top : 10 ),
          child : Text ( Specialty_Name_Or_Dept_Name , maxLines : 2 , textAlign : TextAlign . center , style : TextStyle ( fontSize : 18 , color : Colors . white , fontWeight : FontWeight . bold ) )

        ),

        backgroundColor : Colors . transparent,
        elevation : 0,
        centerTitle : true,

        actions :
        [

          IconButton
          (

            onPressed : ( ) { Navigator . of ( context ) . pushAndRemoveUntil ( MaterialPageRoute ( builder : ( context ) => Home ( ) ) , ( route ) => false ) ; },

            icon : Icon ( Icons . home , color : Colors . white , size : 40 )

          )

        ]

    ),

      body : Container
      (

        height : 683,

        decoration : BoxDecoration ( gradient : LinearGradient ( colors : [ Color ( 0xff780206 ) , Color ( 0xFF061161 ) ] ) ),

        child : num == 2 && is_empty ?
        Center
        (

          child : Padding
          (

            padding : EdgeInsets . symmetric ( horizontal : 20 ),

            child : Text
            (

              "لم يقم احد مدرسين هذا التخصص باضافة بياناته بعد",
              textAlign : TextAlign . center,
              style : TextStyle
              (

                fontWeight : FontWeight . bold ,
                color : Colors . white,
                fontSize : 25

              )

            )

          )

        ):

        ListView
        (

          children :
          [

            Column
            (

              children :
              [

                // Start Of Description
                num == 0 ?
                Stack
                (

                  children :
                  [

                    // Start Of Description Text
                    Container
                    (

                      height : is_empty ? 360 : 400,
                      margin : EdgeInsets . only ( top : 10 , left : 15 , right : 25 ),

                      decoration : BoxDecoration
                      (

                        border : Border . all ( color : Colors . blueAccent . shade700 , width : 10 ),
                        borderRadius : BorderRadius . circular ( 50 ),

                      ),

                      child : Padding
                      (

                        padding : EdgeInsets . only ( top : 5 , left : 22 , right : 22 , bottom : 8 ),

                        child : SingleChildScrollView
                        (

                          child : Column
                          (

                            children :
                            [

                              // Start Of نبذه عن التخصص
                              Text ( "نبذة عن التخصص" , textAlign : TextAlign . center , style : TextStyle ( fontSize : 25 , fontWeight : FontWeight . bold , color : Colors . white ) ),
                              // End Of نبذه عن التخصص

                              // Start Of Description Text
                              Text ( Desc , textAlign : TextAlign . center , style : TextStyle ( fontSize : 20 , fontWeight : FontWeight . bold , color : Colors . white ) )
                              // End Of Description Text

                            ]

                          )

                        )

                      )

                    ),
                    // End Of Description Text

                    // Start Of Arrow Up
                    x . Arrows ( top : 30 , left : 341 , icon : Icons . keyboard_arrow_up ),
                    // End Of Arrow Up

                    // Start Of Arrow down
                    x . Arrows (top : is_empty ? 270 : 310 , left : 341 , icon : Icons . keyboard_arrow_down )
                    // End Of Arrow down

                  ]

                ) :
                SizedBox ( ) ,
                // End Of Description

                // STart Of List View
                Stack
                (

                  children :
                  [

                    // Start Of مواد التخصص او مدرسين القسم
                    Padding
                    (

                      padding : EdgeInsets . only ( top : num == 1 ? 30 : num == 2 ? 40 : 50 ),

                      child : Center
                      (

                        child : Text ( num == 2 ? "مدرسين القسم" : "مواد التخصص" , style : TextStyle ( fontSize : 25 , fontWeight : FontWeight . bold , color : Colors . white ) )

                      )

                    ),
                    // End Of مواد التخصص او مدرسين القسم

                    // STart Of List View
                    Container
                    (

                      height : is_empty && num == 0  ? 200 : 580,
                      width : 400 ,

                      margin : EdgeInsets . only ( top : num == 0 ? 25 : 15 , left : 15 , right : 25 ),

                      decoration : BoxDecoration
                      (

                        border : Border . all ( color : Colors . blueAccent . shade700 , width : 10 ),
                        borderRadius : BorderRadius . circular ( 50 ),

                      ),

                      child : Padding
                      (

                        padding : EdgeInsets . only ( top : num == 1 ? 50 : 65 , bottom : 10 ),

                        child :  is_empty && num == 0 ?
                        Center
                        (

                          child : Padding
                          (

                            padding : EdgeInsets . symmetric ( horizontal : num == 1 ? 20 : 0 ),
                            child : Text
                            (
                              "لم يقم احد مدرسين هذا التخصص باضافة اي بيانات لاي مادة بعد",
                              textAlign : TextAlign . center,
                              style : TextStyle
                              (

                                fontWeight : FontWeight . bold,
                                color : Colors . white,
                                fontSize : 25

                              )

                            )

                          )

                        ) :

                        Column
                        (

                          mainAxisAlignment : MainAxisAlignment . center,

                          children :
                          [

                            list_view ( )

                          ]

                        )

                      )

                    ),
                    // End Of List View

                    // Start Of Arrow Up
                    is_empty ? SizedBox ( ) : x . Arrows ( top : num == 1 ? 50 : 45 , left : 341 , icon : Icons . keyboard_arrow_up ),
                    // End Of Arrow Up

                    // Start Of Arrow down
                    is_empty ? SizedBox ( ) : x . Arrows ( top : num == 1 ? 490 : num == 2 ? 510 : 530 , left : 341 , icon : Icons . keyboard_arrow_down ),
                    // End Of Arrow down

                  // Start Of Add subject Button
                  num == 1 ?
                  Padding
                  (

                    padding : EdgeInsets . only ( top : 540 , left : 15 ),

                    child : FloatingActionButton
                    (
                      backgroundColor : Colors . blueAccent . shade700,
                      onPressed : ( ) { Navigator . push ( context , MaterialPageRoute ( builder : ( _ ) => Add_Subjects ( ) ) ) ; },

                      child : Icon ( Icons . add )

                    )

                  ) :
                  SizedBox ( )
                  // End Of Add subject Button

                  ]

                )
                // End Of List View

              ]

            )

          ]

        )

      )

    );

  }
  // End of build Widget

  // Start of list_view Widget
  Widget list_view ( )  => Flexible
  (

    child : ListView . builder
    (

      shrinkWrap : true,
      padding : EdgeInsets . only ( top : 0 ),
      itemCount : subjects_Or_Doctors_Names . length,

      itemBuilder : ( context , index )
      {

        String Subject_Name_Or_Doctor_Name = subjects_Or_Doctors_Names [ index ] ;

        return ListTile
        (

          onTap : ( ) { List_View_On_Tap ( Subject_Name_Or_Doctor_Name , context ) ; },

          title : Container
          (

            padding : EdgeInsets . only ( top : 10 , bottom : 10  ),
            margin : EdgeInsets . only ( bottom : 10  ),

            decoration : BoxDecoration
            (

              color : Colors . black,
              border : Border . all ( color : Colors . blueAccent . shade700 , width : 10 ),
              borderRadius : BorderRadius . circular ( 40 )

            ),

            child : Text ( Subject_Name_Or_Doctor_Name , style : TextStyle ( fontSize : 16 , color : Colors . white , fontWeight : FontWeight . bold ) , textAlign : TextAlign . center )

          )

        );

      }

    )

  );
  // End of list_view Widget

  // Start of List_View_On_Tap Function
  void List_View_On_Tap ( String Subject_Name_Or_Doctor_Name , BuildContext context ) async
  {

    var Varibel = await FirebaseFirestore . instance . collection ( "/المدرسين/$College_Name/$Specialty_Name_Or_Dept_Name" ) . doc ( Subject_Name_Or_Doctor_Name ) . get ( ) ;

    var varibel = await FirebaseFirestore . instance . collection ( "/الكليات و التخصصات/$College_Name/$Specialty_Name_Or_Dept_Name/وصف التخصص و اسماء المواد و بياناتها/بيانات المواد" ) . doc ( Subject_Name_Or_Doctor_Name ) . get ( ) ;

    Navigator . push
    (

      context , MaterialPageRoute
      (

        builder : ( context ) => num == 2 ?
        C_Doctor_data_view ( Name : Subject_Name_Or_Doctor_Name , Coll : College_Name , Dept : Specialty_Name_Or_Dept_Name , Current_courses : Varibel [ "Current_courses" ] , Office_hours : Varibel [ "Office_hours" ] , Contact : Varibel [ "Contact" ] , Dgree : Varibel [ "Dgree" ]  , Office_Address : Varibel [ "Office_Address" ] , Desc : Varibel [ "Desc" ] ):

        S_Subject
        (

          Name : Subject_Name_Or_Doctor_Name,
          Previous : varibel [ "Previous" ],
          NO : varibel [ "NO" ] ,
          syllabus : "fdfdf",
          Credit_hours : varibel [ "Credit_hours" ] ,
          Type : varibel [ "Type" ] ,
          DESC : varibel [ "DESC" ]

        )

      )

   );



  }
  // End of List_View_On_Tap Function

}
// End Of Subjects Class
