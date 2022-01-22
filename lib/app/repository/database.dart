import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_list/app/model/usuario.dart';

class UsuarioFirebaseGlobal {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<Usuario> recuperarDadosUsuario() async {
    User user = _auth.currentUser!;
    Usuario usuario = Usuario();
    DocumentSnapshot snapshot =
        await _firestore.collection("usuarios").doc(user.uid).get();
    usuario = Usuario.fromMap(snapshot.data() as Map);
    return usuario;
  }

  bool checkCurrentUser() {
    User? user = _auth.currentUser;
    return user != null ? true : false;
  }
}
