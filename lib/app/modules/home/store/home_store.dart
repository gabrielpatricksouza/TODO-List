import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:todo_list/app/app_controller.dart';
import 'package:todo_list/app/model/Lista.dart';
import 'package:todo_list/app/model/Todo.dart';
import 'package:todo_list/app/modules/home/services/todo_service.dart';
import 'package:todo_list/app/widgets/simple_alert.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store{
  TodoService _todoService = TodoService();
  final AppController appController = Modular.get();
  TextEditingController textController = TextEditingController();

  buscarTarefas(Map dados)=> _todoService.listasTarefas(descending, dados);

  @observable
  ObservableList<ListaTarefas> listaTarefasUsuario = ObservableList<ListaTarefas>();

  @observable
  bool importado = false;

  @observable
  bool carregando = false;

  @action
  buscarLista() async {
    carregando = true;

    if(appController.usuario.idUsuario.isNotEmpty){

      ListaTarefas listaTarefas = ListaTarefas();
      List<QueryDocumentSnapshot> lista = [];
      lista = await _todoService.dadosLista();

      for(var dados in lista){
        listaTarefas = ListaTarefas.fromMap(dados.data() as Map);

        if(appController.usuario.idUsuario == listaTarefas.idUsuario ||
            listaTarefas.idImportados!.contains(appController.usuario.idUsuario)
        ){
          listaTarefasUsuario.add(listaTarefas);
        }
      }
      carregando = false;
    }
    else{
      await appController.recuperarDadosUser();
      buscarLista();
    }
  }

  @observable
  bool descending = false;

  @action
  mudarOrdem(Map dados){
    descending = !descending;
    buscarTarefas(dados);
  }

  converterParaTodo(DocumentSnapshot dados){
    return TodoModel.fromMap(dados.data() as Map);
  }

  adicionarLista()async{
    ListaTarefas listaTarefas = ListaTarefas();
    if(appController.usuario.idUsuario.isNotEmpty){
      listaTarefas.nome = textController.text;
      listaTarefas.idUsuario = appController.usuario.idUsuario;
      textController.text = "";

      _todoService.adicionarLista(listaTarefas);
      listaTarefasUsuario.clear();
      buscarLista();

    }else{
      await appController.recuperarDadosUser();
      adicionarLista();
    }

    Modular.to.pop();
  }

  deletarLista(ListaTarefas lista){
    if(appController.usuario.idUsuario == lista.idUsuario){
      _todoService.deletarLista(lista);

    }else if(lista.idImportados!.isNotEmpty){
      print(appController.usuario.idUsuario);
      _todoService.deletarImportado(lista, appController.usuario.idUsuario);
    }
  }

  importarLista(context)async{

    if(appController.usuario.idUsuario.isNotEmpty) {
      bool response = await _todoService.importarLista(
          textController.text,
          appController.usuario.idUsuario
      );
      if(response == false){
        simpleCustomAlert(
            context,
            AlertType.info,
            "ATENÇÃO",
            "O código inserido é inválido!"
        );
      }else{
        listaTarefasUsuario.clear();
        buscarLista();
        Modular.to.pop();
      }
      
    }else{
      appController.recuperarDadosUser();
      Modular.to.pop();
    }
  }

  adicionarTarefa(TodoModel todo){

    todo.tarefa = textController.text;
    todo.timestamp = Timestamp.now();
    textController.text = "";

    _todoService.adicionarTodo(todo);
    Modular.to.pop();
  }

  editarTarefa(TodoModel todo){
    todo.tarefa = textController.text;
    textController.text = "";

    _todoService.editarTodo(todo);
    Modular.to.pop();
  }

  deletarTarefa(TodoModel todo){
    _todoService.deletarTodo(todo);
  }

  atualizarCheck(TodoModel todo){
    _todoService.atualizarTodo(todo);
  }

  manipularTexto(String text){
    textController.text = text;
  }

}