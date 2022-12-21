

// ignore_for_file: camel_case_types, non_constant_identifier_names, use_key_in_widget_constructors, unused_local_variable, must_be_immutable, prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously, curly_braces_in_flow_control_structures

import 'package:untitled1/main screens/Colleges And Specialties/S_Colleges.dart';

import 'package:untitled1/main screens/Teachers/SignIn.dart';

import 'package:untitled1/main screens/Home Page.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:awesome_dialog/awesome_dialog.dart';

import 'package:untitled1/main screens/temp.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

// Start Of _C_Doctor_data_View
class Doctor_data_view extends StatefulWidget
{

   String  Name , Coll , Dept , Current_courses , Office_hours , Dgree , Office_Address , Contact , Desc , What_Do_You_Wont ;

   Doctor_data_view ( { required this . Name , required this . Coll , required this . Dept , required this . Current_courses , required this . Office_hours , required this . Dgree , required this . Office_Address , required this . Contact , required this . Desc , required this . What_Do_You_Wont } ) ;

  @override
  State < Doctor_data_view > createState ( ) => _Doctor_data_view ( ) ;

}

class _Doctor_data_view extends State < Doctor_data_view >
{

  var x = temp ( ) ;

  GlobalKey < FormState > formstate = GlobalKey < FormState > ( ) ;

  final Coll             = TextEditingController ( ) ;
  final Dept             = TextEditingController ( ) ;
  final Current_courses  = TextEditingController ( ) ;
  final Office_hours     = TextEditingController ( ) ;
  final Dgree            = TextEditingController ( ) ;
  final Office_Address   = TextEditingController ( ) ;
  final Contact          = TextEditingController ( ) ;
  final Desc             = TextEditingController ( ) ;

  @override
  void initState ( )
  {

    super . initState ( ) ;
    Coll             . addListener ( ( ) => setState ( ( ) { } ) ) ;
    Dept             . addListener ( ( ) => setState ( ( ) { } ) ) ;
    Current_courses  . addListener ( ( ) => setState ( ( ) { } ) ) ;
    Office_hours     . addListener ( ( ) => setState ( ( ) { } ) ) ;
    Office_Address   . addListener ( ( ) => setState ( ( ) { } ) ) ;
    Contact          . addListener ( ( ) => setState ( ( ) { } ) ) ;
    Dgree            . addListener ( ( ) => setState ( ( ) { } ) ) ;
    Desc             . addListener ( ( ) => setState ( ( ) { } ) ) ;

    Coll             . text = widget .  Coll ;
    Dept             . text = widget .  Dept ;
    Current_courses  . text = widget .  Current_courses ;
    Office_hours     . text = widget .  Office_hours ;
    Office_Address   . text = widget .  Office_Address ;
    Contact          . text = widget .  Contact ;
    Dgree            . text = widget .  Dgree ;
    Desc             . text = widget .  Desc ;

  }

