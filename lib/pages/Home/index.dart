import 'package:flutter/material.dart';
import 'package:flutter_application_1/api/home.dart';
import 'package:flutter_application_1/components/Home/HmCategory.dart';
import 'package:flutter_application_1/components/Home/HmHot.dart';
import 'package:flutter_application_1/components/Home/HmMoreList.dart';
import 'package:flutter_application_1/components/Home/HmSuggestion.dart';
import 'package:flutter_application_1/components/Home/Hmslider.dart';
import 'package:flutter_application_1/utils/ToastUtils.dart';
import 'package:flutter_application_1/viewmodels/home.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  List<CategoryItem> _categoryList = [];
   List<BannerItem> _bannerList = [
    /* BannerItem(
      id:"1", 
      imgUrl: "https://n.sinaimg.cn/sinakd20112/384/w2048h1536/20220731/5c76-18753651605f5006fe7cc156f19584e7.jpg"
      ),
    BannerItem(
      id: "2", 
      imgUrl: "https://y3.ifengimg.com/a/2014_52/2633f87e648cb10.jpg"),
    BannerItem(
      id: "3", 
      imgUrl: "https://n.sinaimg.cn/sinakd20112/384/w2048h1536/20220731/b460-d29aff0e856054d1df870fd0768f0e3b.jpg"), */
  ];

  List<Widget> _getScrollChildern(){
    return [
      //轮播图组件
      SliverToBoxAdapter(child: Hmslider(bannerList: _bannerList)),
      //分类组件 SizedBox一个简单的空隙组件
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      //分类
      SliverToBoxAdapter(child: HmCategory(categoryList: _categoryList)),
      //
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      //推荐
      SliverToBoxAdapter(child: HmSuggestion(specialRecommendResult: _specialRecommendResult,)),

      SliverToBoxAdapter(child: SizedBox(height: 10)),

      //Flex和Expanded可以均分
      SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child:Flex(
            direction: Axis.horizontal,
            children: [
              Expanded(
                child: HmHot(result: _inVogueResult,type: "hot",)), 
              SizedBox(width: 10),
              Expanded(
                child: HmHot(result: _oneStopResult,type: "step",)), 
            ],
          ),
        )
      ),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      HmMoreList(recommendList: _recommendList),
    ];
  }
SpecialRecommendResult _specialRecommendResult = SpecialRecommendResult(
  id: "", title: "", subTypes: []);

SpecialRecommendResult _inVogueResult = SpecialRecommendResult(
  id: "", title: "", subTypes: []);

SpecialRecommendResult _oneStopResult = SpecialRecommendResult(
  id: "", title: "", subTypes: []);

List<GoodDetailItem> _recommendList = [];

//实现上拉加载需要的三个
int _page =1;
bool _isLoading = false;
bool _hasMore =true;

  @override
  void initState() {
    super.initState();
    // _getBannerList();
    // _getCategoryList();
    // _getProductList();
    // _getInVogueList();
    // _getOneStopList();
    // _getRecommendList();
  }

Future<void> _getRecommendList() async{

  _recommendList = await getRecommendListAPI({"Limit": 10});
  //   setState(() {
  // });

}

  Future<void> _getInVogueList() async{
    _inVogueResult = await getInVogueListAPI();
    // setState(() {
      
    // });
  }

  Future<void> _getOneStopList() async{
    _oneStopResult = await getOneStopListAPI();
    // setState(() {
      
    // });
  }

  Future<void> _getProductList() async{
    _specialRecommendResult = await getProductListAPI();
    // setState(() {
      
    // });
  }

  Future<void> _getCategoryList()async{
    _categoryList = await getCategoryListAPI();
    // setState(() {
      
    // });
  }
  Future<void> _getBannerList()async {
    _bannerList = await getBannerListAPI();
    // setState(() {
      
    // });
  }

  Future<void> _onRefresh() async {
    _page =1;
    _isLoading = false;
    _hasMore = true;
    await _getBannerList();
    await _getCategoryList();
    await _getProductList();
    await _getInVogueList();
    await _getOneStopList();
    await _getRecommendList();
    ToastUtils.showToast(context, "刷新成功");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _onRefresh,
      child: CustomScrollView(
      slivers: _getScrollChildern(),
      ),
    );
  }     
}