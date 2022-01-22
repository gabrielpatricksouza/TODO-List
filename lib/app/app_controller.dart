import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_list/app/repository/database.dart';

import 'model/usuario.dart';

part 'app_controller.g.dart';

@Injectable()
class AppController = _AppControllerBase with _$AppController;

abstract class _AppControllerBase with Store {
  UsuarioFirebaseGlobal _acessoUsuarioGlobal = UsuarioFirebaseGlobal();

  @observable
  Usuario usuario = Usuario();

  @action
  recuperarDadosUser() async {
    bool response = _acessoUsuarioGlobal.checkCurrentUser();
    if (response) {
      usuario = await _acessoUsuarioGlobal.recuperarDadosUsuario();
    }
  }

  @action
  limparVariaveis() {
    usuario = Usuario.clean();
  }
}
