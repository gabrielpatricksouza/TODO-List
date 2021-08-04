import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_list/app/services/database.dart';

import 'model/Usuario.dart';

part 'app_controller.g.dart';

@Injectable()
class AppController = _AppControllerBase with _$AppController;

abstract class _AppControllerBase with Store {

  DataBaseGlobal _acessoBDGlobal = DataBaseGlobal();

  @observable
  Usuario usuario = Usuario();

  @action
  recuperarDadosUser() async {
    bool response = _acessoBDGlobal.checkCurrentUser();
    if(response){
      usuario = await _acessoBDGlobal.recuperarDadosUsuario();
    }
  }

  @action
  limparVariaveis(){
    usuario = Usuario.clean();
  }
}
