import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/viewmodels/home.dart';

class Hmslider extends StatefulWidget {

  final List<BannerItem> bannerList;
  Hmslider({Key? key, required this.bannerList}):super(key:key);

  @override
  State<Hmslider> createState() => _HmsliderState();
}

class _HmsliderState extends State<Hmslider> {

  CarouselSliderController _controller = CarouselSliderController();//声明并实例化变量
  int _currentIndex = 0;
  Widget _getSlider(){
//获取屏幕宽度
    final double screenWidth = MediaQuery.of(context).size.width;
//轮播图插件
    return CarouselSlider(
      carouselController: _controller,//绑定controller对象
      items: List.generate(widget.bannerList.length, (int index) {
        return Image.network(
          widget.bannerList[index].imgUrl,
          fit: BoxFit.cover,
          width: screenWidth,
          );
    }), 
    options: CarouselOptions(
      autoPlay: true,
      viewportFraction: 1,
      onPageChanged: (int index, reason){
        _currentIndex = index;
        setState(() {
        });
      },)
    );
  }

//搜索条
  Widget _getSearch(){
    return Positioned(
      top: 10,
      left: 0,
     
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 40),
          height: 50,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(0, 0, 0, 0.5),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Row(
            //mainAxisAlignment: MainAxisSize.min,
            children: [
                                                                   //记得刷新明天，改成放大镜
              Image.asset('lib/assets/icons8-凯蒂猫-64.png',width: 20,height: 20,),
              SizedBox(width: 8),
              Text(
            "搜索...",
            style: TextStyle(color: Colors.white,fontSize: 16)
            ),
            ],
          )

        ),
        ));
  }

//指示灯导航部件
  Widget _getDots(){
    return Positioned(
      left: 0,
      right: 0,
      bottom: 10,
      child: SizedBox(
        height: 40,width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(widget.bannerList.length, (int index) {
            return GestureDetector(
              onTap: (){
                _controller.jumpToPage(index);
              },
              child: Container(
                height: 8,
                width: 8,
                margin: EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  color:index == _currentIndex 
                  ? Colors.white 
                  : Color.fromRGBO(0, 0, 0, 0.3),
                  shape: BoxShape.circle,
                ),
              )
            );           
          }),
        ),
      ),);
  }

  @override
  Widget build(BuildContext context) {
//Stack组件
    return Stack(
      children: [_getSlider(),_getSearch(),_getDots()],
      );
  }
}