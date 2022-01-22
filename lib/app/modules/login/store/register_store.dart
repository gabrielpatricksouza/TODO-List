import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:todo_list/app/BO/bo_cadastro.dart';
import 'package:todo_list/app/app_controller.dart';
import 'package:todo_list/app/model/usuario.dart';
import 'package:todo_list/app/modules/login/repository/login_service.dart';
import 'package:todo_list/app/widgets/simple_alert.dart';
part 'register_store.g.dart';

class RegisterStore = _RegisterStore with _$RegisterStore;

abstract class _RegisterStore with Store {
  LoginService _loginService = LoginService();
  AppController appController = Modular.get();

  final nomeController = TextEditingController();
  final emailController = TextEditingController();
  final senhaController = TextEditingController();
  final senha2Controller = TextEditingController();

  @observable
  String nome = "";

  @action
  void setNome(String text) => nome = text;

  @observable
  String email = "";

  @action
  void setEmail(String text) => email = text;

  @observable
  String senha1 = "";

  @action
  void setSenha1(String text) => senha1 = text;

  @observable
  String senha2 = "";

  @action
  void setSenha2(String text) => senha2 = text;

  @observable
  bool visualizar = true;

  @action
  void boolVisualizar() => visualizar = !visualizar;

  @observable
  bool visualizar2 = true;

  @action
  void boolVisualizar2() => visualizar2 = !visualizar2;

  @observable
  bool carregando = false;

  @action
  Future<void> _cadastrarUsuario(context) async {
    dynamic _resultado;
    carregando = true;
    Usuario usuario = Usuario();

    usuario.nome = nome.trim();
    usuario.senha = senha1.trim();
    usuario.email = email.trim();

    _resultado = await _loginService.cadastrarUsuario(usuario);

    carregando = false;

    if (_resultado != true) {
      simpleCustomAlert(context, AlertType.error, "ATENÇÃO", _resultado);
    } else {
      Modular.to.navigate("/home");
      await appController.recuperarDadosUser();
    }
  }

  @observable
  bool next = false;

  @action
  mudarNext() => next = false;

  @action
  void validandoNomeEmail(context) {
    String _respostaBO;

    var _validarCadastro = ValidarCadastro(
        nome.trim(), senha1.trim(), senha2.trim(), email.trim());
    _respostaBO = _validarCadastro.validandoNomeEmail();

    if (_respostaBO != "Valido") {
      simpleCustomAlert(context, AlertType.info, "ATENÇÃO", _respostaBO);
    } else
      next = true;
  }

  @action
  void validandoSenhas(context) {
    String _respostaBO;

    var _validarCadastro = ValidarCadastro(
        nome.trim(), senha1.trim(), senha2.trim(), email.trim());
    _respostaBO = _validarCadastro.validandoSenhas();

    if (_respostaBO != "Valido") {
      simpleCustomAlert(context, AlertType.info, "ATENÇÃO", _respostaBO);
    } else
      _cadastrarUsuario(context);
  }
}
