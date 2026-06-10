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

  Widget _getSlider(){

    final double screenWidth = MediaQuery.of(context).size.width;
//轮播图插件
    return CarouselSlider(
      items: List.generate(widget.bannerList.length, (int index) {
        return Image.network(
          widget.bannerList[index].imgUrl,
          fit: BoxFit.cover,
          width: screenWidth,
          );
    }), 
    options: CarouselOptions(
      autoPlay: true,
      viewportFraction: 1)
    );
  }

  @override
  Widget build(BuildContext context) {

    return Stack(
      children: [_getSlider()
      ],);
    /* Container(
      height:300,
      color: Colors.blue,
      alignment: Alignment.center,
      child: Text("轮播图",style: TextStyle(color: Colors.white,fontSize: 20)),
    ); */
  }
}