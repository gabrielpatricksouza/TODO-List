// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RegisterStore on _RegisterStore, Store {
  final _$nomeAtom = Atom(name: '_RegisterStore.nome');

  @override
  String get nome {
    _$nomeAtom.reportRead();
    return super.nome;
  }

  @override
  set nome(String value) {
    _$nomeAtom.reportWrite(value, super.nome, () {
      super.nome = value;
    });
  }

  final _$emailAtom = Atom(name: '_RegisterStore.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$senha1Atom = Atom(name: '_RegisterStore.senha1');

  @override
  String get senha1 {
    _$senha1Atom.reportRead();
    return super.senha1;
  }

  @override
  set senha1(String value) {
    _$senha1Atom.reportWrite(value, super.senha1, () {
      super.senha1 = value;
    });
  }

  final _$senha2Atom = Atom(name: '_RegisterStore.senha2');

  @override
  String get senha2 {
    _$senha2Atom.reportRead();
    return super.senha2;
  }

  @override
  set senha2(String value) {
    _$senha2Atom.reportWrite(value, super.senha2, () {
      super.senha2 = value;
    });
  }

  final _$visualizarAtom = Atom(name: '_RegisterStore.visualizar');

  @override
  bool get visualizar {
    _$visualizarAtom.reportRead();
    return super.visualizar;
  }

  @override
  set visualizar(bool value) {
    _$visualizarAtom.reportWrite(value, super.visualizar, () {
      super.visualizar = value;
    });
  }

  final _$visualizar2Atom = Atom(name: '_RegisterStore.visualizar2');

  @override
  bool get visualizar2 {
    _$visualizar2Atom.reportRead();
    return super.visualizar2;
  }

  @override
  set visualizar2(bool value) {
    _$visualizar2Atom.reportWrite(value, super.visualizar2, () {
      super.visualizar2 = value;
    });
  }

  final _$carregandoAtom = Atom(name: '_RegisterStore.carregando');

  @override
  bool get carregando {
    _$carregandoAtom.reportRead();
    return super.carregando;
  }

  @override
  set carregando(bool value) {
    _$carregandoAtom.reportWrite(value, super.carregando, () {
      super.carregando = value;
    });
  }

  final _$nextAtom = Atom(name: '_RegisterStore.next');

  @override
  bool get next {
    _$nextAtom.reportRead();
    return super.next;
  }

  @override
  set next(bool value) {
    _$nextAtom.reportWrite(value, super.next, () {
      super.next = value;
    });
  }

  final _$_cadastrarUsuarioAsyncAction =
      AsyncAction('_RegisterStore._cadastrarUsuario');

  @override
  Future<dynamic> _cadastrarUsuario(dynamic context) {
    return _$_cadastrarUsuarioAsyncAction
        .run(() => super._cadastrarUsuario(context));
  }

  final _$_RegisterStoreActionController =
      ActionController(name: '_RegisterStore');

  @override
  void setNome(String text) {
    final _$actionInfo = _$_RegisterStoreActionController.startAction(
        name: '_RegisterStore.setNome');
    try {
      return super.setNome(text);
    } finally {
      _$_RegisterStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String text) {
    final _$actionInfo = _$_RegisterStoreActionController.startAction(
        name: '_RegisterStore.setEmail');
    try {
      return super.setEmail(text);
    } finally {
      _$_RegisterStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setsenha1(String text) {
    final _$actionInfo = _$_RegisterStoreActionController.startAction(
        name: '_RegisterStore.setsenha1');
    try {
      return super.setsenha1(text);
    } finally {
      _$_RegisterStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setsenha2(String text) {
    final _$actionInfo = _$_RegisterStoreActionController.startAction(
        name: '_RegisterStore.setsenha2');
    try {
      return super.setsenha2(text);
    } finally {
      _$_RegisterStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void boolVisualizar() {
    final _$actionInfo = _$_RegisterStoreActionController.startAction(
        name: '_RegisterStore.boolVisualizar');
    try {
      return super.boolVisualizar();
    } finally {
      _$_RegisterStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void boolVisualizar2() {
    final _$actionInfo = _$_RegisterStoreActionController.startAction(
        name: '_RegisterStore.boolVisualizar2');
    try {
      return super.boolVisualizar2();
    } finally {
      _$_RegisterStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic mudarNext() {
    final _$actionInfo = _$_RegisterStoreActionController.startAction(
        name: '_RegisterStore.mudarNext');
    try {
      return super.mudarNext();
    } finally {
      _$_RegisterStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validandoNomeEmail(dynamic context) {
    final _$actionInfo = _$_RegisterStoreActionController.startAction(
        name: '_RegisterStore.validandoNomeEmail');
    try {
      return super.validandoNomeEmail(context);
    } finally {
      _$_RegisterStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validandoSenhas(dynamic context) {
    final _$actionInfo = _$_RegisterStoreActionController.startAction(
        name: '_RegisterStore.validandoSenhas');
    try {
      return super.validandoSenhas(context);
    } finally {
      _$_RegisterStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
nome: ${nome},
email: ${email},
senha1: ${senha1},
senha2: ${senha2},
visualizar: ${visualizar},
visualizar2: ${visualizar2},
carregando: ${carregando},
next: ${next}
    ''';
  }
}
