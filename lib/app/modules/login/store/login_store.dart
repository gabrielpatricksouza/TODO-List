import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:todo_list/app/app_controller.dart';
import 'package:todo_list/app/model/Usuario.dart';
import 'package:todo_list/app/modules/login/repositories/db_user.dart';
import 'package:todo_list/app/widgets/simple_alert.dart';
part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store{
  Usuario _usuario = Usuario();
  ConexaoBD _acessoBD = ConexaoBD();
  AppController appController = Modular.get();

  final emailController = TextEditingController();
  final senhaController = TextEditingController();

  @observable
  bool visualizar  = true;

  @action
  void boolVisualizar() => visualizar = !visualizar;

  @observable
  String email = "";

  @action
  void setEmail(String text) => email = text;

  @observable
  String senha = "";

  @action
  void setSenha(String text) => senha = text;

  @observable
  String recuperarSenha = "";

  @action
  void setRecuperarSenha(String text) => recuperarSenha = text;

  @computed
  bool get finalizar => email.isNotEmpty && senha.isNotEmpty;

  @observable
  bool carregando  = false;

  @observable
  dynamic resultado = false;

  @action
  Future signInWithEmailAndPassword(context) async {

    if(finalizar){
      carregando = true;

      _usuario.email = email.trim();
      _usuario.senha = senha.trim();

      resultado = await _acessoBD.logarUsuario(_usuario);
      carregando = false;

      if(resultado != true){
        simpleCustomAlert(context, AlertType.info, "ATENÇÃO", resultado);
      }
      else{
        Modular.to.navigate("/home");
        await appController.recuperarDadosUser();
      }
    }
    else simpleCustomAlert(
        context,
        AlertType.info,
        "ATENÇÃO",
        "Preencha todos os campos para prosseguirmos!"
    );
  }
}

