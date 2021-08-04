import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';

class IntroScreen extends StatefulWidget {

  @override
  IntroScreenState createState() => new IntroScreenState();
}

class IntroScreenState extends State<IntroScreen> {
  List<Slide> slides = [];

  @override
  void initState() {
    super.initState();

    slides.add(
      new Slide(
        title: "MEU-TODO",
        description: "É um aplicativo onde será possível inserir, editar e excluir itens, além de poder compartilhar para outras pessoas.",
        pathImage: "assets/intro/todo_list.png",
        backgroundColor:  Color(0xff982ace),
      ),
    );
    slides.add(
      new Slide(
        title: "Adicionar lista",
        description: "Clique no botão verde para adicionar uma nova lista de tarefa",
        pathImage: "assets/intro/intro1.png",
        heightImage: 350,
        widthImage: 350,
        backgroundColor: Color(0xff9932cc),
      ),
    );
    slides.add(
      new Slide(
        title: "Adicionar lista",
        description: "Coloque o nome da sua lista de tarefa",
        pathImage: "assets/intro/intro2.png",
        heightImage: 350,
        widthImage: 350,
        backgroundColor: Color(0xff9e3cce),
      ),
    );

    slides.add(
      new Slide(
        title: "Importar lista",
        description: "Ao clicar no icone de dowloand, você pode importar outras listas",
        pathImage: "assets/intro/intro6.png",
        heightImage: 350,
        widthImage: 350,
        backgroundColor: Color(0xff9f40ce),
      ),
    );

    slides.add(
      new Slide(
        title: "Adicionar Tarefa",
        description: "Clique na lista de tarefa que você criou",
        pathImage: "assets/intro/intro1.png",
        heightImage: 350,
        widthImage: 350,
        backgroundColor: Color(0xffa243d0),
      ),
    );

    slides.add(
      new Slide(
        title: "Adicionar Tarefa",
        description: "Clique na lista de tarefa que você criou",
        pathImage: "assets/intro/intro3.png",
        heightImage: 350,
        widthImage: 350,
        backgroundColor: Color(0xffa243d0),
      ),
    );

    slides.add(
      new Slide(
        title: "Adicionar Tarefa",
        description: "Ao clicar no botão (+), adicione uma tarefa",
        pathImage: "assets/intro/intro4.png",
        heightImage: 350,
        widthImage: 350,
        backgroundColor: Color(0xffa54cd0),
      ),
    );

    slides.add(
      new Slide(
        title: "Editar Tarefa",
        description: "Ao clicar na tarefa, você pode editar-la",
        pathImage: "assets/intro/intro4.png",
        heightImage: 350,
        widthImage: 350,
        backgroundColor: Color(0xffa54cd0),
      ),
    );

    slides.add(
      new Slide(
        title: "Deletar",
        description: "Apague tanto lista, quanto tarefa apenas arrastando para o lado",
        pathImage: "assets/intro/intro7.png",
        heightImage: 350,
        widthImage: 350,
        backgroundColor: Color(0xffa54cd0),
      ),
    );
  }

  void onDonePress() {
    Modular.to.pop();
  }

  @override
  Widget build(BuildContext context) {
    return new IntroSlider(
      slides: this.slides,
      onDonePress: this.onDonePress,
    );
  }
}