import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/Home/HmCategory.dart';
import 'package:flutter_application_1/components/Home/HmHot.dart';
import 'package:flutter_application_1/components/Home/HmMoreList.dart';
import 'package:flutter_application_1/components/Home/HmSuggestion.dart';
import 'package:flutter_application_1/components/Home/Hmslider.dart';
import 'package:flutter_application_1/viewmodels/home.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  final List<BannerItem> _bannerList = [
    BannerItem(
      id:"1", 
      imgUrl: "https://n.sinaimg.cn/sinakd20112/384/w2048h1536/20220731/5c76-18753651605f5006fe7cc156f19584e7.jpg"
      ),
    BannerItem(
      id: "2", 
      imgUrl: "https://y3.ifengimg.com/a/2014_52/2633f87e648cb10.jpg"),
    BannerItem(
      id: "3", 
      imgUrl: "https://n.sinaimg.cn/sinakd20112/384/w2048h1536/20220731/b460-d29aff0e856054d1df870fd0768f0e3b.jpg"),
  ];

  List<Widget> _getScrollChildern(){
    return [
      //轮播图组件
      SliverToBoxAdapter(child: Hmslider(bannerList: _bannerList)),
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