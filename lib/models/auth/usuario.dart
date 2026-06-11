import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final storage = FlutterSecureStorage();

class Usuario extends ChangeNotifier {
  String? nome;
  String? email;
  String? senha;
}