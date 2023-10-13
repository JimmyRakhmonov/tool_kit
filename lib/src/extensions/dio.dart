import 'package:dio/dio.dart';

extension DioExtensions on String {
  Future<dynamic> get(Dio dio,
      {String? token,
      Map<String, dynamic>? headers,
      Options? options,
      ProgressCallback? onReceiveProgress}) async {
    try {
      final Response response = await dio.get(
        this,
        options: Options(headers: headers),
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> post(Dio dio,
      {dynamic data,
      Map<String, dynamic>? headers,
      ProgressCallback? onSendProgress,
      ProgressCallback? onReceiveProgress}) async {
    try {
      final Response response = await dio.post(
        this,
        data: data,
        options: Options(
            followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            },
            headers: headers),
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> put(Dio dio,
      {String? token,
      data,
      Options? options,
      ProgressCallback? onSendProgress,
      ProgressCallback? onReceiveProgress,
      Map<String, dynamic>? headers}) async {
    try {
      final Response response = await dio.put(
        this,
        data: data,
        options: Options(headers: headers),
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> delete(Dio dio,
      {String? token,
      data,
      Options? options,
      ProgressCallback? onSendProgress,
      ProgressCallback? onReceiveProgress,
      Map<String, dynamic>? headers}) async {
    try {
      final Response response = await dio.delete(
        this,
        data: data,
        options: Options(headers: headers),
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
