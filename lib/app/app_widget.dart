import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class AppWidget extends StatelessWidget {

  final Future<FirebaseApp> _inicializacao = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _inicializacao,
        builder: (_, snapshot){
          if(snapshot.hasError){
            return Center(
                child: Text("Error: ${snapshot.hasError}",
                  style: TextStyle(fontSize: 22),
                  textDirection: TextDirection.ltr,
                )
            );
          }

          if(snapshot.connectionState == ConnectionState.done){
            return MaterialApp(
              localizationsDelegates: [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
              ],
              supportedLocales: [
                const Locale('pt', 'BR'), // portugues
              ],
              title: 'Todo-list',
              theme:ThemeData(
                  brightness: Brightness.dark,
                  primaryColor: Colors.white
              ),

              debugShowCheckedModeBanner: false,
            ).modular();
          }

          return CircularProgressIndicator();
        }
    );
  }
}