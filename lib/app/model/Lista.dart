class ListaTarefas{

  String nome = "";
  String idUsuario = "";
  String idLista = "";
  List? idImportados = [];

  ListaTarefas({this.nome = "", this.idUsuario = "", this.idLista = "", this.idImportados});

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "idImportados" : this.idImportados,
      "idUsuario": this.idUsuario,
      "idLista":    this.idLista,
      "nome":       this.nome,
    };
    return map;
  }

  factory ListaTarefas.fromMap(Map<dynamic, dynamic> dados) {
    return ListaTarefas(
      nome:dados['nome']== null ? '' : dados['nome'],
      idLista:   dados['idLista']   == null ? '' : dados['idLista'],
      idUsuario: dados['idUsuario'] == null ? '' : dados['idUsuario'],
      idImportados: dados['idImportados'] == null ? [] : dados['idImportados'] as List,
    );
  }
}