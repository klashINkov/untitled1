// Done

// ignore_for_file: use_key_in_widget_constructors, unused_local_variable, non_constant_identifier_names, prefer_const_constructors, curly_braces_in_flow_control_structures, avoid_print, use_build_context_synchronously

import 'package:flutter/material.dart';

import 'package:untitled1/main screens/Home Page.dart';
import 'package:untitled1/main%20screens/Teachers/Doctor_view&_Edit_data.dart';

import 'package:untitled1/main%20screens/temp.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:awesome_dialog/awesome_dialog.dart';

// Start Of Signup Class
class Signup extends StatefulWidget
{

  @override
  State < Signup > createState ( ) => _Signup ( ) ;

}
// End Of Signup Class

// Start Of _Signup Class
class _Signup extends State < Signup >
{

  var x = temp ( ) ;
  bool pass = true ;
  GlobalKey < FormState > formstate = GlobalKey < FormState > ( ) ;

  final Email            = TextEditingController ( ) ;
  final Password         = TextEditingController ( ) ;
  final Name             = TextEditingController ( ) ;
  final ID               = TextEditingController ( ) ;
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
    Email            . addListener ( ( ) => setState ( ( ) { } ) ) ;
    Password         . addListener ( ( ) => setState ( ( ) { } ) ) ;
    Name             . addListener ( ( ) => setState ( ( ) { } ) ) ;
    Coll             . addListener ( ( ) => setState ( ( ) { } ) ) ;
    Dept             . addListener ( ( ) => setState ( ( ) { } ) ) ;
    Current_courses  . addListener ( ( ) => setState ( ( ) { } ) ) ;
    Office_hours     . addListener ( ( ) => setState ( ( ) { } ) ) ;
    Office_Address   . addListener ( ( ) => setState ( ( ) { } ) ) ;
    Contact          . addListener ( ( ) => setState ( ( ) { } ) ) ;
    Dgree            . addListener ( ( ) => setState ( ( ) { } ) ) ;
    Desc             . addListener ( ( ) => setState ( ( ) { } ) ) ;

  }

  // Start Of build Widget
  @override
  Widget build ( BuildContext context )
  {

    String Tmpe = Coll . text ;

    return Scaffold
    (

      extendBodyBehindAppBar : true,

      appBar : AppBar
      (

        title : Text ( "صفحة انشاء الحساب للمدرسين" ),

        backgroundColor : Colors . transparent,
        elevation : 0,
        centerTitle : true,

        actions :
        [

          IconButton
          (

            onPressed : ( ) async { Navigator . of ( context ) . pushAndRemoveUntil ( MaterialPageRoute ( builder : ( context ) => Home ( ) ) , ( route ) => false ) ; },

            icon : Icon ( Icons . home , color : Colors . white , size : 40 )

          )

        ]

      ),

      body : Container
      (

        decoration : BoxDecoration ( image : DecorationImage ( image : AssetImage ( "pic/pic1.png" ), fit : BoxFit . fill , repeat : ImageRepeat . noRepeat ) ),
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

                  // Start of البريد الالكتروني TextField
                  x . Text_Field ( label : " البريد الالكتروني" , hint : "" , controller : Email , keyboardType : TextInputType . emailAddress , textInputAction : TextInputAction . done ,  opacity : 0.6 ),
                  // End of البريد الالكتروني TextField

                  SizedBox ( height : 30 ),

                  // Start of كلمة المرور TextField
                  Opacity
                  (

                    opacity : 0.6,

                    child : TextFormField
                    (

                      controller : Password,
                      obscureText : pass,
                      style : TextStyle ( color : Colors . white , fontSize : 18 ),

                      decoration : InputDecoration
                      (

                        filled : true,
                        fillColor : Colors . black,

                        suffixIcon : IconButton
                        (

                          icon : Password . text . isEmpty ?
                          SizedBox ( )
                          :
                          pass ?

                          Icon ( Icons . visibility_off , color : Colors . white )
                              :
                          Icon ( Icons . visibility , color : Colors . white ),

                          onPressed : ( ) => setState( ( ) => pass = !pass )

                        ),

                        enabledBorder : OutlineInputBorder
                        (

                          borderRadius : BorderRadius . circular ( 30 ),
                          borderSide : BorderSide ( color : Colors . blueAccent . shade700 , width : 5 )

                        ),
                        focusedBorder : OutlineInputBorder
                        (

                          borderRadius : BorderRadius . circular ( 30 ),
                          borderSide : BorderSide ( color : Colors . blueAccent . shade700 , width : 5 )

                        ),

                        errorBorder: OutlineInputBorder
                        (

                          borderRadius : BorderRadius . circular ( 30 ),
                          borderSide : BorderSide ( color : Colors . red . shade900 , width : 5 )

                        ),
                        focusedErrorBorder : OutlineInputBorder
                        (

                          borderRadius : BorderRadius . circular ( 30 ),
                          borderSide : BorderSide ( color : Colors . red . shade900 , width : 5 )

                        ),
                        errorStyle : TextStyle ( fontSize : 20 , fontWeight : FontWeight . bold , color : Colors . yellow , backgroundColor : Colors . black ),

                        labelText : " كلمة المرور",
                        labelStyle : TextStyle ( fontSize : 25 , fontWeight : FontWeight . bold , color : Colors . white ),
                        floatingLabelAlignment : FloatingLabelAlignment . center

                      ),

                      validator : ( val )
                      {

                        if ( Password . text != "TTU_11298" )
                        {

                          return ( "كلمة المرور خاطئه" ) ;

                        }

                        return null ;

                      },

                    )

                  ),
                  // End of كلمة المرور TextField

                  SizedBox ( height : 30 ),

                  // Start of الاسم TextField
                  x . Text_Field ( label : " الاسم" , hint : "" , controller : Name , keyboardType : TextInputType . text , textInputAction : TextInputAction . done ,  opacity : 0.6 ),
                  // End of الاسم TextField

                  SizedBox ( height : 30 ),

                // Start of  الرقم الجامعي TextField
                x . Text_Field ( label : " الرقم الجامعي" , hint : "لن يعرض الرقم للطالب وانما سوف يستعمل من اجل غايات انشاء الحساب" , controller : ID , keyboardType : TextInputType . text , textInputAction : TextInputAction . done ,  opacity : 0.6 ),
                // End of  الرقم الجامعي TextField

                SizedBox ( height : 30 ),

                  // Start of الكلية TextField
                  x . Type_Ahead ( label : " الكلية" , hint : "اسم الكلية التي تتبع لها" , controller : Coll , keyboardType : TextInputType . none ,  textInputAction : TextInputAction . done ,  opacity : 0.6 ),
                  // End of الكلية TextField

                  SizedBox ( height : 30 ),

                  // Start of القسم TextField
                  x . Type_Ahead ( label : " القسم" , hint : "اسم القسم الذي تتبع له" ,controller : Dept , keyboardType : TextInputType . none ,  textInputAction : TextInputAction . done ,  opacity : 0.6 ),
                  // End of القسم TextField

                  SizedBox ( height : 30 ),

                // Start of المساقات الحالية TextField
                  x . Text_Field ( label : " المساقات الحالية" , hint : "\n\nالمساقات التي تعطيها خلال الفصل الحالي\n\nاسم المساق - القاعه التي يعطى فيها المساق\n\nالموعد الذي يعطى فيه المساق-" , controller : Current_courses , keyboardType : TextInputType . text , textInputAction : TextInputAction . newline ,  opacity : 0.6 ),
                  // End of المساقات الحالية TextField

                  SizedBox ( height : 30 ),

                // Start of الساعات المكتبة TextField
                  x . Text_Field ( label : " الساعات المكتبة" , hint : "الساعات المكتبية للفصل الحالي" , controller : Office_hours , keyboardType : TextInputType . text , textInputAction : TextInputAction . done ,  opacity : 0.6 ),
                  // End of الساعات المكتبة TextField

                  SizedBox ( height : 30 ),

                  // Start of الدرجة الجامعية TextField
                  x . Text_Field ( label : " الدرجة الجامعية" , hint : "الدرجة الحاصل عليها" , controller : Dgree , keyboardType : TextInputType . text , textInputAction : TextInputAction . done ,  opacity : 0.6 ),
                  // End of الدرجة الجامعية TextField

                  SizedBox ( height : 30 ),

                  // Start of عنوان المكتب TextField
                  x . Text_Field ( label : " عنوان المكتب" , hint : "اسم المبنى الموجود فيه المكتب - الطابق - القسم" , controller : Office_Address , keyboardType : TextInputType . text , textInputAction : TextInputAction . done ,  opacity : 0.6 ),
                  // End of عنوان المكتب TextField

                  SizedBox ( height : 30 ),

                    // Start of وسيلة التواصل TextField
                    x . Text_Field ( label : " وسيلة التواصل" , hint : "مثال : رقم هاتف او حساب تواصل اجتماعي او عنوان بريد الكتروني" , controller : Contact , keyboardType : TextInputType . text , textInputAction : TextInputAction . newline ,  opacity : 0.6 ),
                    // End of وسيلة التواصل TextField

                  SizedBox ( height : 30 ),

                    // Start of نبذه عن المدرس TextField
                    x . Text_Field ( label : " نبذه عن المدرس" , hint : "" , controller : Desc , keyboardType : TextInputType . text , textInputAction : TextInputAction . newline ,  opacity : 0.6 ),
                    // End of نبذه عن المدرس TextField

                  SizedBox ( height : 20 ),

                  // Start Of Sign Up Button
                  Opacity
                  (

                    opacity : 0.6,

                    child :
                    Container
                    (

                      height : 50,
                      width : 300,
                      margin : EdgeInsets . only ( top : 20 ),

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

                          UserCredential response = await SignUp ( Dept : Dept . text , Coll : Coll . text ) ;


                          if ( response != null )
                            {

                              Navigator . pushReplacement ( context , MaterialPageRoute ( builder : ( _ ) => Doctor_data_view ( Name : Name . text , Coll : Coll . text , Dept : Dept . text , Current_courses : Current_courses . text , Office_hours : Office_hours . text , Dgree : Dgree . text , Office_Address : Office_Address . text , Contact : Contact . text , Desc : Desc . text , What_Do_You_Wont : "View" ) ) ) ;


                            }

                        },

                        child : Text ( "إنشاء الحساب" , style : TextStyle ( color : Colors . white , fontSize : 25 ) )

                      )


                    )

                  )
                  // End Of Sign Up Button

                ]

              )

            )

          ]

        )

      )

    );

  }
  // End Of build Widget

  SignUp ( { required String Coll , required String Dept } ) async
  {

    var formdata = formstate . currentState ;

    if ( formdata! . validate ( ) )
    {

      formdata . save ( ) ;

      try
      {

        //لاضافة بيانات الدكتور الى الفاير بيس
        UserCredential userCredential = await FirebaseAuth . instance . createUserWithEmailAndPassword ( email : Email . text , password : Password . text ) ;
        final docUser = FirebaseFirestore . instance . collection ( "المدرسين/$Coll/$Dept" ) . doc ( Name . text ) ;
        final user = User ( Email : Email . text , Name : Name . text , Id : ID . text , Coll : Coll , Dept : Dept , Current_courses : Current_courses . text , Office_hours : Office_hours . text , Dgree : Dgree . text , Office_Address : Office_Address . text , Contact : Contact . text , Desc : Desc . text ) ;
        final json = user . tojson ( );
        await docUser . set ( json ) ;
        //لاضافة بيانات الدكتور الى الفاير بيس

        // لاضافة اسم الدكتور الى قائمة اسماء مدرسين الكلية
        List < String > arr = [ Name . text ] ;
        final doc = FirebaseFirestore . instance . collection ( "المدرسين" ) . doc ( Coll ) ;
        var varibel = await FirebaseFirestore . instance . collection ( "المدرسين" ) . doc ( Coll ) . get ( ) . then ( ( value ) => doc . set ( { "مدرسين $Dept"  : FieldValue . arrayUnion ( arr ) } , SetOptions ( merge : true ) ) ) ;
        // لاضافة اسم الدكتور الى قائمة اسماء مدرسين الكلية


        return userCredential ;

      }

      on FirebaseAuthException catch ( e )
      {

        if ( e . code == "weak-password" )
          AwesomeDialog
          (

            padding : EdgeInsets . only ( top : 20 , bottom : 40 ),
            autoHide : Duration ( seconds : 2 ),
            dialogBackgroundColor : Colors . black54,
            borderSide : BorderSide ( color : Colors . blueAccent . shade700 , width : 5 ),
            dialogBorderRadius : BorderRadius . circular ( 50 ),
            context : context,

            body : Text ( "Password is to weak" , textAlign : TextAlign . center , style : TextStyle ( fontSize : 25 , color : Colors . white ) )

          ) . show ( ) ;



        else if ( e . code == "email-already-in-use" )
          AwesomeDialog
          (

            padding : EdgeInsets . only ( top : 20 , bottom : 40 , left : 15 , right : 15 ),
            autoHide : Duration ( seconds : 5 ),
            dialogBackgroundColor : Colors . black54,
            borderSide : BorderSide ( color : Colors . blueAccent . shade700 , width : 5 ),
             dialogBorderRadius : BorderRadius . circular ( 50 ),
            context : context,

            body : Text ( "تم استخدام هذا البريد الالكتروني سابقا في انشاء حساب اخر" , textAlign : TextAlign . center , style : TextStyle ( fontSize : 20 , color : Colors . white ) )

          ) . show ( ) ;

      }

      catch ( e ) { print ( e ) ; }

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
// End Of _Signup Class

class User
{

  final String Email , Name , Id , Coll , Dept , Current_courses , Office_hours , Dgree , Office_Address , Contact , Desc ;

  User ( { required this . Email , required this . Name , required this . Id , required this . Coll , required this . Dept , required this . Current_courses , required this . Office_hours , required this . Dgree , required this . Office_Address , required this . Contact , required this . Desc } ) ;

  Map < String , dynamic > tojson ( ) => { "Email" : Email , "Name" : Name , "Id" : Id , "Coll" : Coll , "Dept" : Dept , "Current_courses" : Current_courses , "Office_hours" : Office_hours , "Dgree" : Dgree , "Office_Address" : Office_Address , "Contact" : Contact , "Desc" : Desc } ;

  static User fromjson ( Map < String , dynamic > json ) => User ( Email : json [ "Email" ] , Name : json [ "Name" ] , Id : json [ "Id" ] , Coll : json [ "Coll" ] , Dept : json [ "Dept" ] , Current_courses  : json [ "Current_courses" ] , Office_hours : json [ "Office_hours" ] , Dgree : json [ "Dgree" ] , Office_Address : json [ "Office_Address" ] , Contact : json [ "Contact" ] , Desc : json [ "Desc" ] ) ;

}
