import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_list/app/modules/auth/modulo/auth_module.dart';
import 'package:todo_list/app/modules/login/modulo/login_module.dart';

import 'app_controller.dart';
import 'modules/home/modulo/home_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => AppController()),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/', module: AuthModule()),
    ModuleRoute('/home', module: HomeModule()),
    ModuleRoute('/login', module: LoginModule()),
  ];

}