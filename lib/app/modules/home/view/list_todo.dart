import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_list/app/model/Todo.dart';
import 'package:todo_list/app/modules/home/store/home_store.dart';
import 'package:todo_list/app/modules/home/view/widget_todo.dart';

class ListTodo extends StatefulWidget {
  final Map dadosTarefa;
  const ListTodo({Key? key,required this.dadosTarefa}) : super(key: key);

  @override
  _ListTodoState createState() => _ListTodoState();
}

class _ListTodoState extends ModularState<ListTodo, HomeStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF7C83FD),
      appBar: AppBar(
        title: Text(
            widget.dadosTarefa['nome'],
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.white.withOpacity(0.8)
          ),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.white
        ),
        backgroundColor: Color(0XFF7C83FD),
        elevation: 2.0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Observer(
              builder:(_) => IconButton(
                  onPressed: ()=> setState(() => controller.mudarOrdem(widget.dadosTarefa)),
                  iconSize: 28,
                  color: Colors.white70,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  icon: Icon(
                    controller.descending
                      ? Icons.arrow_circle_up_rounded
                      : Icons.arrow_circle_down_rounded,)
              ),
            ),
          ),
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: controller.buscarTarefas(widget.dadosTarefa),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Container(
                color: Color(0XFFFF4C29),
                child: Center(
                  child: Text("Ocorreu um erro ao carregar lista!"),
                ),
              );

            } else if (!snapshot.hasData) {

              return Center(child: CircularProgressIndicator());
            } else {

              return NotificationListener<OverscrollIndicatorNotification>(
                onNotification: (OverscrollIndicatorNotification overscroll) {
                  overscroll.disallowGlow();
                  return true;
                },
                child: ListView.separated(
                  separatorBuilder: (context, index) => Divider(
                    height: 10, color: Colors.grey[700],),

                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    TodoModel todo = controller
                        .converterParaTodo(snapshot.data!.docs[index]);

                    return Dismissible(
                      direction: DismissDirection.startToEnd,

                      child: ListTile(
                        title: Text(
                            todo.tarefa,
                          style: TextStyle(
                            fontSize: 18
                          ),
                        ),

                        trailing: Checkbox(
                          value: todo.check,
                          checkColor: Color(0XFF0A1931),
                          onChanged: (bool? value) {
                            todo.check = value!;
                            todo.idUsuario = widget.dadosTarefa["idUsuario"];
                            todo.nomeTarefa = widget.dadosTarefa["nome"];
                            controller.atualizarCheck(todo);
                          },
                        ),
                        onTap: () {
                          todo.idUsuario = widget.dadosTarefa["idUsuario"];
                          todo.nomeTarefa = widget.dadosTarefa["nome"];
                          controller.manipularTexto(todo.tarefa);
                          showDialog(
                              context: context,
                              builder: (_) => HomeTodo(
                                  todoModel: todo,
                                  action: "Editar",
                                  controller: controller));
                        },
                      ),
                      onDismissed: (direction){
                        todo.idUsuario = widget.dadosTarefa["idUsuario"];
                        todo.nomeTarefa = widget.dadosTarefa["nome"];
                        controller.deletarTarefa(todo);
                      },

                      background: Container(
                        color: Colors.red,
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Icon(Icons.delete_forever_outlined),
                        ),
                      ),

                      key: ValueKey(snapshot.data!.docs.length),
                    );
                  },
                ),
              );
            }
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.manipularTexto("");
          TodoModel todoModel = TodoModel();
          todoModel.idUsuario = widget.dadosTarefa['idUsuario'];
          todoModel.nomeTarefa = widget.dadosTarefa['nome'];

          showDialog(
              context: context,
              builder: (_) =>
                  HomeTodo(action: "Adicionar",
                      controller: controller,
                      todoModel: todoModel,
                  ));
        },
        backgroundColor: Color(0XFF7DEDFF),
        child: Icon(
            Icons.add,
            size: 30,
            color: Color(0XFF0A1931),
        ),
      ),
    );
  }
}
