//Done

// ignore_for_file: use_key_in_widget_constructors, unused_local_variable, camel_case_types, file_names, non_constant_identifier_names, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:untitled1/main screens/Home Page.dart';

import 'package:untitled1/main%20screens/temp.dart';

import 'package:flutter/material.dart';

// Start Of Add_Subjects Class
class Add_Subjects extends StatefulWidget
{

  @override
  State < Add_Subjects > createState ( ) => _Add_Subjects ( ) ;

}
// End Of Add_Subjects Class

// Start Of _Add_SubjectsState Class
class _Add_Subjects extends State < Add_Subjects >
{


  GlobalKey < FormState > formstate = GlobalKey < FormState > ( ) ;

  final Name         = TextEditingController ( ) ;
  final Id           = TextEditingController ( ) ;
  final Coll         = TextEditingController ( ) ;
  final Dept         = TextEditingController ( ) ;
  final prev         = TextEditingController ( ) ;
  final coll         = TextEditingController ( ) ;
  final Desc         = TextEditingController ( ) ;
  final Type         = TextEditingController ( ) ;
  final Credit_hours = TextEditingController ( ) ;

  @override
  void initState ( )
  {

    super . initState ( ) ;
    Name          . addListener ( ( ) => setState ( ( ) { } ) ) ;
    Coll          . addListener ( ( ) => setState ( ( ) { } ) ) ;
    Dept          . addListener ( ( ) => setState ( ( ) { } ) ) ;
    Id            . addListener ( ( ) => setState ( ( ) { } ) ) ;
    prev          . addListener ( ( ) => setState ( ( ) { } ) ) ;
    coll          . addListener ( ( ) => setState ( ( ) { } ) ) ;
    Desc          . addListener ( ( ) => setState ( ( ) { } ) ) ;
    Type          . addListener ( ( ) => setState ( ( ) { } ) ) ;
    Credit_hours . addListener ( ( ) => setState ( ( ) { } ) ) ;

  }

  // Start Of build Widget
  @override
  Widget build ( BuildContext context )
  {

    String Tmpe = Coll . text ;

    return Scaffold
    (

      extendBodyBehindAppBar : true,

      appBar :  AppBar
      (

        title : Text ( "إضافة مادة" , style : TextStyle ( fontSize : 35 , fontWeight : FontWeight . bold , color : Colors . white ) ),

        centerTitle : true,
        backgroundColor : Colors . transparent,
        elevation : 0,

        actions :
        [

          IconButton
          (

            onPressed : ( )  { Navigator . of ( context ) . pushAndRemoveUntil ( MaterialPageRoute ( builder : ( context ) => Home ( ) ) , ( route ) => false ) ; },

            icon : Icon ( Icons . home , color : Colors . white , size : 40 )

          )

        ]

      ),

      body : Container
      (

        decoration : BoxDecoration
        (

          image : DecorationImage ( image : AssetImage ( "pic/pic1.png" ), fit : BoxFit . fill, repeat : ImageRepeat . noRepeat ) ),
          padding : EdgeInsets . symmetric ( horizontal : 15 ),

          child : ListView
          (

            children :
            [

              Form
              (

                key : formstate,

                child : Column
                (

                  children :
                  [


                    // Start of اسم المادة TextField
                    temp . Text_Field ( label : " اسم المادة" , controller : Name , opacity : 0.6 ),
                    // End of اسم المادة TextField

                    SizedBox ( height : 30 ),

                    // Start of رقم المادة TextField
                    temp . Text_Field ( label : " رقم المادة" , controller : Id , keyboardType : TextInputType . number , opacity : 0.6 ),
                    // End of رقم المادة TextField

                    SizedBox ( height : 30 ),

                    // Start of رقم المادة TextField
                    temp . Type_Ahead ( label : " الكلية" , controller : Coll , opacity : 0.6 ),
                    // End of رقم المادة TextField

                    SizedBox ( height : 30 ),

                    // Start of رقم المادة TextField
                    temp . Type_Ahead ( label : " التخصص" , hint : "التخصص الذي ترغب في اضافة المادة اليه" , controller : Dept , opacity : 0.6 ),
                    // End of رقم المادة TextField

                    SizedBox ( height : 30 ),

                    // Start of المتطلب السابق للمادة TextField
                    temp . Text_Field ( label : " المتطلب السابق للمادة" , hint : "اسم المتطلب ( رقم المتطلب )" , controller : prev , opacity : 0.6 ),
                    // End of المتطلب السابق للمادة TextField

                    SizedBox ( height : 30 ),

                    // Start of نوع المادة TextField
                    temp . Text_Field ( label : " نوع المادة" , hint : "عملي ام نظري؟" , controller : Type , opacity : 0.6 ),
                    // End of نوع المادة TextField

                    SizedBox ( height : 30 ),

                    // Start of الساعات المعتمدة للمادة TextField
                    temp . Text_Field ( label : " الساعات المعتمدة للمادة" , controller : Credit_hours , opacity : 0.6 ),
                    // End of الساعات المعتمدة للمادة TextField

                    SizedBox ( height : 30 ),

                    // Start of نبذه عن المادة TextField
                    temp . Text_Field ( label : " نبذه عن المادة" , controller : Desc , textInputAction : TextInputAction.newline , opacity : 0.6 ),
                    // End of نبذه عن المادة TextField

                    // Start Of Add Button
                    Opacity
                    (

                      opacity : 0.6,

                      child : Container
                      (

                        height : 65,
                        width : 300,
                        margin : EdgeInsets . only ( top : 40 ),

                        decoration : BoxDecoration
                        (

                          color : Colors . black,
                          border : Border . all ( color : Colors . blueAccent . shade700 , width : 10 ),
                          borderRadius : BorderRadius . circular ( 40 )

                        ),

                        child : FloatingActionButton
                        (
                          backgroundColor : Colors.transparent,

                          onPressed : ( )
                          {

                            var formdata = formstate . currentState ;
                            if ( formdata! . validate ( ) )
                            {

                              formdata . save ( ) ;
                              Add_Subject ( Dept : Dept . text , Coll : Coll . text ) ;
                              // Navigator . pushReplacement ( context , MaterialPageRoute ( builder : ( _ ) => T_Subjects ( ) ) );

                            }

                          },

                          child : Text ( "إضافة" , style : TextStyle ( color : Colors . white , fontSize : 25 ) )

                        )

                      )

                    )
                    // End Of Add Button

                  ]

                )

              )

            ]

          )

      )

    );

  }
  // End Of build Widget

