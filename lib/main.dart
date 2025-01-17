import 'package:alura_quest/features/characterCreation/presentation/stores/characters_store.dart';
import 'package:alura_quest/features/auth/data/repositories/auth_repository.dart';
import 'package:alura_quest/features/auth/presentation/stores/auth_store.dart';
import 'package:alura_quest/features/myApp/presentation/pages/my_app.dart';
import 'package:alura_quest/shared/data/dio/dio_client_http.dart';
import 'package:alura_quest/shared/data/interceptors/config/dio_interceptor.dart';
import 'package:alura_quest/shared/data/interceptors/functions/dio_http_log_interceptor.dart';
import 'package:alura_quest/shared/data/repositories/character_api_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final loggerInterceptor = DioHttpLogInterceptor();
  final dioInterceptors = DioInterceptors(loggerInterceptor: loggerInterceptor);
  final dioClient = DioClientHttp(
    interceptors: dioInterceptors.dioInterceptors,
  );

  runApp(
    MultiProvider(
      providers: [
        Provider<CharactersStore>(
          create: (_) => CharactersStore(
            characterRepository: CharacterApiRepository(client: dioClient),
          ),
        ),
        Provider<AuthStore>(
          create: (_) => AuthStore(
            authRepository: AuthRepository(client: dioClient),
          ),
        ),
      ],
      child: const MyApp(),
    ),
  );
}
