import 'package:dio/dio.dart';

class DioHelper
{
  static Dio? dio;

  static void init(){
    dio = Dio(
      BaseOptions(
    baseUrl: 'https://student.valuxapps.com/api/',
        receiveDataWhenStatusError: true,
     ),
    );
  }

  static Future<Response> getData({
  required String Url,
   dynamic query,
    String? token,
    String lang = 'en',
})async
  {
    dio!.options.headers =
    {
      'lang':lang,
      'Content-Type':'application/json',
      'Authorization':token,
    };
    return await dio!.get(
      Url ,
      queryParameters: query??null,
    );
  }

  static Future<Response> postData({
    required String Url,
    Map <String , dynamic>? query,
    required Map <String , dynamic>? data,
    String? token,
    String lang = 'en',
  })async
  {
    dio!.options.headers =
    {
      'lang':lang,
      'Content-Type':'application/json',
      'Authorization':token,
    };
    return dio!.post(
      Url,
      queryParameters: query,
      data: data,

    );
  }

  static Future<Response> putData({
    required String Url,
    Map <String , dynamic>? query,
    required Map <String , dynamic>? data,
    String? token,
    String lang = 'en',
  })async
  {
    dio!.options.headers =
    {
      'lang':lang,
      'Content-Type':'application/json',
      'Authorization':token,
    };
    return dio!.put(
      Url,
      queryParameters: query,
      data: data,

    );
  }
}