  Add_Subject ( { required String Coll , required String Dept } ) async
  {

    // لاضافة بيانات المادة الى الفاير بيس عندما يدخلها الدكتور
    final docUser = FirebaseFirestore . instance . collection ( "الكليات و التخصصات/$Coll/$Dept/وصف التخصص و اسماء المواد و بياناتها/بيانات المواد" ) . doc ( Name . text ) ;
    final user = Subject ( Name : Name . text , NO : Id . text , Coll : Coll , prev : prev . text , Dept : Dept , Desc : Desc . text , Credit_hours : Credit_hours . text , Type : Type . text  ) ;
    final json = user . tojson ( ) ;
    await docUser . set ( json ) ;
    // لاضافة بيانات المادة الى الفاير بيس عندما يدخلها الدكتور

    // لاضافة اسم المادة في قائمة اسماء مواد التخصص
    final doc = FirebaseFirestore . instance . collection ( "الكليات و التخصصات/$Coll/$Dept" ) . doc ( "وصف التخصص و اسماء المواد و بياناتها" ) ;
    List < String > arr = [ Name . text ] ;

    var varibel = await FirebaseFirestore . instance . collection ( "الكليات و التخصصات/$Coll/$Dept" ) . doc ( "وصف التخصص و اسماء المواد و بياناتها" ) . get ( ) . then
    ( (value) => doc . set ( { "مواد التخصص"  : FieldValue . arrayUnion ( arr ) } ,SetOptions ( merge : true ) ) ) ;
    // لاضافة اسم المادة في قائمة اسماء مواد التخصص

  }

}
// End Of _Add_SubjectsState Class

class Subject
{

  String Name, NO , Coll, Dept, Desc, prev , Credit_hours , Type ;

  Subject ( { required this . Name , required this . NO , required this . Coll , required this . Dept , required this . Desc , required this . prev  , required this . Credit_hours , required this . Type } ) ;

  Map < String , dynamic > tojson ( ) => { "Name" : Name , "NO" : NO ,  "Coll" : Coll , "Dept" : Dept , "Desc" : Desc , "prev" : prev  , "Credit_hours" : Credit_hours  , "Type" : Type } ;

  static Subject fromjson ( Map < String , dynamic > json ) => Subject ( Name : json [ "Name" ] , NO : json [ "NO" ] , Coll : json [ "Coll" ] , Dept : json [ "Dept" ] , Desc : json [ "Desc" ] , prev : json [ "prev" ] , Credit_hours : json [ "Credit_hours" ] , Type : json [ "Type" ] ) ;


}