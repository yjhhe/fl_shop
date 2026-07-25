import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/viewmodels/home.dart';

class HmHot extends StatefulWidget {

  final SpecialRecommendResult result;
  final String type;
  HmHot({Key? key, required this.result,required this.type}) :super(key: key);
  @override
  State<HmHot> createState() => _HmHotState();
}

class _HmHotState extends State<HmHot> {

  List<GoodsItem> get _items{//计算属性，
  if(widget.result.subTypes.isEmpty) return [];
  return widget.result.subTypes.first.goodsItems.items
  .take(2).
  toList();
}

List<Widget> _getChildrenList(){
  return _items.map((item){//_items.使用方式
    return Container(
      width: 80,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              item.picture ?? "",
              errorBuilder: (context, error, stackTrace) => 
                Image.asset("lib/assets/xiaowanzidatou.jpeg"),
              width: 80,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 5,),
          Text(
            "￥${item.price ?? 0}",
            style: const TextStyle(
              fontSize: 12,
              color: Colors.pink,
            ),
          )
        ],
      ),
    );
  }).toList();
}

Widget _buildHeader(){
    return Row(
      children: [
        Text(
          widget.type == "step" ? "一站买全" : "爆款推荐",
        style: TextStyle(color: Colors.pink,
        fontSize:18,
        fontWeight: FontWeight.w700),
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          widget.type == "step" ? "精心优选" : "最受欢迎",
          style: TextStyle(
            fontSize: 12,
            color: Colors.pink,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: widget.type == "step"
          ? const Color.fromARGB(255, 249, 247, 219)
          : const Color.fromARGB(255, 211, 228, 248),
        ),
        child: Column(
          children: [
            _buildHeader(),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: _getChildrenList(),
              ),
          ],
        ),
      ),
    );
  }
}