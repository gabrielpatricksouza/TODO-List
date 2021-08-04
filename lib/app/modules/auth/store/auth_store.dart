import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:todo_list/app/app_controller.dart';
import 'package:todo_list/app/modules/auth/services/auth_service.dart';
part 'auth_store.g.dart';

class AuthStore = _AuthStore with _$AuthStore;

abstract class _AuthStore with Store{

  AuthSevice _acessoBD = AuthSevice();
  AppController _appController = Modular.get();

  void verificarUsuarioLogado() {
    final usuarioLogado = _acessoBD.checkCurrentUser();
    if (usuarioLogado){
      _appController.recuperarDadosUser();
      Modular.to.navigate('/home');
    }
    else Modular.to.navigate('/login');
  }

}
