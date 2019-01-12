
import 'dart:ui';

import 'package:flutter/material.dart';

///绘制需要
/// 画布canvas  拥有多种绘制点、线、路径、矩形、圆形、以及添加图像的方法
/// canvas中有多个与绘制相关的方法，如drawLine()、drawRect()、drawOval()、drawOval()、等方法
/// 画笔Paint 设置画笔的颜色、粗细、是否抗锯齿、笔触形状以及作画风格
/// Offset坐标 在坐标系中的一个点
/// Rect 区域绘制，这个区域一般都是一个矩形，
/// Rect.fromCircle（Offset center, double radius）center就是圆心的坐标，radius就是圆的半径
/// 在Flutter中坐标系的坐标原点在左上角，X坐标越往右越大，Y坐标越往下越大

class MyCustomView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CustomViewState();
  }
}

class _CustomViewState extends State<MyCustomView>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PrinterLineDemo"),
      ),
      body: Container(child: CustomPaint(painter: LinePainter(),),),
    );
  }
}

class LinePainter extends CustomPainter{

  Paint _paint = new Paint()
    ..color = Colors.red //画笔颜色
    ..strokeCap = StrokeCap.round //画笔笔触类型
    ..isAntiAlias = true //是否启动抗锯齿
    //..style = PaintingStyle.fill //绘画风格，默认为填充
    //..blendMode = BlendMode.exclusion //颜色混合模式
  //颜色渲染模式，一般是矩阵效果来改变的，但是flutter中只能使用颜色混合模式
    //..colorFilter= ColorFilter.mode(Colors.blueAccent, BlendMode.exclusion)
    //..maskFilter= MaskFilter.blur(BlurStyle.inner, 3.0) //模糊遮罩效果，flutter中只有这个
    //..filterQuality = FilterQuality.high //颜色渲染模式的质量
    ..strokeWidth = 5.0 //画笔的宽度
  ;

  //绘制
  @override
  void paint(Canvas canvas, Size size) {

    //绘制 点
    canvas.drawPoints(
      //PointMode的枚举类型有三个，points（点），lines（线，隔点连接），polygon（线，相邻连接）
        PointMode.polygon,
        [
          Offset(20, 200),
          Offset(40.0, 240.0),

          Offset(40.0, 280.0),
          Offset(60.0, 280.0),

          Offset(60.0, 240.0),
          Offset(80.0, 200.0),

          Offset(20, 200),
        ],
        _paint);

    //绘制 线
    canvas.drawLine(Offset(350.0, 20.0), Offset(350.0, 100.0), _paint);
    //圆
    //圆心坐标 、 半径
    _paint.style = PaintingStyle.stroke;
    canvas.drawCircle(Offset(200, 60), 40, _paint);


    /// 椭圆
    ///fromPoints(Offset a, Offset b)
    ///使用左上和右下角坐标来确定矩形的大小和位置
    ///fromCircle({ Offset center, double radius })
    ///使用圆的圆心点坐标和半径和确定外切矩形的大小和位置
    ///fromLTRB(double left, double top, double right, double bottom)
    ///使用矩形左边的X坐标、矩形顶部的Y坐标、矩形右边的X坐标、矩形底部的Y坐标来确定矩形的大小和位置
    ///fromLTWH(double left, double top, double width, double height)
    ///使用矩形左边的X坐标、矩形顶部的Y坐标矩形的宽高来确定矩形的大小和位置
    Rect rect1 = Rect.fromPoints(Offset(260.0, 20.0), Offset(300.0, 100.0));
    canvas.drawOval(rect1, _paint);


    //圆弧 需要Rect来确认圆弧的位置，还需要开始的弧度、结束的弧度、是否使用中心点绘制、以及paint
    /*
    | 度 | 弧度
    | :——: | :——: |
    | 0° | 0 |
    | 30°| π/6 |
    | 45°| π/4 |
    | 60°| π/3 |
    | 90°| π/2 |
    | 120°| 2π/3 |
    | 180°| π |
    | 270°| 3π/2 |
    | 360°| 2π |
    */
    double PI = 3.1415926;
    Rect rect2 = Rect.fromCircle(center: Offset(20, 20), radius: 80);
    var sweepAngle = PI / 6;
    var startAngle = 0.0;
    var useCenter = true;
    canvas.drawArc(rect2, startAngle, sweepAngle, useCenter, _paint);


    //圆角矩形
    Rect rect3 = Rect.fromCircle(center: Offset(180.0, 200.0), radius: 40.0);
    //修改圆角的值 改变圆角
    RRect rRect = RRect.fromRectAndRadius(rect3, Radius.circular(20.0));
    canvas.drawRRect(rRect, _paint);

    //环形
    Rect outerRect = Rect.fromCircle(center: Offset(300.0, 180.0), radius: 60.0);
    Rect innerRect = Rect.fromCircle(center: Offset(300.0, 180.0), radius: 40.0);
    //修改圆角的值 改变圆角
    RRect rRectouter = RRect.fromRectAndRadius(outerRect, Radius.circular(20.0));
    RRect rRectinner = RRect.fromRectAndRadius(innerRect, Radius.circular(20.0));
    canvas.drawDRRect(rRectouter, rRectinner, _paint);


    ///绘制路径drawPath
    ///drawPath(Path path, Paint paint)
    Path path = new Path();
    path.moveTo(50.0, 300.0);
    path.lineTo(150.0, 300.0);
    path.lineTo(150.0, 500.0);
    path.lineTo(50.0, 500.0);
    path.moveTo(150.0, 400.0);
    path.lineTo(50.0, 400.0);
    canvas.drawPath(path, _paint);

    Path path1 = new Path();
    //开始的弧度、结束的弧度、是否使用中心点绘制
    //二阶贝塞尔曲线绘制弧线
//    path1.arcTo(Rect.fromCircle(center: Offset(300.0, 400.0), radius: 80.0), 0, 3.14, false);
    path1.arcTo(Rect.fromCircle(center: Offset(300.0, 400.0), radius: 80.0), 0, 6.28, false);
    canvas.drawPath(path1, _paint);


    //三阶贝塞尔曲线 ❤️
    Path path2 = new Path();
    var width = 200;
    var height = 300;
    path2.moveTo(width / 2, height / 4);
    path2.cubicTo((width * 6) / 7, height / 9, (width * 12) / 13,
        (height * 2) / 5, width / 2, (height * 7) / 12);
    canvas.drawPath(path2, _paint);

    Path path3 = new Path();
    path3.moveTo(width / 2, height / 4);
    path3.cubicTo(width / 7, height / 9, width / 13, (height * 2) / 5,
        width / 2, (height * 7) / 12);
    canvas.drawPath(path3, _paint);


    //
    _paint.strokeWidth = 20;
    _paint.blendMode = BlendMode.colorBurn;
    _paint.isAntiAlias = false;
    canvas.drawCircle(Offset(100, 600), 80.0, _paint);


  }

  //是否重新绘制
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }

}