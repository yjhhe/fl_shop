import 'package:flutter/material.dart';
import 'package:flutter_application_1/viewmodels/home.dart';

class HmMoreList extends StatefulWidget {
  final List<GoodDetailItem> recommendList;
  HmMoreList({Key? key, required this.recommendList}) :super(key: key);

  @override
  State<HmMoreList> createState() => _HmMoreListState();
}

class _HmMoreListState extends State<HmMoreList> {

  Widget _getChildren(int index){
    return Container(
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: AspectRatio(
              aspectRatio: 1.0,
              child: Image.network(
                widget.recommendList[index].picture,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    "lib/assets/tehuituijian.jpg",
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
          ),
          SizedBox(height: 6),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              widget.recommendList[index].name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.black,fontSize: 20),
            ),
          ),
          SizedBox(height: 6),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(
                  TextSpan(
                    text: "￥${widget.recommendList[index].price}",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                    ),
                    children: [
                      TextSpan(text: " "),
                      TextSpan(
                        text: "￥${widget.recommendList[index].price}",
                        style: TextStyle(
                          decoration: TextDecoration.lineThrough,//价格上加中划线
                          color: Colors.grey,
                          fontSize: 12,
                        )
                      ),
                    ],
                  ),
                ),
                Text(
                  "${widget.recommendList[index].payCount}人付款",
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

    @override
    Widget build(BuildContext context){
      
      return SliverGrid.builder(
        itemCount: widget.recommendList.length,
        gridDelegate: 
          SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 0.65,
            ), 
        itemBuilder: (BuildContext context,int index){
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: _getChildren(index),
          );
        },
      );
    }
  }

  // Widget _getChildren(int index){
  //   return Container(
  //     child: Column(
  //       children: [
  //         ClipRRect(
  //           borderRadius: BorderRadius.circular(8),
  //             child:AspectRatio(aspectRatio: 1.0,
  //             child: Image.network(
  //               widget.recommendList[index].picture,
  //               fit: BoxFit.cover,
  //               errorBuilder: (context, error, stackTrace) {
  //                 return Image.asset(
  //                   "lib/assets/xiaowanzidatou.jpeg",
  //                   fit: BoxFit.cover,
  //                 );
  //               },
  //             ),
  //           ),
  //         ),

  //         SizedBox(height: 6),
  //         Padding(
  //           padding: EdgeInsets.symmetric(horizontal: 10),
  //           child: Text(
  //             widget.recommendList[index].name,
  //             maxLines: 2,
  //             overflow: TextOverflow.ellipsis,//溢出处理：省略号
  //             style: TextStyle(color: Colors.black,fontSize: 20),
  //           ),
  //         ),
  //         SizedBox(height: 6),
  //         Padding(
  //           padding: EdgeInsets.symmetric(horizontal: 5),
  //           child: Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //             children: [
  //               Text.rich(//更复杂的文本样式
  //                 TextSpan(
  //                   text: "￥${widget.recommendList[index].price}",
  //                   style: TextStyle(
  //                     color: Colors.black,
  //                     fontSize: 20,
  //                     fontWeight: FontWeight.w900,
  //                   ),
  //                   children: [
  //                     TextSpan(text: " "),
  //                     TextSpan(
  //                       text: "￥${widget.recommendList[index].price}",
  //                       style: TextStyle(
  //                         decoration: TextDecoration.lineThrough,//价格上加中划线
  //                         color: Colors.grey,
  //                         fontSize: 12,
  //                       )
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //               Text(
  //                 "${widget.recommendList[index].payCount}人付款",
  //                 style: TextStyle(color: Colors.grey),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ],
  //     ),
  //   );

  // }

  // @override
  // Widget build(BuildContext context) {
    
  //   return SliverGrid.builder(
  //     itemCount: widget.recommendList.length,

  //     gridDelegate:     
  //     SliverGridDelegateWithFixedCrossAxisCount(
  //       crossAxisCount: 2,
  //       mainAxisSpacing: 10,
  //       crossAxisSpacing: 10,
  //       childAspectRatio: 0.75,
  //       ), 
  //     itemBuilder:(BuildContext context, int index){
  //       return Padding(
  //         padding: EdgeInsets.symmetric(horizontal: 10),
  //         child: _getChildren(index),
  //       );
  //     }
  //   );
  // }
//}