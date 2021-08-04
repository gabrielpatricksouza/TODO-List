import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_list/app/model/Usuario.dart';

class DataBaseGlobal {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore db = FirebaseFirestore.instance;

  Future recuperarDadosUsuario() async {

    User user = _auth.currentUser!;
    Usuario usuario = Usuario();
    DocumentSnapshot snapshot = await db.collection("usuarios").doc(user.uid).get();
    usuario = Usuario.fromMap(snapshot.data() as Map);
    return usuario;
  }

//******************************************************************************

  bool checkCurrentUser() {
    User? user = _auth.currentUser;
    return user != null ? true : false;
  }

}