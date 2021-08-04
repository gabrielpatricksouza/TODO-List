// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginStore on _LoginStore, Store {
  Computed<bool>? _$finalizarComputed;

  @override
  bool get finalizar => (_$finalizarComputed ??=
          Computed<bool>(() => super.finalizar, name: '_LoginStore.finalizar'))
      .value;

  final _$visualizarAtom = Atom(name: '_LoginStore.visualizar');

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

  final _$emailAtom = Atom(name: '_LoginStore.email');

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

  final _$senhaAtom = Atom(name: '_LoginStore.senha');

  @override
  String get senha {
    _$senhaAtom.reportRead();
    return super.senha;
  }

  @override
  set senha(String value) {
    _$senhaAtom.reportWrite(value, super.senha, () {
      super.senha = value;
    });
  }

  final _$recuperarSenhaAtom = Atom(name: '_LoginStore.recuperarSenha');

  @override
  String get recuperarSenha {
    _$recuperarSenhaAtom.reportRead();
    return super.recuperarSenha;
  }

  @override
  set recuperarSenha(String value) {
    _$recuperarSenhaAtom.reportWrite(value, super.recuperarSenha, () {
      super.recuperarSenha = value;
    });
  }

  final _$carregandoAtom = Atom(name: '_LoginStore.carregando');

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

  final _$resultadoAtom = Atom(name: '_LoginStore.resultado');

  @override
  dynamic get resultado {
    _$resultadoAtom.reportRead();
    return super.resultado;
  }

  @override
  set resultado(dynamic value) {
    _$resultadoAtom.reportWrite(value, super.resultado, () {
      super.resultado = value;
    });
  }

  final _$signInWithEmailAndPasswordAsyncAction =
      AsyncAction('_LoginStore.signInWithEmailAndPassword');

  @override
  Future<dynamic> signInWithEmailAndPassword(dynamic context) {
    return _$signInWithEmailAndPasswordAsyncAction
        .run(() => super.signInWithEmailAndPassword(context));
  }

  final _$_LoginStoreActionController = ActionController(name: '_LoginStore');

  @override
  void boolVisualizar() {
    final _$actionInfo = _$_LoginStoreActionController.startAction(
        name: '_LoginStore.boolVisualizar');
    try {
      return super.boolVisualizar();
    } finally {
      _$_LoginStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String text) {
    final _$actionInfo =
        _$_LoginStoreActionController.startAction(name: '_LoginStore.setEmail');
    try {
      return super.setEmail(text);
    } finally {
      _$_LoginStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSenha(String text) {
    final _$actionInfo =
        _$_LoginStoreActionController.startAction(name: '_LoginStore.setSenha');
    try {
      return super.setSenha(text);
    } finally {
      _$_LoginStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setRecuperarSenha(String text) {
    final _$actionInfo = _$_LoginStoreActionController.startAction(
        name: '_LoginStore.setRecuperarSenha');
    try {
      return super.setRecuperarSenha(text);
    } finally {
      _$_LoginStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
visualizar: ${visualizar},
email: ${email},
senha: ${senha},
recuperarSenha: ${recuperarSenha},
carregando: ${carregando},
resultado: ${resultado},
finalizar: ${finalizar}
    ''';
  }
}
