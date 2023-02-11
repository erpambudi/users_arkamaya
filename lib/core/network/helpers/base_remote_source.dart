import 'dart:io';

import 'package:dio/dio.dart';

import '../../flavors/build_config.dart';
import '../exceptions/base_exception.dart';
import 'dio_provider.dart';
import 'error_handlers.dart';

abstract class BaseRemoteSource {
  Dio get dioClient => DioProvider.dioWithHeader;

  final logger = BuildConfig.instance.config.logger;

  Future<Response<T>> callApiWithErrorParser<T>(Future<Response<T>> api) async {
    try {
      Response<T> response = await api;

      if (response.statusCode != HttpStatus.ok) {}

      return response;
    } on DioError catch (dioError) {
      Exception exception = handleDioError(dioError);
      logger.e(
          "Throwing error from repository: >>>>>>> $exception : ${(exception as BaseException).message}");
      throw exception;
    } catch (error) {
      logger.e("Generic error: >>>>>>> $error");

      if (error is BaseException) {
        rethrow;
      }

      throw handleError("$error");
    }
  }
}
