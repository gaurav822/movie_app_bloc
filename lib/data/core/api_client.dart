import 'package:dio/dio.dart';

import '../models/movie_result_model.dart';
import 'api_constants.dart';

class ApiClient{
  final Dio _dio;

  ApiClient(this._dio);

  dynamic get(String path)async{
    final response = await _dio.get(
      '${ApiConstants.baseUrl}$path?api_key=${ApiConstants.apiKey}',
    );

    if(response.statusCode==200){
      return response.data;
    }
    else{
      throw Exception(response.statusMessage);
    }
  }
}