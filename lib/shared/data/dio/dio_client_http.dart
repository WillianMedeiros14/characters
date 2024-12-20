import 'package:dio/dio.dart';

abstract class IHttpCharacterClient {
  Future getAll({required String endpoint});
  Future createCharacter({
    required String endpoint,
    required Map<String, dynamic> data,
  });
  Future updateCharacter({
    required String endpoint,
    required Map<String, dynamic> data,
  });
  Future deleteCharacter({
    required String endpoint,
  });
}

class DioClientHttp implements IHttpCharacterClient {
  Dio dio = Dio();

  DioClientHttp() {
    dio.options.baseUrl = 'http://10.90.51.14:8080/';
  }

  @override
  Future getAll({required String endpoint}) async {
    final response = await dio.get(endpoint);

    return response;
  }

  @override
  Future createCharacter({
    required String endpoint,
    required Map<String, dynamic> data,
  }) async {
    final response = await dio.post(endpoint, data: data);
    return response;
  }

  @override
  Future updateCharacter({
    required String endpoint,
    required Map<String, dynamic> data,
  }) async {
    final response = await dio.put(endpoint, data: data);
    return response;
  }

  @override
  Future deleteCharacter({required String endpoint}) async {
    final response = await dio.delete(endpoint);
    return response;
  }
}
