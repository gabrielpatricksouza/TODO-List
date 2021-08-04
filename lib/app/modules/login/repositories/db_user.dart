import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_list/app/model/Usuario.dart';

class ConexaoBD {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore db = FirebaseFirestore.instance;


  Future cadastrarUsuario(Usuario usuario) async {
    try {
      await _auth
          .createUserWithEmailAndPassword(
          email: usuario.email, password: usuario.senha).then(
              (value) {
            db.collection("usuarios").doc(value.user!.uid).set({
              "nome": usuario.nome,
              "email": usuario.email,
              "idUsuario": value.user!.uid
            });
      });
      return true;
    } catch (error) {
      var errorMessage;

      switch (error) {
        case "weak-password":
          errorMessage = "Senha fraca!";
          return errorMessage;

        case "invalid-email":
          errorMessage =
          "O valor fornecido para a propriedade do usuário email é inválido!";
          return errorMessage;

        case "email-already-exists":
          errorMessage =
          "O e-mail fornecido já está em uso por outro usuário. ";
          return errorMessage;

        case "email-already-in-use":
          errorMessage =
          "O e-mail fornecido já está em uso por outro usuário. ";
          return errorMessage;

        default:
          errorMessage = "Um erro desconhecido ocorreu.";
          return errorMessage;
      }
    }
  }
//******************************************************************************

  Future logarUsuario(Usuario usuario) async {

    try {
      await _auth.signInWithEmailAndPassword(
          email: usuario.email, password: usuario.senha);
      return true;
    } catch (error) {
      var errorMessage;

      switch (error) {
        case "invalid-email":
          errorMessage =
          "O valor fornecido para a propriedade do usuário email é inválido!";
          return errorMessage;

        case "wrong-password":
          errorMessage = "Senha errada!";
          return errorMessage;

        case "user-not-found":
          errorMessage = "O usuário não existe.";

          return errorMessage;
        case "user-disable":
          errorMessage = "Esse usuário foi desabilitado.";
          return errorMessage;

        case "too-many-requests":
          errorMessage = "Muitas requisições. Tente mais tarde.";
          return errorMessage;

        case "operation-not-allowed":
          errorMessage = "Login com email e senha não está habilitado.";
          return errorMessage;

        case "email-already-in-use":
          errorMessage =
          "O e-mail fornecido já está em uso por outro usuário. ";
          return errorMessage;

        default:
          errorMessage = "Um erro desconhecido ocorreu.";
          return errorMessage;
      }
    }
  }

//******************************************************************************


  Future<bool> deslogarUsuario() async {

    await  _auth.signOut();

    bool verificarUsuarioDeslogado = checkCurrentUser();
    if (verificarUsuarioDeslogado) {
      return false;
    } else {
      return true;
    }
  }
//******************************************************************************

  Future esqueciSenha(String email) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }

//******************************************************************************

  bool checkCurrentUser() {
    User? user = _auth.currentUser;
    return user != null ? true : false;
  }
}
