import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_list/app/model/Lista.dart';
import 'package:todo_list/app/model/Todo.dart';

class TodoService{
  final FirebaseFirestore _db = FirebaseFirestore.instance;


  Stream<QuerySnapshot> listasTarefas(bool descending, Map dados) {
    return _db.collection("tarefas")
        .doc(dados["idUsuario"]).collection(dados["nome"])
        .orderBy("timestamp", descending: descending)
        .snapshots();
  }

  Future<List<QueryDocumentSnapshot>> dadosLista() async {
    List<QueryDocumentSnapshot> lista  = [];

    QuerySnapshot<Map<String, dynamic>> snapshot = await _db.collection("listas").get();

    for( var dados in snapshot.docs){
      lista.add(dados);
    }
    return lista;
  }

  adicionarLista(ListaTarefas lista){
    lista.idLista = _db.collection("listas").doc().id;
    _db.collection("listas").doc(lista.idLista).set(lista.toMap());
  }

  deletarLista(ListaTarefas lista){
    _db.collection("listas").doc(lista.idLista).delete();
  }

  deletarImportado(ListaTarefas lista, String idUsuario) async {
    var dados = await _db.collection("listas").doc(lista.idLista).get();
    if(dados.exists){
      lista = ListaTarefas.fromMap(dados.data() as Map);
      lista.idImportados!.remove(idUsuario);
      _db.collection("listas").doc(lista.idLista).update(lista.toMap());
      return true;
    }
  }

  Future<bool> importarLista(String idLista, String idUsuario) async {
    ListaTarefas listaTarefas = ListaTarefas();
    var dados = await _db.collection("listas").doc(idLista).get();

    if(dados.exists){
      listaTarefas = ListaTarefas.fromMap(dados.data() as Map);
      listaTarefas.idImportados!.add(idUsuario);
      _db.collection("listas").doc(idLista).update(listaTarefas.toMap());
      return true;
    }
    return false;
  }

  adicionarTodo(TodoModel todo){
    String idDoc = _db.collection("tarefas").doc().id;
    todo.idTodo = idDoc;
    _db.collection("tarefas").doc(todo.idUsuario).collection(todo.nomeTarefa).doc(idDoc).set(todo.toMap());
  }

  editarTodo(TodoModel todo){
    _db.collection("tarefas").doc(todo.idUsuario).collection(todo.nomeTarefa).doc(todo.idTodo).update(todo.toMap());
  }

  deletarTodo(TodoModel todo){
    _db.collection("tarefas").doc(todo.idUsuario).collection(todo.nomeTarefa).doc(todo.idTodo).delete();
  }

  atualizarTodo(TodoModel todo){
    _db.collection("tarefas").doc(todo.idUsuario).collection(todo.nomeTarefa).doc(todo.idTodo).update({
      "check": todo.check
    });
  }
}