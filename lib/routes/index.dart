import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/Login/index.dart';
import 'package:flutter_application_1/pages/Main/index.dart';

Widget getRootWidget () {
  return MaterialApp(
    //命名路由
    initialRoute: "/",
    routes: getRootRoutes(),
  );
}
//Widget Function(BuildContext) 是一个函数类型（Function Type），相当于一个“接口”或“模板”。它表示：“一个接受 BuildContext 参数、返回 Widget 的函数”。
Map<String, Widget Function(BuildContext)> getRootRoutes(){
  return {
    "/": (context) => MainPage(),
    "/login": (context) => LoginPage(),
  };
}