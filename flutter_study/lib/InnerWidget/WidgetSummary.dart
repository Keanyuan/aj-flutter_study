
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study/InnerWidget/AJRoundButton.dart';
import 'package:flutter_study/InnerWidget/RoundInnerSquareBox.dart';

class WidgetSummary extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _WidgetSummaryState();
  }
}

class _WidgetSummaryState extends State<WidgetSummary> {

  bool offstage;

  @override
  void initState() {
    super.initState();
    offstage = false;
  }

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(
        title: Text("控件汇总"),
      ),
      body: new CustomScrollView(
        scrollDirection: Axis.vertical,
        slivers: <Widget>[
          SliverList(delegate: SliverChildListDelegate([
            _buildRoundInnerSquareBox(),
          ]))],
      ),
    );

  }


  Widget _buildRoundInnerSquareBox(){
    return new RoundInnerSquareBox(
      child: new Container(
        padding: const EdgeInsets.fromLTRB(24.0, 28.0, 24.0, 12.0),
        width: double.infinity,
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Wrap(
              alignment: WrapAlignment.start,
              direction: Axis.horizontal,
              children: <Widget>[
                new WorkTotalItem(
                  title: "课文跟读 12",
                ),
                new WorkTotalItem(
                  title: "课文跟读 12",
                ),
                new WorkTotalItem(
                  title: "课文跟读 12",
                ),
                new WorkTotalItem(
                  title: "课文跟读 12",
                ),
              ],
            ),

            new Container(
              constraints: new BoxConstraints.expand(
                height:
                Theme.of(context).textTheme.display1.fontSize * 1.1 + 200.0,
              ),
              decoration: new BoxDecoration(
                border: new Border.all(width: 2.0, color: Colors.red),
                color: Colors.green,
                borderRadius: new BorderRadius.all(new Radius.circular(20.0)),
                image: new DecorationImage(
                  image: new NetworkImage(
                      'http://h.hiphotos.baidu.com/zhidao/wh%3D450%2C600/sign=0d023672312ac65c67506e77cec29e27/9f2f070828381f30dea167bbad014c086e06f06c.jpg'),
                  centerSlice: new Rect.fromLTRB(270.0, 180.0, 1360.0, 730.0),
                ),
              ),
              padding: const EdgeInsets.all(8.0),
              alignment: Alignment.center,
              child: new Text('Hello World',
                  style: Theme
                      .of(context)
                      .textTheme
                      .display1
                      .copyWith(color: Colors.black)),
              //Z轴旋转
              transform: new Matrix4.rotationZ(0.1),
            ),

            new Container(
              margin: const EdgeInsets.fromLTRB(0.0, 120.0, 0.0, 10.0),
              child: new AJRoundButton(
                width: 250.0,
                height: 80.0,
                backgroundColor: const Color(0xFF41CB39),
                activeBackgroundColor: const Color(0xB341CB39),
                disabledBackgroundColor: const Color(0x3341CB39),
                title: new Text(
                  "I am a custom button",
                  style: new TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                  ),
                ),
                disabled: false,
                onPress: () {
                  final snackBar = new SnackBar(content: new Text('Click Two!!'));
                  Scaffold.of(context).showSnackBar(snackBar);
                },
              ),
            ),


            SizedBox(height: 20.0,),
            ///横纵比
            new Container(
              height: 200.0,
              child: new AspectRatio(
                aspectRatio: 4/3,
                child: new Container(
                  color: Colors.red,
                ),
              ),
            ),
            SizedBox(height: 20.0,),

            //限制框
            new ConstrainedBox(
              constraints: const BoxConstraints(
                minWidth: 100.0,
                minHeight: 100.0,
                maxWidth: 150.0,
                maxHeight: 150.0,
              ),
              child: new Container(
                width: 200.0,
                height: 200.0,
                color: Colors.red,
              ),
            ),
            SizedBox(height: 20.0,),

            new Offstage(
              offstage: offstage,
              child: Container(color: Colors.blue, height: 100.0),
            ),
            SizedBox(height: 20.0,),

            new CupertinoButton(
              child: Text("点击切换显示"),
              color: Colors.red,
              pressedOpacity: 0.6,
              borderRadius: const BorderRadius.all(Radius.circular(22.0)),
              onPressed: () {
                setState(() {
                  offstage = !offstage;
                });
              },
            ),
            SizedBox(height: 20.0,),

            Container(
              color: Colors.red,
              child: Transform(
                origin: Offset.zero,
                alignment: Alignment.topLeft,
                transform: Matrix4.rotationZ(0.3),
                child: Container(
                  color: Colors.blue,
                  width: 100.0,
                  height: 100.0,
                ),
              ),
            ),
            SizedBox(height: 40.0,),

            Container(
              color: Colors.blue,
              padding: const EdgeInsets.all(5.0),
              child: CustomSingleChildLayout(
                delegate: FixedSizeLayoutDelegate(Size(200.0, 200.0)),
                child: Container(
                  color: Colors.red,
                  width: 100.0,
                  height: 300.0,
                ),
              ),
            ),
            SizedBox(height: 20.0,),

            IntrinsicHeight(child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Expanded(
                  child: Container(
                    height: 150.0,
                    color: Colors.red,
                    padding: EdgeInsets.all(5.0),
                  ),
                  flex: 1,
                ),
                Expanded(
                  child: Container(
                    color: Colors.yellow,
                    padding: EdgeInsets.all(5.0),
                  ),
                  flex: 3,
                ),
                Expanded(
                  child: Container(
                    color: Colors.blue,
                    padding: EdgeInsets.all(5.0),
                  ),
                  flex: 1,
                ),
              ],
            ),)

          ],
        ),
      ),

    );
  }

}

class WorkTotalItem extends StatelessWidget {
  WorkTotalItem({
    this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: const EdgeInsets.all(6.0),
      child: new Text(
        "$title",
        style: new TextStyle(
          fontSize: 14.0,
          color: Colors.white,
        ),
      ),
    );
  }
}



class FixedSizeLayoutDelegate extends SingleChildLayoutDelegate {
  FixedSizeLayoutDelegate(this.size);

  final Size size;

  @override
  Size getSize(BoxConstraints constraints) => size;

  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
    return new BoxConstraints.tight(size);
  }

  @override
  bool shouldRelayout(FixedSizeLayoutDelegate oldDelegate) {
    return size != oldDelegate.size;
  }
}