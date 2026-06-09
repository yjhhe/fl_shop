import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/Cart/index.dart';
import 'package:flutter_application_1/pages/Category/index.dart';
import 'package:flutter_application_1/pages/Home/index.dart';
import 'package:flutter_application_1/pages/Mine/index.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  //四个导航 声明变量类型为列表
  final List<Map<String, String>> _tableList = [{
    "icon":"lib/assets/icons8-可爱的-48.png",
    "active_icon":"lib/assets/icons8-猫头鹰-64.png",
    "text":"首页",
  },
  {
    "icon":"lib/assets/icons8-猫头鹰-96.png",
    "active_icon":"lib/assets/icons8-猫头鹰-96 (1).png",
    "text":"分类",
  },
  {
    "icon":"lib/assets/icons8-猫锅-64.png",
    "active_icon":"lib/assets/icons8-猫锅-64 (1).png",
    "text":"购物车",
  },
  {
    "icon":"lib/assets/icons8-凯蒂猫-64.png",
    "active_icon":"lib/assets/icons8-凯蒂猫-48.png",
    "text":"我的",
  }
  ];
  int _currentIndex = 0;
List<BottomNavigationBarItem> _getTabBarWidget(){
  return List.generate(_tableList.length, (int index){
    return BottomNavigationBarItem(
      icon: Image.asset(
        _tableList[index]["icon"]!,
        width: 30,
        height: 30,
      ),
      activeIcon: Image.asset(
        _tableList[index]["active_icon"]!,
        width: 30,
        height: 30,
      ),
      label: _tableList[index]["text"],
      );
  });
}

List<Widget> _getChildren(){
  return [HomeView(),CategoryView(),CartView(),MineView()];
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          index:_currentIndex,
        children: _getChildren(),
      )),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        onTap: (int index){
          _currentIndex = index;
          setState(() {});
        },
        currentIndex: _currentIndex,
        items: _getTabBarWidget()),
    );
  }
}