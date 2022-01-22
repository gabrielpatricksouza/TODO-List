import 'package:email_validator/email_validator.dart';

class ValidarCadastro {
  String nome;
  String senha1;
  String senha2;
  String email;

  ValidarCadastro(this.nome, this.senha1, this.senha2, this.email);

  validandoNomeEmail() {
    if (this.nome.isNotEmpty && this.email.isNotEmpty) {
      if (this.nome.length > 3 && this.email.length > 3) {
        if (EmailValidator.validate(this.email)) {
          return "Valido";
        } else {
          return "E-mail inserido não é valido!";
        }
      } else {
        return "Todos os campos precisam ter mais que 3 caracteres";
      }
    } else {
      return "Os campos precisam ser preenchidos";
    }
  }

  validandoSenhas() {
    if (this.senha1.isNotEmpty && this.senha2.isNotEmpty) {
      if (this.senha1.length > 3 && this.senha2.length > 3) {
        if (this.senha1 == this.senha2) {
          return "Valido";
        } else {
          return "Senhas  diferentes!";
        }
      } else {
        return "Todos os campos precisam ter mais que 3 caracteres";
      }
    } else {
      return "Os campos precisam ser preenchidos";
    }
  }
}
