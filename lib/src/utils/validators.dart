import 'package:get/get.dart';

String? emailValidator(String? email) {
  if (email == null || email.isEmpty) {
    return 'Digite seu email';
  }
  if (!email.isEmail) {
    return 'Digite um email válido';
  }
  return null;
}

String? passwordValidator(String? password) {
  if (password == null || password.isEmpty) {
    return 'Digite sua senha';
  }
  if (password.length < 7) {
    return 'Digite uma senha com pelo menos 7 caracteres';
  }
  return null;
}

String? fisrtNameValidator(String? name) {
  if (name == null || name.isEmpty) {
    return 'Digite seu nome';
  }
  return null;
}

String? lastNameValidator(String? name) {
  if (name == null || name.isEmpty) {
    return 'Digite seu sobre nome';
  }
  return null;
}

String? phoneValidator(String? phone) {
  if (phone == null || phone.isEmpty) {
    return 'Digite um número de celular';
  }
  if (!phone.isPhoneNumber || phone.length < 11) {
    return 'Digite um número válido';
  }
  return null;
}

String? cpfValidator(String? cpf) {
  if (cpf == null || cpf.isEmpty) {
    return 'Digite um CPF';
  }
  if (!cpf.isCpf) {
    return 'Digite um CPF válido';
  }
  return null;
}

String? dateValidator(DateTime? data) {
  if (data == null) {
    return 'Informe uma data';
  }

  return null;
}

String? emtyTextValidator(String? text) {
  if (text == null || text.isEmpty) {
    return 'Digite um texto';
  }

  return null;
}

typedef DropdownValidator<T> = String? Function(T? value);

String? dropdownValueValidator<T>(T? value) {
  if (value == null) {
    return 'Selecione um item';
  }
  // Outras validações personalizadas aqui, se necessário

  return null; // Retorna null se a validação for bem-sucedida
}