  // Start Of Build Widget
  @override
  Widget build ( BuildContext context )
  {
    String Tmpe = Coll . text ;

    return widget . What_Do_You_Wont == "Edit" ?
    Scaffold
    (

      extendBodyBehindAppBar : true,

      appBar :  AppBar
      (
        title : Text ( "تعديل البيانات" , style : TextStyle ( fontSize : 25 ) ),
        centerTitle : true,
        backgroundColor : Colors . transparent,
        elevation : 0,

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

        height : 684,
        padding : EdgeInsets . symmetric ( horizontal : 15 ),

        decoration : BoxDecoration ( gradient : LinearGradient ( colors : [ Color ( 0xff780206 ) , Color ( 0xFF061161 ) ] ) ),

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

                  // Start of الكلية TextField
                  x . Type_Ahead ( label : " الكلية" , hint : "اسم الكلية التي تتبع لها" , controller : Coll , keyboardType : TextInputType . none ,  textInputAction : TextInputAction . done , opacity : 0.9 ),
                  // End of الكلية TextField

                  SizedBox ( height : 30 ),

                  // Start of القسم TextField
                  x . Type_Ahead ( label : " القسم" , hint : "اسم القسم الذي تتبع له" ,controller : Dept , keyboardType : TextInputType . none ,  textInputAction : TextInputAction . done , opacity : 0.9 ),
                  // End of القسم TextField

                  SizedBox ( height : 30 ),

                  // Start of  المساقات الحالية TextField
                  x . Text_Field ( label : " المساقات الحالية" , hint : "المساقات التي تعطيها خلال الفصل الحالي\nاسم المساق - القاعه التي يعطى فيها المساق\nالموعد الذي يعطى فيه المساق" , controller : Current_courses , keyboardType : TextInputType . text , textInputAction : TextInputAction . newline , opacity : 0.9 ),
                  // End of  المساقات الحالية TextField

                  SizedBox ( height : 30 ),

                  // Start of  الساعات المكتبةة TextField
                  x . Text_Field ( label : " الساعات المكتبة" , hint : "الساعات المكتبية للفصل الحالي" , controller : Office_hours , keyboardType : TextInputType . text , textInputAction : TextInputAction . done , opacity : 0.9 ),
                  // End of  الساعات المكتبة TextField

                  SizedBox ( height : 30 ),

                  // Start of الدرجة الجامعية TextField
                  x . Text_Field ( label : " الدرجة الجامعية" , hint : "الدرجة الحاصل عليها" , controller : Dgree , keyboardType : TextInputType . text , textInputAction : TextInputAction . done , opacity : 0.9 ),
                  // End of الدرجة الجامعية TextField

                  SizedBox ( height : 30 ),

                  // Start of عنوان المكتب TextField
                  x . Text_Field ( label : " عنوان المكتب" , hint : "اسم المبنى الموجود فيه المكتب - الطابق - القسم" , controller : Office_Address , keyboardType : TextInputType . text , textInputAction : TextInputAction . done , opacity : 0.9 ),
                  // End of عنوان المكتب TextField

                  SizedBox ( height : 30 ),

                  // Start of وسيلة التواصل TextField
                  x . Text_Field ( label : " وسيلة التواصل" , hint : "مثال : رقم هاتف او حساب تواصل اجتماعي او عنوان بريد الكتروني" , controller : Contact , keyboardType : TextInputType . text , textInputAction : TextInputAction . newline , opacity : 0.9 ),
                  // End of وسيلة التواصل TextField

                  SizedBox ( height : 30 ),

                  // Start of نبذه عن المدرس TextField
                  x . Text_Field ( label : " نبذه عن المدرس" , hint : "" , controller : Desc , keyboardType : TextInputType . text , textInputAction : TextInputAction . newline , opacity : 0.9 ),
                  // End of نبذه عن المدرس TextField

                  SizedBox ( height : 25 ),

                  // Start Of Sign Up Button
                  Container
                  (

                    height : 50,
                    width : 300,
                    margin : EdgeInsets . only ( bottom : 30 ),

                    decoration : BoxDecoration
                    (
                      color : Colors . black,
                      border : Border . all ( color : Colors . blueAccent . shade700 , width : 5 ),
                      borderRadius : BorderRadius . circular ( 20 )
                    ),

                    child : FloatingActionButton
                    (
                        backgroundColor : Colors.transparent,

                      onPressed : ( ) async
                      {

                        Update_Data ( Coll : Coll . text , Dept : Dept . text ) ;

                        Navigator . pushReplacement ( context , MaterialPageRoute ( builder : ( _ ) => Doctor_data_view ( Name : widget . Name , Coll : Coll . text , Dept : Dept . text , Current_courses : Current_courses . text , Office_hours : Office_hours . text , Dgree : Dgree . text , Office_Address : Office_Address . text , Contact : Contact . text , Desc : Desc . text , What_Do_You_Wont : "View" ) ) ) ;

                      },

                      child : Text ( "إنشاء الحساب" , style : TextStyle ( color : Colors . white , fontSize : 25 ) )

                    )


                  )
                  // End Of Sign Up Button

                ]

              )

            )

          ]
        )

      )

    ):
    Scaffold
    (

      extendBodyBehindAppBar : true,

      appBar :  AppBar
      (
        title : Text ( "بياناتك" , style : TextStyle ( fontSize : 35 , fontWeight : FontWeight . bold ) ),
        backgroundColor : Colors . transparent , centerTitle : true,
        elevation : 0,

        actions :
        [

          IconButton
          (

            onPressed : ( ) { Navigator . of ( context ) . pushAndRemoveUntil ( MaterialPageRoute ( builder : ( context ) => Home ( ) ) , ( route ) => false ) ; },

            icon : Icon ( Icons . home , color : Colors . white , size : 40 )

          )

        ]

      ),

      drawer : Drawer
      (

        backgroundColor : Colors . black54 ,

        child : ListView
        (

          children:
          [

            UserAccountsDrawerHeader
            (
              accountName  : Text( "" ),
              accountEmail : Text( "" ),
              decoration: BoxDecoration
              (

                image:DecorationImage
                (
                  fit: BoxFit.fill,
                  image:AssetImage("pic/pic1.png"),
                )

              )
            ),

            Text ( "البريد الإلكتروني\n\n${ FirebaseAuth . instance . currentUser! . email . toString ( ) }" , textAlign : TextAlign . center , style : TextStyle ( color : Colors . white , fontSize : 25  )  ),

            SizedBox( height : 25 ),

            Text ( "الاسم\n\n${ widget . Name }" , textAlign : TextAlign . center , style : TextStyle ( color : Colors . white , fontSize : 25  )  ),

            Container
            (

              padding : EdgeInsets . symmetric ( horizontal : 20 ),

              child : Column
              (

                children :
                [

                  SizedBox( height : 30 ),

                  Container
                  (

                    decoration: BoxDecoration
                    (
                      border : Border . all ( color : Colors . blueAccent . shade700 , width : 10 ),
                      borderRadius : BorderRadius . circular ( 50 )
                    ),

                    child : ListTile
                    (
                      onTap : ( ) => Navigator . push ( context , MaterialPageRoute ( builder : ( _ ) => Doctor_data_view ( Name : widget . Name , Coll : widget . Coll , Dept : widget . Dept , Current_courses : widget . Current_courses , Office_hours : widget . Office_hours , Dgree : widget . Dgree , Office_Address : widget . Office_Address , Contact : widget . Contact , Desc : widget . Desc , What_Do_You_Wont : "Edit" ) ) ),
                      title : Center( child: Text ( "تعديل بيانات المدرس" , style : TextStyle ( color : Colors . white , fontSize : 25 ) ) )
                    )

                  ),

                  SizedBox( height : 30 ),

                  Container
                  (

                    decoration : BoxDecoration
                    (
                      border : Border . all ( color : Colors . blueAccent . shade700 , width : 10 ),
                      borderRadius : BorderRadius . circular ( 50 )
                    ),

                    child : ListTile
                    (
                      onTap : ( ) => Navigator . push ( context , MaterialPageRoute ( builder : ( _ ) => S_Colleges ( num : 1 ) ) ) ,
                      title : Center ( child : Text ( "اضافة او تعديل بيانات مادة" , style : TextStyle ( color : Colors . white , fontSize : 20 , fontWeight : FontWeight . bold ) ) )
                    )

                  ),

                  SizedBox( height : 30 ),

                  Container
                  (

                    decoration : BoxDecoration
                    (
                      border : Border . all ( width : 10  , color : Colors . blueAccent . shade700 ),
                      borderRadius : BorderRadius . circular ( 40 ),
                    ),

                    child : ListTile
                    (

                      onTap : ( ) async
                      {

                        FirebaseAuth . instance . sendPasswordResetEmail( email : FirebaseAuth . instance . currentUser! . email . toString ( ) ) ;
                        AwesomeDialog
                        (

                          padding : EdgeInsets . only ( top : 20 , bottom : 40 , left : 15 , right : 15 ),
                          autoHide : Duration ( seconds : 10 ),
                          dialogBackgroundColor : Colors . black54,
                          borderSide : BorderSide ( color : Colors . blueAccent . shade700 , width : 5 ),
                          dialogBorderRadius : BorderRadius . circular ( 50 ),
                          context : context,

                          body : Text ( "تم ارسال بريد الى بريد الالكتروني يرجى الذهاب الى بريدك الالكتروني لتغيير كلمة المرور\nمن المحتمل ان يكون البريد الذي تم ارساله في صندوق الرسائل غير المرغوب فيها او السبام" , textAlign : TextAlign . center , style : TextStyle ( fontSize : 20 , color : Colors . white ) )

                        ) . show ( ) ;

                      },

                      title : Center ( child : Text ( "تغيير كلمة المرور" , style : TextStyle ( color : Colors . white , fontSize : 25 , fontWeight : FontWeight . bold ) ) )

                    )

                  ),

                  SizedBox( height : 30 ),

                  Container
                  (

                    decoration : BoxDecoration
                    (
                      border : Border . all ( width : 10  , color : Colors . blueAccent . shade700 ),
                      borderRadius : BorderRadius . circular ( 40 ),
                    ),

                    child : ListTile
                    (

                      onTap : ( ) async
                      {

                        await FirebaseAuth . instance . signOut ( ) ;
                        Navigator . pushReplacement ( context , MaterialPageRoute ( builder : ( _ ) => Signin ( ) ) ) ;

                      },

                      title : Center ( child : Text ( "تسجيل الخروج" , style : TextStyle ( color : Colors . white , fontSize : 25 , fontWeight : FontWeight . bold ) ) )

                    )

                  ),

                  SizedBox( height : 30 ),


                ]

              )

            )

          ]

        )

      ),

      body : Container
      (

        height : 684,
        padding : EdgeInsets . symmetric ( horizontal : 15 ),

        decoration : BoxDecoration ( gradient : LinearGradient ( colors : [ Color ( 0xff780206 ) , Color ( 0xFF061161 ) ] ) ),

        child : ListView
        (

          children :
          [

            Column
            (

              children :
              [

                x . TexT ( text : widget . Name , label : "الاسم"),

                SizedBox ( height : 25 ),

                x . TexT ( text : widget . Coll , label : "الكلية"),

                SizedBox ( height : 25 ),

                x . TexT ( text : widget . Dept , label : "القسم"),

                SizedBox ( height : 25 ),

                x . TexT ( text : widget . Current_courses , label : "المساقات الحالية"),

                SizedBox ( height : 25 ),

                x . TexT ( text : widget . Office_hours , label : "الساعات المكتبية"),

                SizedBox ( height : 25 ),

                x . TexT ( text : widget . Dgree , label : "الدرجة الجامعية"),

                SizedBox ( height : 25 ),

                x . TexT ( text : widget . Office_Address , label : "عنوان المكتب"),

                SizedBox ( height : 25 ),

                x . TexT ( text : widget . Contact , label : "وسيلة التواصل"),

                SizedBox ( height : 25 ),

                x . TexT ( text : widget . Desc , label : "النبذه"),

              ]

            )

          ]
        )

      )

    );

  }
  // End Of Build Widget

  Update_Data ( { required String Coll , required String Dept } ) async
  {
    var formdata = formstate . currentState ;

    if ( formdata! . validate ( ) )
    {

      formdata . save ( ) ;


        // لاضافة اسم الدكتور الى قائمة اسماء مدرسين الكلية
       /* List < String > arr = [ Name . text ] ;
        final doc = FirebaseFirestore . instance . collection ( "المدرسين" ) . doc ( Coll ) ;
        var varibel = await FirebaseFirestore . instance . collection ( "المدرسين" ) . doc ( Coll ) . get ( ) .
        then ( ( value ) => doc . set ( { "مدرسين $Dept"  : FieldValue . arrayUnion ( arr ) } , SetOptions ( merge : true ) ) ) ;*/

        //====================

        final docUser = FirebaseFirestore . instance . collection ( "المدرسين/$Coll/$Dept" ) . doc ( widget . Name ) ;

        var Varibel = await FirebaseFirestore . instance . collection ( "المدرسين" ) . doc ( Coll ) . get ( ) . then
        (

          ( value ) => docUser . update
          (

            {  "Coll" : Coll , "Dept" : Dept , "Current_courses" : Current_courses . text , "Office_hours" : Office_hours . text , "Dgree" : Dgree . text , "Office_Address" : Office_Address . text , "Contact" : Contact . text , "Desc" : Desc . text }

          )

        ) ;


  }

    else
      AwesomeDialog
      (

        padding : EdgeInsets . only ( top : 20 , bottom : 40 , left : 15 , right : 15 ),
        autoHide : Duration ( seconds : 7 ),
        dialogBackgroundColor : Colors . black54,
        borderSide : BorderSide ( color : Colors . blueAccent . shade700 , width : 5 ),
         dialogBorderRadius : BorderRadius . circular ( 50 ),
        context : context,

        body : Text ( "المعلومات التي قمت بادخالها عير صالحة قم بالتاكد من ان جميع ما في الحقول صحيح" , textAlign : TextAlign . center , style : TextStyle ( fontSize : 20 , color : Colors . white ) )

      ) . show ( ) ;


  }

}
// End Of _C_Doctor_data_View
