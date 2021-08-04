import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

simpleCustomAlert(
    context,
    AlertType alertType,
    String title,
    String mensagemErro
    ){
  Alert(
    context: context,
    type: alertType,
    title: title,
    style: AlertStyle(
      backgroundColor: Colors.white.withOpacity(0.8),
      titleStyle: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w700
      ),
      descStyle: TextStyle(
        color: Colors.black,
      ),
    ),
    desc: mensagemErro,
    buttons: [
      DialogButton(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        child: Text(
          "Ok",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        onPressed: () => Navigator.pop(context),
        width: 120,
        color:  Colors.deepPurpleAccent
      )
    ],
  ).show();
}