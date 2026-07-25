import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/index.dart';
import 'package:flutter_application_1/utils/DioRequest.dart';
import 'package:flutter_application_1/viewmodels/home.dart';

//这是在向后台要数据
//从 API 获取 Banner 列表数据，并转换为 BannerItem 对象列表
Future<List<BannerItem>> getBannerListAPI() async {

//  .map(...)：对 List 中的每个元素执行转换。
return ((await  dioRequest.get(HttpConstants.BANNER_LIST)) as List).map((item){
  //BannerItem.fromJSON(...)：调用之前解释的命名构造函数（工厂方法），将 Map 转换为 BannerItem 对象
  return BannerItem.fromJSON(item as Map<String, dynamic>);
}).toList();
}

Future<List<CategoryItem>> getCategoryListAPI() async {
  return ((await dioRequest.get(HttpConstants.CATEGORY_LIST)) as List).map((item){
    return CategoryItem.fromJSON(item as Map<String, dynamic>);
  }).toList();
}

Future<SpecialRecommendResult> getProductListAPI() async{
  return SpecialRecommendResult.fromJSON(
    await dioRequest.get(HttpConstants.PRODUCT_LIST),
  );
}