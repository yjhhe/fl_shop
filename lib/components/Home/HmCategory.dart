import 'package:flutter/material.dart';
import 'package:flutter_application_1/viewmodels/home.dart';

class HmCategory extends StatefulWidget {

  final List<CategoryItem> categoryList;
  HmCategory({Key? key, required this.categoryList}):super(key:key);

  @override
  State<HmCategory> createState() => _HmCategoryState();

  
}

class _HmCategoryState extends State<HmCategory> {
  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.categoryList.length,
        itemBuilder: (BuildContext context, int index){
          final category = widget.categoryList[index];//实例化???
          return Container(
            alignment:Alignment.center,
            width: 80,
            height: 100,
            decoration: BoxDecoration(color: Colors.blueGrey,
            borderRadius: BorderRadius.circular(40)),
            margin:EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment:MainAxisAlignment.center,
              children: [Image.network(category.picture,width: 40,height:40),
              Text(category.name,style: TextStyle(color:Colors.black)),
              ],
            ),
            
          );
        }),
    );
  }
}