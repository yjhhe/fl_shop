import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/Home/HmCategory.dart';
import 'package:flutter_application_1/components/Home/HmHot.dart';
import 'package:flutter_application_1/components/Home/HmMoreList.dart';
import 'package:flutter_application_1/components/Home/HmSuggestion.dart';
import 'package:flutter_application_1/components/Home/Hmslider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<Widget> _getScrollChildern(){
    return [
      //轮播图组件
      SliverToBoxAdapter(child: Hmslider()),
      //分类组件 SizedBox一个简单的空隙组件
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      //分类
      SliverToBoxAdapter(child: HmCategory()),
      //
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      //推荐
      SliverToBoxAdapter(child: HmSuggestion()),

      SliverToBoxAdapter(child: SizedBox(height: 10)),

      //Flex和Expanded可以均分
      SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child:Flex(
            direction: Axis.horizontal,
            children: [
              Expanded(child: HmHot()), 
              SizedBox(width: 10),
              Expanded(child: HmHot()), 
            ],
          ),
        )
      ),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      HmMoreList()
    ];
  }
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: _getScrollChildern());
  }
}