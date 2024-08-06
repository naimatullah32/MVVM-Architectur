
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:another_flushbar/flushbar.dart';


class Utiles{


  static void fieldFoucsChange(
  BuildContext context,
  FocusNode current,
  FocusNode nextFocus){
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
}

  static toastMessage(String message){

    Fluttertoast.showToast(msg: message);
  }

  static void flushBarErrorMessage(String message, BuildContext context){
   showFlushbar(context: context,
       flushbar:Flushbar(
         forwardAnimationCurve: Curves.bounceInOut,
         margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
         padding: EdgeInsets.all(15),
         borderRadius: BorderRadius.circular(10),
         reverseAnimationCurve: Curves.easeInOut,
         positionOffset: 20,
         icon:Icon(Icons.error,size: 20,color: Colors.white,),
         backgroundColor: Colors.red,
         //flushbarPosition: FlushbarPosition.TOP,
         message:message,
         duration: Duration(seconds: 5),
       )..show(context)
   );
  }
  static snackBar(String message, BuildContext context){
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
        content: Text(message),
      )
    );
  }
}
