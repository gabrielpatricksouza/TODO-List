import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_list/app/model/lista.dart';
import 'package:todo_list/app/model/todo.dart';

class TodoService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot> listasTarefas(bool descending, Map dados) {
    return _firestore
        .collection("tarefas")
        .doc(dados["idUsuario"])
        .collection(dados["nome"])
        .orderBy("timestamp", descending: descending)
        .snapshots();
  }

  Future<List<QueryDocumentSnapshot>> dadosLista() async {
    List<QueryDocumentSnapshot> lista = [];

    QuerySnapshot<Map<String, dynamic>> snapshot =
        await _firestore.collection("listas").get();

    for (var dados in snapshot.docs) {
      lista.add(dados);
    }
    return lista;
  }

  void adicionarLista(ListaTarefas lista) {
    lista.idLista = _firestore.collection("listas").doc().id;
    _firestore.collection("listas").doc(lista.idLista).set(lista.toMap());
  }

  void deletarLista(ListaTarefas lista) {
    _firestore.collection("listas").doc(lista.idLista).delete();
  }

  Future<bool> deletarImportado(ListaTarefas lista, String idUsuario) async {
    var dados = await _firestore.collection("listas").doc(lista.idLista).get();
    if (dados.exists) {
      lista = ListaTarefas.fromMap(dados.data() as Map);
      lista.idImportados!.remove(idUsuario);
      _firestore.collection("listas").doc(lista.idLista).update(lista.toMap());
      return true;
    }
    return false;
  }

  Future<bool> importarLista(String idLista, String idUsuario) async {
    ListaTarefas listaTarefas = ListaTarefas();
    var dados = await _firestore.collection("listas").doc(idLista).get();
    if (dados.exists) {
      listaTarefas = ListaTarefas.fromMap(dados.data() as Map);
      listaTarefas.idImportados!.add(idUsuario);
      _firestore.collection("listas").doc(idLista).update(listaTarefas.toMap());
      return true;
    }
    return false;
  }

  void adicionarTodo(TodoModel todo) {
    String idDoc = _firestore.collection("tarefas").doc().id;
    todo.idTodo = idDoc;
    _firestore
        .collection("tarefas")
        .doc(todo.idUsuario)
        .collection(todo.nomeTarefa)
        .doc(idDoc)
        .set(todo.toMap());
  }

  void editarTodo(TodoModel todo) {
    _firestore
        .collection("tarefas")
        .doc(todo.idUsuario)
        .collection(todo.nomeTarefa)
        .doc(todo.idTodo)
        .update(todo.toMap());
  }

  void deletarTodo(TodoModel todo) {
    _firestore
        .collection("tarefas")
        .doc(todo.idUsuario)
        .collection(todo.nomeTarefa)
        .doc(todo.idTodo)
        .delete();
  }

  void atualizarTodo(TodoModel todo) {
    _firestore
        .collection("tarefas")
        .doc(todo.idUsuario)
        .collection(todo.nomeTarefa)
        .doc(todo.idTodo)
        .update({"check": todo.check});
  }
}
