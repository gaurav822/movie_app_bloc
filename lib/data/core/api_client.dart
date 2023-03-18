import 'package:dio/dio.dart';

import '../models/movie_result_model.dart';
import 'api_constants.dart';

class ApiClient{
  final Dio _dio;

  ApiClient(this._dio);

  dynamic get(String path,{Map<dynamic,dynamic>? params})async{
    final response = await _dio.get(
      getPath(path,params??{})
    );

    if(response.statusCode==200){
      return response.data;
    }
    else{
      throw Exception(response.statusMessage);
    }
  }

  String getPath(String path,Map<dynamic,dynamic> params){
    var paramString = '';
    if(params.isNotEmpty){
      params.forEach((key, value) {
        paramString += '&$key=$value';
      });
    }

    return '${ApiConstants.baseUrl}$path?api_key=${ApiConstants.apiKey}$paramString';

  }
}