
import 'dart:ui';

import 'package:flutter/material.dart';

class BannerItem{
  String id;
  String imgUrl;
  BannerItem({required this.id, required this.imgUrl});
  
  //一个工厂构造函数，作用是JSON转model。
  //通过“类名.构造函数名”的形式定义额外的构造函数,调用时使用BannerItem.fromJSON(...)。
  factory BannerItem.fromJSON(Map<String,dynamic> json){
    return BannerItem(id: json["id"] ?? "", imgUrl: json["imgUrl"] ?? "");
  }

}//轮播图数据获取需要的url打包成类

//json-->Class+Factory
//分类列表
class CategoryItem{
  String id;
  String name;
  String picture;
  List<CategoryItem>? children;
  CategoryItem({
    required this.id,
    required this.name,
    required this.picture,
    this.children,
  });
  factory CategoryItem.fromJSON(Map<String,dynamic> json){
    return CategoryItem(
      id: json["id"] ?? "", 
      name: json["name"] ?? "", 
      picture: json["picture"] ?? "",
      children: json["children"]== null
      ? null
      : (json["children"] as List)
      .map((item) => CategoryItem.fromJSON(item as Map<String,dynamic>))
      .toList(),
      );
      //JSON 数组在 Dart 中解析为 List<dynamic>,List<dynamic> 不能直接赋值给 List<CategoryItem>
      //第 1 转（as List）：形状断言（保证是数组）。
      //第 2 转（map + as Map）：逐项类型断言（保证每一项是对象）。
      //第 3 转（fromJSON）：业务转换（把 Map 变成 Model 对象）。
      //第 4 转（toList）：数据结构转换（Iterable 变成 List）
  }
}

//特惠推荐

class GoodsItem{
  String id;
  String name;
  String? desc;
  String price;
  String picture;
  int orderNum;
  GoodsItem({
    required this.id,
    required this.name,
    this.desc,
    required this.price,
    required this.picture,
    required this.orderNum,
  });
  factory GoodsItem.fromJSON(Map<String, dynamic> json){
    return GoodsItem(
      id: json["id"]?.toString() ?? "", 
      name: json["name"]?.toString() ?? "", 
      price: json["price"]?.toString() ?? "", 
      picture: json["picture"]?.toString() ?? "", 
      orderNum: int.tryParse(json["orderNum"]?.toString() ?? "0")?? 0,);
  }
}

class GoodsItems{
 int counts;
 int pageSize;
 int pages;
 int page;
 List<GoodsItem> items;
 GoodsItems({
  required this.counts,
  required this.pageSize,
  required this.pages,
  required this.page,
  required this.items,
 });
 factory GoodsItems.fromJSON(Map<String, dynamic> json){
  return GoodsItems(
    counts: int.tryParse(json["counts"]?.toString() ?? "0")?? 0, //将字符串安全地转换为 32 位整数
    pageSize: int.tryParse(json["pageSize"]?.toString() ?? "0")?? 0, 
    pages: int.tryParse(json["pages"]?.toString() ?? "0")?? 0, 
    page: int.tryParse(json["page"]?.toString() ?? "0")?? 0, 
    items: (json["items"] as List? ?? [])
    .map((item) => GoodsItem.fromJSON(item as Map<String, dynamic>))
    .toList(),
    );
 }
}

class SubType{
  String id;
  String title;
  GoodsItems goodsItems;
  SubType({
    required this.id,
    required this.title,
    required this.goodsItems,
  });
  factory SubType.fromJSON(Map<String, dynamic> json){
    return SubType(
      id: json["id"]?.toString() ?? "", 
      title: json["title"]?.toString() ?? "", 
      goodsItems: GoodsItems.fromJSON(json["goodsItems"] as Map<String, dynamic>));
  }
}

class SpecialRecommendResult{
  String id;
  String title;
  List<SubType> subTypes;
  SpecialRecommendResult({
    required this.id,
    required this.title,
    required this.subTypes,
  });
  factory SpecialRecommendResult.fromJSON(Map<String, dynamic> json){
    return SpecialRecommendResult(
      id: json["id"]?.toString() ?? "", 
      title: json["title"]?.toString() ?? "", 
      subTypes: (json["subTypes"] as List? ?? [])
      .map((item) => SubType.fromJSON(item as Map<String, dynamic>))
      .toList(),);
  }
}

class GoodDetailItem extends GoodsItem {
  int payCount = 0;
  GoodDetailItem({
    required super.id,
    required super.name,
    required super.price,
    required super.picture,
    required super.orderNum,
    required this.payCount,
  }) :super(desc: "");//构造函数desc字段为空

  factory GoodDetailItem.fromJSON(Map<String, dynamic> json){
    return GoodDetailItem(
      id: json["id"]?.toString() ?? "", 
      name: json["name"]?.toString() ?? "", 
      price: json["price"]?.toString() ?? "", 
      picture: json["picture"]?.toString() ?? "", 
      orderNum: int.tryParse(json["orderNum"]?.toString() ?? "0")?? 0, 
      payCount: int.tryParse(json["payCount"]?.toString() ?? "0")?? 0,
      );
  }
}