import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:share/share.dart';
import 'package:todo_list/app/modules/home/store/home_store.dart';
import 'package:todo_list/app/modules/home/view/widget_todo.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends ModularState<ListPage, HomeStore> {
  @override
  void initState() {
    controller.buscarLista();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      appBar: AppBar(
        title: Text(
          'TO-DO',
          style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white.withOpacity(0.8)),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
        elevation: 2.0,
        iconTheme: IconThemeData(color: Colors.white),
        leading: IconButton(
            onPressed: () {
              controller.manipularTexto("");
              showDialog(
                  context: context,
                  builder: (_) => HomeTodo(
                    action: "Importar",
                    controller: controller,
                    hintText: "Código",
                    buttomText: "Utilizar",
                  ));
            },
            icon: Icon(Icons.download_rounded)
        ),
        actions: [
          IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Modular.to.navigate('/');
              },
              icon: Icon(Icons.exit_to_app))
        ],
      ),
      body: Observer(
        builder: (_) => controller.carregando
            ? Center(child: CircularProgressIndicator(color: Colors.white,))
            : controller.listaTarefasUsuario.length == 0
                ? Center(
                    child: Text(
                      "Sem Lista",
                      style: TextStyle(fontSize: 25, color: Colors.black),
                    ),
                  )
                : NotificationListener<OverscrollIndicatorNotification>(
                    onNotification:
                        (OverscrollIndicatorNotification overscroll) {
                      overscroll.disallowGlow();
                      return true;
                    },
                    child: ListView.builder(
                      itemCount: controller.listaTarefasUsuario.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Material(
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                            ),
                            color: Color(0XFF7C83FD),
                            
                            child: Dismissible(
                              direction: DismissDirection.startToEnd,
                              
                              child: ListTile(

                                title: Text(
                                  controller.listaTarefasUsuario[index].nome,
                                  style: TextStyle(fontSize: 22),
                                ),

                                trailing: IconButton(
                                    onPressed: (){
                                      Share.share('Código para importação:  ${controller.listaTarefasUsuario[index].idLista}');
                                    },
                                    icon: Icon(Icons.share_rounded)
                                ),

                                onTap: () {
                                  Modular.to
                                      .pushNamed("/home/listTodo", arguments: {
                                    'nome': controller.listaTarefasUsuario[index].nome,
                                    'idUsuario': controller.listaTarefasUsuario[index].idUsuario,
                                  });
                                },
                              ),
                              onDismissed: (direction) {
                                controller.deletarLista(controller
                                    .listaTarefasUsuario[index]);
                              },
                              background: Container(
                                
                                alignment: Alignment.centerLeft,
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Icon(Icons.delete_forever_outlined),
                                ),
                              ),
                              key: ValueKey(controller.listaTarefasUsuario.length),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.manipularTexto("");
          showDialog(
              context: context,
              builder: (_) =>
                  HomeTodo(action: "Lista", controller: controller, hintText: "Título da tarefa",));
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
