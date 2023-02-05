// Done

// ignore_for_file: file_names, camel_case_types, must_be_immutable, non_constant_identifier_names, use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously, avoid_print

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

  String Specialty_Name_Or_Dept_Name , College_Name , Desc = "" , where_did_you_come_from ;
  bool Is_Empty ;
  List < dynamic > subjects_Or_Doctors_Names ;

  S_Subjects ( { required this . Specialty_Name_Or_Dept_Name , required this . College_Name , String  desc = "" , required this . subjects_Or_Doctors_Names , required this . Is_Empty , required this . where_did_you_come_from } ) { Desc = desc ; }

  // Start of build Widget
  @override
  Widget build ( BuildContext context )
  {

    return Scaffold
    (

      extendBodyBehindAppBar : true,

      appBar : AppBar
      (

        title : Padding
        (

          padding : EdgeInsets . only ( top : 10 ),
          child : Text ( Specialty_Name_Or_Dept_Name , maxLines : 2 , textAlign : TextAlign . center , style : TextStyle ( fontSize : 18 , color : Colors . white , fontWeight : FontWeight . bold ) )

        ),

        backgroundColor : Colors . transparent , elevation : 0 , centerTitle : true,

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

        child : where_did_you_come_from == "From a student request to display teacher data" ? temp . Custom_Stack
        (
            Text_If_Empty : "لم يقم احد مدرسين باضافة بياناته بعد",
            Top_padding_If_Empty : 170,
            list_view : list_view,
            Title : "مدرسين القسم",
            Is_Empty : Is_Empty,
            context : context,
            Font_Size : 35
        ):


        where_did_you_come_from == "From a teacher's request to add a subject" ? temp . Custom_Stack
        (
          Text_If_Empty : "لم يقم احد مدرسين باضافة بيانات اي مادة لهذا التخصص بعد كن انت اول شخص يضيف بيانات اول مادة من مواد هذا التخصص",
          Top_padding_If_Empty : 140,
          list_view : list_view,
          Title : "مواد التخصص",
          Is_Empty : Is_Empty,
          context : context,
          Font_Size : 25,
          flag : true
        ):



        ListView
        (

          children :
          [

            Column
            (

              children :
              [

                // Start Of Description Box
                where_did_you_come_from == "From a student request to view colleges" ?
                // The Stack Widget below displayed when the student browses the page that displays the specialization subject else the sized box widget below will displayed
                Stack
                (

                  children :
                  [

                    // Start Of Description Text
                    Container
                    (
                      //if the student requested view of the subjects of a particular specialization, and none of the subjects of this specialization have been
                      // added yet, then the height of the Specialization description box is equal 360 else is equal 300
                      height : Is_Empty ? 360 : 300,

                      margin : EdgeInsets . only ( left : 15 , right : 25 , top : 10 ),

                      decoration : BoxDecoration
                      (
                        border : Border . all ( color : Colors . blueAccent . shade700 , width : 10 ),
                        borderRadius : BorderRadius . circular ( 50 ),
                      ),

                      child : Padding
                      (

                        padding : EdgeInsets . only ( top : 5 , left : 17 , right : 22 , bottom : 10 ),

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
                    temp . Arrows ( top : 30 , left : 341 , icon : Icons . keyboard_arrow_up ),
                    // End Of Arrow Up

                    // Start Of Arrow down
                    temp . Arrows (top : Is_Empty ? 270 : 210 , left : 341 , icon : Icons . keyboard_arrow_down )
                    // End Of Arrow down

                  ]

                ) :
                SizedBox ( ),
                // End Of Description Text Box

                // STart Of List View
                // The stack widget below contain the list of specialization subjects
                Stack
                (

                  children :
                  [

                    // Start Of مواد التخصص او مدرسين القسم
                    Padding
                    (

                      padding : EdgeInsets . only ( top : 35 ),

                      child : Center ( child : Text ( "مواد التخصص" , style : TextStyle ( fontSize : 25 , fontWeight : FontWeight . bold , color : Colors . white ) ) )

                    ),
                    // End Of مواد التخصص او مدرسين القسم

                    // STart Of List View
                    Container
                    (
                      // If the request comes From a student request to view specialization subjects and no specialization subject has been added yet, then the height of
                      // the list of subjects = 200 and otherwise = 580
                      height : Is_Empty ? 200 : 580,
                      width : 400,

                      margin : EdgeInsets . only ( top : 20 , left : 15 , right : 25 , bottom : 20 ),

                      decoration : BoxDecoration
                      (

                        border : Border . all ( color : Colors . blueAccent . shade700 , width : 10 ),
                        borderRadius : BorderRadius . circular ( 50 )

                      ),

                      child : Padding
                      (

                        padding : EdgeInsets . only ( top : Is_Empty ? 40 : 60 , bottom : 10 ),

                        child : Is_Empty  ?
                        Center
                        (

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
                    Is_Empty ? SizedBox ( ) :
                    temp . Arrows( top : 40, left : 341 , icon : Icons . keyboard_arrow_up ),
                    // End Of Arrow Up

                    // Start Of Arrow down
                    Is_Empty ? SizedBox ( ) :
                    temp . Arrows ( top : 500 , left : 341 , icon : Icons . keyboard_arrow_down ),
                    // End Of Arrow down

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

            padding : EdgeInsets . only ( top : 10 , bottom : 10 ),
            margin : EdgeInsets . only ( bottom : 10 ),

            decoration : BoxDecoration
            (

              color : Colors . black,
              border : Border . all ( color : Colors . blueAccent . shade700 , width : 5 ),
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

    DocumentSnapshot < Map < String , dynamic > > variable = await FirebaseFirestore . instance .
    collection ( "/المدرسين/$College_Name/$Specialty_Name_Or_Dept_Name" ) .
    doc ( Subject_Name_Or_Doctor_Name ) .
    get ( ) ;

    DocumentSnapshot < Map < String , dynamic > > variable0 = await FirebaseFirestore . instance .
    collection ( "/الكليات و التخصصات/$College_Name/$Specialty_Name_Or_Dept_Name/وصف التخصص و اسماء المواد و بياناتها/بيانات المواد" ) .
    doc ( Subject_Name_Or_Doctor_Name ) .
    get ( ) ;

    Navigator . push
    (

      context , MaterialPageRoute
      (

        builder : ( context ) => where_did_you_come_from == "From a student request to display teacher data" ?

        C_Doctor_data_view
        (
          Current_courses : variable [ "Current_courses" ],
          Office_Address  : variable [ "Office_Address"  ],
          Office_hours    : variable [ "Office_hours"    ],
          Name : Subject_Name_Or_Doctor_Name ,
          Dept : Specialty_Name_Or_Dept_Name,
          Contact : variable [ "Contact" ],
          Dgree   : variable [ "Dgree"   ],
          Desc    : variable [ "Desc"    ],
          Coll : College_Name
        ):

        S_Subject
        (
          Credit_hours : variable0 [ "Credit_hours" ],
          Name : Subject_Name_Or_Doctor_Name,
          Previous : variable0 [ "Previous" ],
          Type : variable0 [ "Type" ],
          DESC : variable0 [ "DESC" ],
          NO   : variable0 [ "NO"   ],
          syllabus : "fdfdf"
        )

      )

   );

  }
  // End of List_View_On_Tap Function

}
// End Of Subjects Class
