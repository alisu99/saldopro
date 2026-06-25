import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:saldopro/services/client_dio.dart';

Future<Map<String, String>> getJwtToken(String email, String senha) async {
  final response = await dio.post(
    '$route/api/token/',
    data: {'username': email, 'password': senha},
  );

  return {
    'access': response.data['access'] as String,
    'refresh': response.data['refresh'] as String,
  };
}

Future<String?> refreshToken() async {
  final refresh = await _storage.read(key: 'refresh_token');

  if (refresh == null) {
    return null;
  }

  try {
    final response = await dio.post(
      '$route/api/token/refresh/',
      data: {'refresh': refresh},
    );

    final newAccess = response.data['access'];

    await _storage.write(key: 'access_token', value: newAccess);

    return newAccess;
  } catch (e) {
    return null;
  }
}

const _storage = FlutterSecureStorage();

bool _dioConfigurado = false;

void configurarDio() {
  if (_dioConfigurado) return;
  _dioConfigurado = true;

  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) async {
        final token = await _storage.read(key: 'access_token');

        if (token != null) {
          options.headers['Authorization'] = 'Bearer $token';
        }

        handler.next(options);
      },

      onError: (error, handler) async {
        if (error.response?.statusCode == 401) {
          final isRetry = error.requestOptions.extra['retry'] == true;
          if (isRetry) {
            return handler.next(error);
          }

          final novoToken = await refreshToken();

          if (novoToken != null) {
            final request = error.requestOptions;
            request.headers['Authorization'] = 'Bearer $novoToken';
            request.extra['retry'] = true;

            final response = await dio.fetch(request);
            return handler.resolve(response);
          }
        }

        handler.next(error);
      },
    ),
  );
}
