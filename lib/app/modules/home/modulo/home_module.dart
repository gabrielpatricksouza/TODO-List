import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_list/app/modules/home/store/home_store.dart';
import 'package:todo_list/app/modules/home/view/list_page.dart';
import 'package:todo_list/app/modules/home/view/list_todo.dart';
 
class HomeModule extends Module {
  @override
  final List<Bind> binds = [
 Bind.lazySingleton((i) => HomeStore()),
 ];

 @override
 final List<ModularRoute> routes = [
   ChildRoute(Modular.initialRoute, child: (_, args) => ListPage()),
   ChildRoute("/listTodo", child: (_, args) => ListTodo( dadosTarefa: args.data)),
 ];
}