// Done


// ignore_for_file: use_key_in_widget_constructors, non_constant_identifier_names, library_private_types_in_public_api, prefer_const_constructors, unnecessary_null_comparison, use_build_context_synchronously, avoid_function_literals_in_foreach_calls

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:untitled1/main screens/Teachers/SignUp.dart';

import 'package:untitled1/main screens/Home Page.dart';

import 'package:awesome_dialog/awesome_dialog.dart';

import 'package:untitled1/main screens/temp.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:untitled1/main%20screens/Teachers/Doctor_view&_Edit_data.dart';

// Start Of Signin Class
class Signin extends StatefulWidget
{

  @override
  _Signin createState ( ) => _Signin ( ) ;

}
// End Of Signin Class

// Start Of _Signin Class
class _Signin extends State < Signin >
{


  final Email    = TextEditingController ( ) ;
  final Password = TextEditingController ( ) ;

  bool pass = true ;
  var x = temp ( ) ;

  GlobalKey < FormState > formstate = GlobalKey < FormState > ( ) ;
  @override
  void initState ( )
  {

    super . initState ( ) ;
    Email    . addListener ( ( ) => setState ( ( ) { } ) ) ;
    Password . addListener ( ( ) => setState ( ( ) { } ) ) ;

  }

  // Start Of build Widget
  @override
  Widget build ( BuildContext context )
  {

    return Scaffold
    (

      extendBodyBehindAppBar : true,

      appBar : AppBar
      (

        title : Text ( "صفحة تسجيل دخول المدرسين" ),

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

        decoration : BoxDecoration ( image : DecorationImage ( image : AssetImage ( "pic/pic1.png" ) , fit : BoxFit . fill , repeat : ImageRepeat . noRepeat ) ),

        child : ListView
        (

          children :
          [

            Container
            (

              padding : EdgeInsets . symmetric ( horizontal : 20 ),

              child : Form
              (

                key : formstate,

                child : Column
                (

                  children :
                  [

                     SizedBox ( height : 60 ),

                      // Start of Email TextField
                      x . Text_Field ( label : " البريد الالكتروني" , hint : "" , controller : Email , keyboardType : TextInputType . emailAddress , textInputAction : TextInputAction . done , opacity : 0.6  ),
                      // End of Email TextField

                      SizedBox ( height : 260 ),

                      // Start of Password TextField
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

                            return null ;

                          },

                        )

                      ),
                      // End of Password TextField

                      SizedBox ( height : 10 ),

                      // Start Of Login Button
                      Opacity
                      (

                        opacity : 0.6,

                        child : Container
                        (

                          height : 50,
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

                            onPressed : ( ) async
                            {

                              UserCredential user = await signIn ( ) ;

                              if (user != null)
                              {
                                AwesomeDialog
                                (

                                  padding : EdgeInsets . only ( top : 20 , bottom : 40 , left : 15 , right : 15 ),
                                  autoHide : Duration ( seconds : 5 ),
                                  dialogBackgroundColor : Colors . black54,
                                  borderSide : BorderSide ( color : Colors . blueAccent . shade700 , width : 5 ),
                                  dialogBorderRadius : BorderRadius . circular ( 50 ),
                                  context : context,

                                  body : Text ( "الرجاء الانتظار لحين تجهيز بياناتك\n\nهل صليت على الحبيب اليوم؟" , textAlign : TextAlign . center , style : TextStyle ( fontSize : 20 , color : Colors . white ) )

                                ) . show ( ) ;
                                String path = "" , Doc = "" , Name , Coll , Dept , Current_courses , Office_hours , Dgree , Office_Address , Contact , Desc ;

                                for ( int i = 0 ; i < x . College_Name . length ; i++ )
                                {

                                  for ( int k = 0 ; k < x . College_DeptS [ i ] . Colleges_Depts . length ; k++ )
                                  {

                                    final  varr =  FirebaseFirestore . instance . collection ( "المدرسين/${ x . College_Name [ i ] }/${ x . College_DeptS [ i ] . Colleges_Depts [ k ] }" ) ;

                                    await varr . where( "Email" , isEqualTo : FirebaseAuth . instance . currentUser! . email . toString ( )  ) . get ( ) . then
                                    (

                                      (value)
                                      {

                                        value . docs . forEach
                                        (

                                          ( element )
                                          {

                                            Doc = element . id ;
                                            path = varr . path ;

                                          }

                                        );

                                      }

                                    );

                                  }

                                }

                                var varibel = await FirebaseFirestore . instance . collection ( path ) . doc ( Doc ) . get ( ) ;

                                Name = varibel [ "Name" ] ;
                                Coll = varibel [ "Coll" ] ;
                                Dept = varibel [ "Dept" ] ;
                                Current_courses = varibel [ "Current_courses" ] ;
                                Office_hours = varibel [ "Office_hours" ] ;
                                Dgree = varibel [ "Dgree" ] ;
                                Office_Address = varibel [ "Office_Address" ] ;
                                Contact = varibel [ "Contact" ] ;
                                Desc = varibel [ "Desc" ] ;

                                Navigator . pushReplacement ( context , MaterialPageRoute ( builder : ( _ ) => Doctor_data_view ( Name : Name , Coll : Coll , Dept : Dept , Current_courses : Current_courses , Office_hours : Office_hours , Dgree : Dgree , Office_Address : Office_Address , Contact : Contact , Desc : Desc , What_Do_You_Wont : "View" ) ) ) ;

                              }

                            },

                            child : Text ( "تسجيل الدخول" , style : TextStyle ( color : Colors . white , fontSize : 25 ) )

                          )

                        )

                      ),
                      // Start Of Login Button

                      Container
                      (

                        margin : EdgeInsets . only ( top : 20 ),

                        child : Row
                        (

                          mainAxisAlignment : MainAxisAlignment . center,

                          children :
                          [

                            InkWell
                            (

                              onTap : ( ) { Navigator . push ( context , MaterialPageRoute ( builder : ( _ ) => Signup ( ) ) ) ; },

                              child : Text ( "اضغط هنا " , style : TextStyle ( color : Colors . blue , fontSize : 20 , decoration : TextDecoration . underline ) )

                            ),

                            Text ( "اذا كنت لا تمتلك حساب" , style : TextStyle ( color: Colors . white , fontSize : 20 )  )

                          ]

                        )

                      )

                  ]

                )

              )

            )

          ]

        )

      )

    );

  }
  // End Of build Widget

  signIn ( ) async
  {

    var formdata = formstate . currentState ;

    if ( formdata! . validate ( ) )
    {

      formdata . save ( ) ;

      try
      {

        UserCredential userCredential = await FirebaseAuth . instance . signInWithEmailAndPassword ( email : Email . text , password : Password . text ) ;
        return userCredential ;

      }

      on FirebaseAuthException catch ( e )
      {

        if ( e . code == 'user-not-found' )
        {

          AwesomeDialog
          (

            padding : EdgeInsets . only ( top : 20 , bottom : 40 , left : 10 , right : 10 ),
            autoHide : Duration ( seconds : 5 ),
            dialogBackgroundColor : Colors . black54,
            borderSide : BorderSide ( color : Colors . blueAccent . shade700 , width : 5 ),
            dialogBorderRadius : BorderRadius . circular ( 50 ),
            context : context,

            body : Text ( "لا يوجد حساب مسجل بهذا البريد الالكتروني" , textAlign : TextAlign . center , style : TextStyle ( fontSize : 20 , color : Colors . white ) )

          ) . show ( ) ;

        }

        else if ( e . code == 'wrong-password' )
        {

          AwesomeDialog
          (

            padding : EdgeInsets . only ( top : 20 , bottom : 40 ),
            autoHide : Duration ( seconds : 2 ),
            dialogBackgroundColor : Colors . black54,
            borderSide : BorderSide ( color : Colors . blueAccent . shade700 , width : 5 ),
            dialogBorderRadius : BorderRadius . circular ( 50 ),
            context : context,

            body : Text ( "كلمة المرور خاطئة" , textAlign : TextAlign . center , style : TextStyle ( fontSize : 20 , color : Colors . white ) )

          ) . show ( ) ;

        }

      }

    }

    else

    {

      AwesomeDialog
      (

        padding : EdgeInsets . only ( top : 20 , bottom : 40 , left : 15 , right : 15 ),
        autoHide : Duration ( seconds : 5 ),
        dialogBackgroundColor : Colors . black54,
        borderSide : BorderSide ( color : Colors . blueAccent . shade700 , width : 5 ),
        dialogBorderRadius : BorderRadius . circular ( 50 ),
        context : context,

        body : Text ( "المعلومات التي قمت بادخالها غير صالحة" , textAlign : TextAlign . center , style : TextStyle ( fontSize : 20 , color : Colors . white ) )

      ) . show ( ) ;

    }

  }

}
// End Of _Signin Class