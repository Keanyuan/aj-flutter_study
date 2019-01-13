import 'package:flutter/material.dart';

///定义一个起始 hero widget，称为源 hero 。
/// hero 指定其图形表示（通常是图片）和识别标记，并且位于源路由定义的当前显示的 widget树中。
///定义一个结束的 hero widget，称为目标 hero 。
/// 这位 hero 也指定了它的图形表示，以及与源 hero 相同的标记。
/// 重要的是两个 hero widget都使用相同的标签创建，通常是代表底层数据的对象。
/// 为了获得最佳效果， hero 应该有几乎相同的 widget树。
class BasicHeroAnimation extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}


class _MyHomePageState extends State<BasicHeroAnimation> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hero Animation"),
      ),
      body: new Center(
        child: new InkWell(
          onTap: (){
            Navigator.of(context).push(new PageRouteBuilder(
              pageBuilder:
                  (BuildContext context, _, __) {
                return new NextHeroAnimation();
              },
            ));
//            Navigator.of(context).push(new MaterialPageRoute(
//              builder: (context) {
//                return new NextHeroAnimation();
//              },
//            ));
          },
          child: new Hero(tag: "myHero", child: new SizedBox(
            width: 100.0,
            child: new Image.asset("images/item2.png"),
          )),
        ),
      ),
    );
  }


}


class NextHeroAnimation extends StatefulWidget {
  @override
  _NextHomePageState createState() => _NextHomePageState();
}


class _NextHomePageState extends State<NextHeroAnimation> with SingleTickerProviderStateMixin {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Next Hero Animation"),
      ),
      body: new Container(
        padding: const EdgeInsets.all(8.0),
        alignment: Alignment.topLeft,
        color: Colors.lightBlueAccent,
        child: new Hero(
            tag: "myHero", 
            child: new Image.asset("images/item2.png")),
      ),
    );
  }


}
