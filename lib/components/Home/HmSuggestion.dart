import 'package:flutter/material.dart';
import 'package:flutter_application_1/viewmodels/home.dart';

class HmSuggestion extends StatefulWidget {
  final SpecialRecommendResult specialRecommendResult;//
  HmSuggestion({Key? key, required this.specialRecommendResult}):super(key: key);

  @override
  State<HmSuggestion> createState() => _HmSuggestionState();
}

class _HmSuggestionState extends State<HmSuggestion> {

//特别推荐后面三个图需要的函数
List<GoodsItem> _getDisplayItems(){
  if(widget.specialRecommendResult.subTypes.isEmpty) return [];
  return widget.specialRecommendResult.subTypes.first.goodsItems.items
  .take(3).
  toList();
}

  Widget _buildHeader(){
    return Row(
      children: [
        Text("特别推荐",
        style: TextStyle(color: Colors.pink,
        fontSize:18,
        fontWeight: FontWeight.w700),
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          "心之港湾",
          style: TextStyle(
            fontSize: 12,
            color: Colors.pink,
          ),
        ),
      ],
    );
  }

Widget _buildleft(){
  return Container(
    width: 100,
    height: 140,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      image: DecorationImage(
        image: AssetImage("lib/assets/xiaowanzidatou.jpeg"),
        fit: BoxFit.cover,
      )
    ),
  );
}


List<Widget> _getChildrenList(){
  List<GoodsItem> list = _getDisplayItems();
  return List.generate(list.length, (int index){
    return Column(
      children: [
        ClipRRect(//将其子组件裁剪为圆角矩形，物理剪裁，耗性能
          borderRadius: BorderRadius.circular(8),
          child: Image.network(//............................研究一下怎么换图片
            errorBuilder: (context, error, StackTrace){//网络图片加载失败时替换
              return Image.asset("lib/assets/xiaowanzidatou.jpeg",
              width: 100,
              height: 140,
              fit: BoxFit.cover,
              );
            },
            list[index].picture,
            width: 100,
            height: 140,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 10,),
        Container(
          padding:EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.amber),
          child: Text(
            "￥${list[index].price}",
            style: TextStyle(color: Colors.white),
          ),
        )
      ],
    );
  });
}

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(
            image: AssetImage("lib/assets/tehuituijian.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            _buildHeader(),
            SizedBox(height: 10,),
            Row(
              children: [
                _buildleft(),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: _getChildrenList(),
            ))]),
          ],
        ),
      ),
    );
  }
}