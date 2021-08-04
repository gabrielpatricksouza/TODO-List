import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_list/app/model/Todo.dart';
import 'package:todo_list/app/modules/home/store/home_store.dart';

class HomeTodo extends StatelessWidget {
  final String action;
  final String hintText;
  final String buttomText;
  final HomeStore controller;
  final TodoModel? todoModel;

  HomeTodo({Key? key, required this.controller, required this.action, this.todoModel, this.hintText = "Tarefa", this.buttomText = "Salvar", }) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)
        ),
        backgroundColor: Colors.white.withOpacity(.3),
        title: Text(action),
        content: TextFormField(
          maxLength: action == "Importar" ? 20 : 65,
          validator: (text) {
          if (text == null || text.isEmpty) {
            return action == "Importar" ? 'Insira o código' : 'Insira uma tarefa';
          }
          return null;
        },
          decoration: InputDecoration(
              hintText: hintText,
              border: OutlineInputBorder()
          ),
          controller: controller.textController,
        ),

        actions: [
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            margin: const EdgeInsets.only(bottom: 10.0),
            child: TextButton(
                onPressed: (){
                  if (_formKey.currentState!.validate()) {

                    if(action == "Adicionar")controller.adicionarTarefa(todoModel!);
                    if(action == "Lista")controller.adicionarLista();
                    if(action == "Editar")controller.editarTarefa(todoModel!);
                    if(action == "Importar")controller.importarLista(context);
                  }
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(0XFF88FFF7).withOpacity(.8))
                ),
                child: Text(
                    buttomText,
                  style: TextStyle(
                    color: Color(0XFF0A1931),
                    fontSize: 18
                  ),
                )
            ),
          )
        ],
      ),
    );
  }
}
