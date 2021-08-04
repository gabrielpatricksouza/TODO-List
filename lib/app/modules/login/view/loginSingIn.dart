import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_list/app/modules/login/store/login_store.dart';
import 'package:todo_list/app/widgets/custom_animated_button.dart';
import 'package:todo_list/app/widgets/input_customizado.dart';

class SingIn extends StatelessWidget {
  final LoginStore _controllerLogin = Modular.get();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),

      child: Scaffold(
        backgroundColor: Colors.deepPurpleAccent,
        body: Observer(
          builder: (_) =>  Stack(
            children: [

              if(_controllerLogin.carregando == false)
              Positioned(
                  top: 20,
                  left: 0,
                  child: IconButton(
                      icon: Icon(Icons.arrow_back_ios_outlined),
                      iconSize: 30,
                      onPressed: () => Navigator.pop(context)
                  ),
              ),

            if (_controllerLogin.carregando) Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Center(child: CircularProgressIndicator())
                    ],
                  ),
                ) else SafeArea(
                  child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 38.0),
                  child: NotificationListener<OverscrollIndicatorNotification>(
                    onNotification: (OverscrollIndicatorNotification overscroll) {
                      overscroll.disallowGlow();
                      return true;
                    },
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 100,),

                          Text(
                            "MEU\nLOGIN",
                            style: TextStyle(
                                fontSize: MediaQuery.of(context).size.width / 8,
                                fontWeight: FontWeight.bold,
                                color: Colors.white70),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 100,),

                          InputCustomizado(
                              icon: Icons.mail,
                              labelText: "E-mail",
                              labelStyle: TextStyle(
                                color: Colors.white
                              ),
                              fillColor:  Colors.white.withOpacity(0.2),
                              keyboardType: TextInputType.emailAddress,
                              controller: _controllerLogin.emailController,
                              onChanged: _controllerLogin.setEmail,
                            ),
                          SizedBox(height: 20),

                      Observer(
                            builder: (_) => InputCustomizado(
                              icon: Icons.lock,
                              labelText: "Senha",
                              labelStyle: TextStyle(
                                  color: Colors.white
                              ),
                              fillColor:  Colors.white.withOpacity(0.2),
                              suffixIcon: GestureDetector(
                                onTap: _controllerLogin.boolVisualizar,
                                child:  Icon(_controllerLogin.visualizar
                                    ?  Icons.visibility_off
                                    :  Icons.visibility, color: Colors.white,),
                              ),
                              controller: _controllerLogin.senhaController,
                              obscure: _controllerLogin.visualizar,
                              onChanged: _controllerLogin.setSenha,
                              keyboardType: TextInputType.visiblePassword,
                            ),
                          ),
                          SizedBox(height: 30),

                          CustomAnimatedButton(
                            onTap: () {
                              _controllerLogin.signInWithEmailAndPassword(context);
                            },
                            widhtMultiply: 1,
                            height: 60,
                            color: Color(0XFF338fa0),
                            text: "Entrar",
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
        )
      ),
    );
  }
}
