
class Usuario {

  String idUsuario = "";
  String nome = "";
  String email = "";
  String senha = "";

  Usuario(
      {this.idUsuario = "",
      this.nome = "",
      this.email = "",
      this.senha = "",});

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "id": this.idUsuario,
      "nome": this.nome,
      "email": this.email
    };
    return map;
  }

  factory Usuario.fromMap(Map<dynamic, dynamic> dados) {
    return Usuario(
      idUsuario: dados['idUsuario']== null ? '' : dados['idUsuario'],
      nome:      dados['nome']     == null ? '' : dados['nome'],
      email:     dados['email']    == null ? '' : dados['email'],
    );
  }

  factory Usuario.clean() {
    return Usuario(
      idUsuario: '',
      nome:      '',
      email:     '',
    );
  }
}
