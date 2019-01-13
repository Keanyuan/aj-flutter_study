import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';


class SwiperTController extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _SwiperControllerState();
  }

}

class _SwiperControllerState extends State<SwiperTController>{

  var bannerList = [
    "images/pic1.jpg",
    "images/pic2.jpg",
    "images/pic3.jpg",
    "images/pic4.jpg",
    "images/pic5.jpg",
    "images/pic6.jpg",
  ];

  Widget _swiperBuilder(BuildContext context, int index){
    return Image.asset(bannerList[index], fit: BoxFit.fitWidth,);
    return Image.network(
        bannerList[index],
        fit: BoxFit.cover
    );
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.width * 9 / 16.0;
    return new Scaffold(
      appBar: new AppBar(
        title: Text("轮播图"),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: h,
        child: Swiper(
          itemCount: bannerList.length,
          itemBuilder: _swiperBuilder,
          //展示默认分页指示器
          pagination: new SwiperPagination(
            builder: DotSwiperPaginationBuilder(
                color: Colors.black12,
                activeColor: Colors.redAccent
            ),
            //分页指示器与容器边框的距离
            margin: const EdgeInsets.all(10.0),
          ),
          //展示默认分页按钮
          control: null,
//        control: new SwiperControl(
//          color: Colors.red,
//          iconPrevious: Icons.build,
//          iconNext: Icons.email,
//          //控制按钮大小
//          size: 40.0,
//          //控制按钮与容器的距离
//          padding: const EdgeInsets.all(10.0)
//        ),
          //滚动方向设置为Axis.vertical如果需要垂直滚动
          scrollDirection: Axis.horizontal,
          //自动播放开关
          autoplay: true,
          //无限轮播模式开关
          loop: true,
          //初始的时候下标位置
          index: 0,
          //当用户拖拽的时候，是否停止自动播放
          autoplayDisableOnInteraction: true,
          //动画时间，单位是毫秒
          duration: 2000,
          //自动播放延迟毫秒数
//        autoplayDelay: 3,
          //当用户点击某个轮播的时候调用
          onTap: (index){
            print("点击第$index个");
          },
          //当用户手动拖拽或者自动播放引起下标改变的时候调用
          onIndexChanged: (index){
//          print("点击第$index个");
          },
          //视窗分数
//        viewportFraction: 0.8,
          //比例
//        scale: 0.9,
//        itemHeight: h * 0.8,
//        itemWidth: MediaQuery.of(context).size.width * 0.8,
          //
//        layout: SwiperLayout.CUSTOM,
//        customLayoutOption: new CustomLayoutOption(
//          startIndex:  -1, /// 开始下标
//          stateCount: 3 /// 下面的数组长度
//        ).addRotate([//  每个元素的角度
//          -45.0/180,
//        0.0,
//        45.0/180]).addTranslate([ /// 每个元素的偏移
//          new Offset(-370.0, -40.0),
//          new Offset(0.0, 0.0),
//          new Offset(370.0, -40.0)
//        ]),



        ),

      ),
    );
  }

}