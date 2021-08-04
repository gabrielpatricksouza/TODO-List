import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_list/app/modules/login/store/register_store.dart';
import 'package:todo_list/app/widgets/custom_animated_button.dart';
import 'package:todo_list/app/widgets/input_customizado.dart';

class SingUp extends StatelessWidget {
  final RegisterStore _controllerLogin = Modular.get();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
          backgroundColor: Colors.deepPurpleAccent,
          body: Observer(
            builder: (_) => Stack(
              children: [
                if (_controllerLogin.carregando == false)
                  Positioned(
                    top: 20,
                    left: 0,
                    child: IconButton(
                        icon: Icon(Icons.arrow_back_ios_outlined),
                        iconSize: 30,
                        onPressed: () => Navigator.pop(context)),
                  ),
                _controllerLogin.carregando
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Center(child: CircularProgressIndicator())
                          ],
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 38.0),
                        child: NotificationListener<
                            OverscrollIndicatorNotification>(
                          onNotification:
                              (OverscrollIndicatorNotification overscroll) {
                            overscroll.disallowGlow();
                            return true;
                          },
                          child: SingleChildScrollView(
                            child: Observer(
                              builder: (_) => Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 100,
                                  ),
                                  Text(
                                    "MEU\nCADASTRO",
                                    style: TextStyle(
                                        fontSize: MediaQuery.of(context).size.width / 8,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white70),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                    height: 100,
                                  ),
                                  if (_controllerLogin.next != true) ...[
                                    InputCustomizado(
                                      icon: Icons.person,
                                      labelText: "Nome",
                                      labelStyle:
                                          TextStyle(color: Colors.white),
                                      fillColor: Colors.white.withOpacity(0.2),
                                      keyboardType: TextInputType.text,
                                      controller:
                                          _controllerLogin.nomeController,
                                      onChanged: _controllerLogin.setNome,
                                    ),
                                    SizedBox(height: 20),
                                    InputCustomizado(
                                      icon: Icons.mail,
                                      labelText: "E-mail",
                                      labelStyle:
                                          TextStyle(color: Colors.white),
                                      fillColor: Colors.white.withOpacity(0.2),
                                      keyboardType: TextInputType.emailAddress,
                                      controller:
                                          _controllerLogin.emailController,
                                      onChanged: _controllerLogin.setEmail,
                                    ),
                                    SizedBox(height: 20),
                                  ] else ...[
                                    InputCustomizado(
                                      icon: Icons.lock,
                                      labelText: "Senha",
                                      labelStyle:
                                          TextStyle(color: Colors.white),
                                      fillColor: Colors.white.withOpacity(0.2),
                                      suffixIcon: GestureDetector(
                                        onTap: _controllerLogin.boolVisualizar,
                                        child: Icon(
                                          _controllerLogin.visualizar
                                              ? Icons.visibility_off
                                              : Icons.visibility,
                                          color:  Colors.white,
                                        ),
                                      ),
                                      controller:
                                          _controllerLogin.senhaController,
                                      obscure: _controllerLogin.visualizar,
                                      onChanged: _controllerLogin.setsenha1,
                                      keyboardType:
                                          TextInputType.visiblePassword,
                                    ),
                                    SizedBox(height: 20),
                                    InputCustomizado(
                                      icon: Icons.lock,
                                      hintText: "Confirmar Senha",
                                      labelStyle:
                                      TextStyle(color: Colors.white),
                                      fillColor: Colors.white.withOpacity(0.2),
                                      suffixIcon: GestureDetector(
                                        onTap: _controllerLogin.boolVisualizar2,
                                        child: Icon(
                                          _controllerLogin.visualizar2
                                              ? Icons.visibility_off
                                              : Icons.visibility,
                                          color:  Colors.white,
                                        ),
                                      ),
                                      controller:
                                          _controllerLogin.senha2Controller,
                                      obscure: _controllerLogin.visualizar2,
                                      onChanged: _controllerLogin.setsenha2,
                                      keyboardType:
                                          TextInputType.visiblePassword,
                                    ),
                                    SizedBox(height: 20),
                                  ],
                                  _controllerLogin.next == false
                                      ? Padding(
                                          padding:
                                              const EdgeInsets.only(top: 10.0),
                                          child: Column(
                                            children: [
                                              CustomAnimatedButton(
                                                onTap: () {
                                                  _controllerLogin
                                                      .validandoNomeEmail(context);
                                                  FocusScope.of(context).unfocus();
                                                },
                                                widhtMultiply: 1,
                                                height: 60,
                                                color: Color(0XFF338fa0),
                                                text: "Próximo",
                                              ),
                                            ],
                                          )
                                        )
                                      : Padding(
                                          padding:
                                              const EdgeInsets.only(top: 10.0),
                                          child: Column(
                                            children: [
                                              CustomAnimatedButton(
                                                onTap: () {
                                                  _controllerLogin
                                                      .validandoSenhas(context);
                                                  FocusScope.of(context).unfocus();
                                                },
                                                widhtMultiply: 1,
                                                height: 60,
                                                color: Color(0XFF338fa0),
                                                text: "Cadastrar",
                                              ),
                                              SizedBox(height: 20.0,),

                                              CustomAnimatedButton(
                                                onTap: () {
                                                  _controllerLogin.mudarNext();
                                                  FocusScope.of(context).unfocus();
                                                },
                                                widhtMultiply: 1,
                                                height: 60,
                                                color: Color(0XFF338fa0),
                                                text: "Voltar",
                                              ),
                                            ],
                                          ),
                                        ),
                                  SizedBox(height: 10),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
              ],
            ),
          )),
    );
  }
}
