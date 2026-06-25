import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:saldopro/services/auth_service.dart' hide route;
import 'package:saldopro/services/client_dio.dart';

class Usuario extends ChangeNotifier {
  final _storage = const FlutterSecureStorage();

  String? username;
  String? email;
  String? firstName;
  String? lastName;
  String? cpf;
  String? telefone;
  String? endereco;

  bool isAutenticado = false;
  bool isCarregando = false;
  String? erro;

  Future<void> autenticar(String email, String senha) async {
    isCarregando = true;
    erro = null;
    notifyListeners();

    try {
      final tokens = await getJwtToken(email, senha);
      await _storage.write(key: 'access_token', value: tokens['access']);
      await _storage.write(key: 'refresh_token', value: tokens['refresh']);

      configurarDio();
      isAutenticado = true;
    } catch (e) {
      erro = 'Email ou senha inválidos';
    } finally {
      isCarregando = false;
      getUser();
      notifyListeners();
    }
  }
  
  Future<void> getUser() async {
  try {
    final response = await dio.get('$route/api/me/');

    username = response.data['username'];
    email = response.data['email'];
    firstName = response.data['first_name'];
    lastName = response.data['last_name'];
    cpf = response.data['cpf'];
    telefone = response.data['telefone'];
    endereco = response.data['endereco'];

    notifyListeners();
  } catch (e) {
    erro = 'Erro ao buscar dados do usuário';
    notifyListeners();
  }
}
}
