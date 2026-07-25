
import 'package:dio/dio.dart';
import 'package:flutter_application_1/constants/index.dart';

//读取后端数据
class DioRequest {
  final _dio = Dio();

  DioRequest(){
    _dio.options
      ..baseUrl = GlobalConstants.BASE_URL
      ..connectTimeout = Duration(seconds: GlobalConstants.TIME_OUT)
      ..sendTimeout = Duration(seconds: GlobalConstants.TIME_OUT)
      ..receiveTimeout = Duration(seconds: GlobalConstants.TIME_OUT);
      //拦截器
      _addInterceptor();
  }

  void _addInterceptor(){
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (request, handler) {
          handler.next(request);
        },
        onResponse: (response, handler) {
          //http状态码非空且在200-300之间
          if(response.statusCode! >= 200 && response.statusCode! < 300){
            handler.next(response);
            return;
          }
          handler.reject(DioException(requestOptions: response.requestOptions));
        },
        onError: (error, handler) {
          handler.reject(error);
        },
      )
    );
  }

//get函数：queryParameters的含义：将params作为URL查询参数附加到url上。_dio.get返回Future<Response>。
  Future<dynamic> get(String url, {Map<String, dynamic>? params}){
    return _handleResponse(_dio.get(url, queryParameters: params));
  }

//进一步处理返回结果的函数  task:一个任务
  Future<dynamic> _handleResponse(Future<Response<dynamic>> task) async{
    try{
      Response<dynamic> res = await task;
      final data = res.data as Map<String, dynamic>;
      if(data["code"] == GlobalConstants.SUCCESS_CODE) {
        return data["result"];
      }
      //抛出异常
      throw Exception(data["msg"] ?? "加载数据异常");
    }catch(e){
      throw Exception(e);
    }
  }
}

final dioRequest = DioRequest();//单例对象
