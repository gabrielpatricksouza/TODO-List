// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on _HomeStore, Store {
  final _$listaTarefasUsuarioAtom =
      Atom(name: '_HomeStore.listaTarefasUsuario');

  @override
  ObservableList<ListaTarefas> get listaTarefasUsuario {
    _$listaTarefasUsuarioAtom.reportRead();
    return super.listaTarefasUsuario;
  }

  @override
  set listaTarefasUsuario(ObservableList<ListaTarefas> value) {
    _$listaTarefasUsuarioAtom.reportWrite(value, super.listaTarefasUsuario, () {
      super.listaTarefasUsuario = value;
    });
  }

  final _$carregandoAtom = Atom(name: '_HomeStore.carregando');

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

  final _$descendingAtom = Atom(name: '_HomeStore.descending');

  @override
  bool get descending {
    _$descendingAtom.reportRead();
    return super.descending;
  }

  @override
  set descending(bool value) {
    _$descendingAtom.reportWrite(value, super.descending, () {
      super.descending = value;
    });
  }

  final _$buscarListaAsyncAction = AsyncAction('_HomeStore.buscarLista');

  @override
  Future buscarLista() {
    return _$buscarListaAsyncAction.run(() => super.buscarLista());
  }

  final _$_HomeStoreActionController = ActionController(name: '_HomeStore');

  @override
  dynamic mudarOrdem(Map<dynamic, dynamic> dados) {
    final _$actionInfo =
        _$_HomeStoreActionController.startAction(name: '_HomeStore.mudarOrdem');
    try {
      return super.mudarOrdem(dados);
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listaTarefasUsuario: ${listaTarefasUsuario},
carregando: ${carregando},
descending: ${descending}
    ''';
  }
}
