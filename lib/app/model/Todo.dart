import 'package:cloud_firestore/cloud_firestore.dart';

class TodoModel{
  String idUsuario;
  String idTodo;
  String nomeTarefa;
  String tarefa;
  bool   check;

  Timestamp? timestamp;

  TodoModel({
    this.idUsuario = "",
    this.idTodo    = "",
    this.tarefa    = "",
    this.nomeTarefa    = "",
    this.check     = false,
    this.timestamp
  });

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "idUsuario": this.idUsuario,
      "idTodo":    this.idTodo,
      "tarefa":    this.tarefa,
      "check":     this.check,
      "timestamp": this.timestamp
    };
    return map;
  }

  factory TodoModel.fromMap(Map<dynamic, dynamic> dados) {
    return TodoModel(
      idUsuario: dados['idUsuario'] == null ? '' : dados['idUsuario'],
      idTodo:    dados['idTodo']    == null ? '' : dados['idTodo'],
      tarefa:    dados['tarefa']    == null ? '' : dados['tarefa'],
      check:     dados['check']     == null ? false : dados['check'],
      nomeTarefa:dados['nomeTarefas']== null ? '' : dados['nomeTarefas'],
      timestamp:  dados['timestamp'] == null ? Timestamp.now() : dados['timestamp'],
    );
  }
}