import 'package:flutter/material.dart';


class MyCustomLabelView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CustomViewState();
  }
}

class _CustomViewState extends State<MyCustomLabelView>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MyCustomLabelView"),
      ),
      body: Container(child: LabelView(
        Container(
          child: ListView(
            children: <Widget>[
              Image.asset(
                "images/item2.png",
                height: 120,
                width: 500,
                fit: BoxFit.fill,
                alignment: Alignment.topLeft,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "根据我们以前学过的知识不难发现，我们这里使用Stack时最好的，位于栈定的Widget会覆盖位于栈底的Widget。\n所以，我们把用于组合的子child放在栈底（第一个位置，优先入栈），把我们自定义的LabelView放在第二个位置，这样我们就实现了LabelView覆盖在子child上的效果。",
                style: TextStyle(height: 1.2),
              ),
              Divider(
                height: 2.0,
                color: Colors.grey,
              )
            ],
          ),
        ),
        size: Size(500, 240),
        labelColor: Colors.deepOrangeAccent,
        labelAlignment: LabelAlignment.rightTop,
        useAngle: false,
        labelText: "霸气",
      )),

    );
  }
}





class LabelView extends StatefulWidget {
  final Size size;
  final Color labelColor;
  final labelAlignment;
  final bool useAngle;
  final String labelText;
  final TextStyle textStyle;
  final Widget child;


  LabelView(this.child,{
    this.size=Size.infinite,
    this.labelColor = Colors.blue,
    this.labelAlignment = LabelAlignment.leftTop,
    this.useAngle = false,
    this.labelText = "HOT",
    this.textStyle,
  });

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LabelViewState();
  }
}

class _LabelViewState extends State<LabelView> {

  static final double PI = 3.1415926;
  var textAngle;
  var textAlignment;
  var offset;

  @override
  Widget build(BuildContext context) {

    var offsetX = widget.size.width > widget.size.height
        ? widget.size.height / 4.5
        : widget.size.width / 4.5;
    switch (widget.labelAlignment) {
      case LabelAlignment.leftTop:
        offset = Offset(offsetX, 0);
        textAlignment = Alignment.topLeft;
        textAngle = -PI / 4;
        break;
      case LabelAlignment.rightTop:
        offset = Offset(-offsetX, 0);
        textAlignment = Alignment.topRight;
        textAngle = PI / 4;
        break;
      case LabelAlignment.leftBottom:
        offset = Offset(offsetX, 0);
        textAlignment = Alignment.bottomLeft;
        textAngle = PI / 4;
        break;
      case LabelAlignment.rightBottom:
        offset = Offset(-offsetX, 0);
        textAlignment = Alignment.bottomRight;
        textAngle = -PI / 4;
        break;
    }

    return Container(
      width: widget.size.width,
      height: widget.size.height,
      child: Stack(children: <Widget>[
        widget.child,
        CustomPaint(
          size: widget.size,
          painter: LabelViewPainter(
              labelAlignment: widget.labelAlignment,
              labelColor: widget.labelColor,
              useAngle: widget.useAngle
          ),
          child: Align(
            alignment: textAlignment,
            child: Transform.rotate(
              angle: textAngle,
              child: Text(
                widget.labelText,
                style: widget.textStyle == null ? TextStyle(color: Colors.white) : widget.textStyle,
              ),
              origin: offset,
            ),
          ),
        )
      ],),

    );
  }
}








class LabelViewPainter extends CustomPainter {

  var labelColor;
  var labelAlignment;
  var useAngle;
  var _paint;

  LabelViewPainter({this.labelColor = Colors.redAccent, this.labelAlignment = LabelAlignment.leftTop, this.useAngle = false}) {
    _paint = new Paint()
      ..color = labelColor
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true
      ..style = PaintingStyle.fill
      ..strokeWidth = 5.0;
  }


  @override
  void paint(Canvas canvas, Size size) {
    Path path = new Path();

    /*

    path.lineTo(100, 0);
    path.lineTo(0, 100);

    path.moveTo(200, 0);
    path.lineTo(200, 100);
    path.lineTo(100, 0);

    path.moveTo(0, 200);
    path.lineTo(100, 200);
    path.lineTo(0, 100);


    path.moveTo(200, 100);
    path.lineTo(100, 200);
    path.lineTo(200, 200);


    取size的宽和高最小值的二分之一为我们label的边长。
    */
    var drawSize = size.height > size.width ? size.width / 2 : size.height / 2;

    print(drawSize);

    switch(labelAlignment){
      case LabelAlignment.leftTop:

        if (!useAngle) {

          path.moveTo(drawSize/2, 0);
          path.lineTo(0, drawSize/2);

        }

        path.lineTo(0, drawSize);
        path.lineTo(drawSize, 0);

        break;
      case LabelAlignment.leftBottom:

        path.moveTo(0, size.height - drawSize);

        if(useAngle){
          path.lineTo(drawSize, size.height);
          path.lineTo(0, size.height);
        }else{
          path.lineTo(0, size.height-drawSize/2);
          path.lineTo(drawSize/2, size.height);
          path.lineTo(drawSize, size.height);
        }

        break;
      case LabelAlignment.rightTop:
        path.moveTo(size.width - drawSize, 0);

        if (useAngle) {
          path.lineTo(size.width, 0);

        }else{
          path.lineTo(size.width - drawSize / 2, 0);
          path.lineTo(size.width, drawSize / 2);
        }
        path.lineTo(size.width, drawSize);

        break;
      case LabelAlignment.rightBottom:

        if(useAngle){
          path.moveTo(size.width, size.height);

          path.lineTo(size.width - drawSize, size.height);
          path.lineTo(size.width, size.height - drawSize);
        }else{
          path.moveTo(size.width-drawSize, size.height);
          path.lineTo(size.width - drawSize/2, size.height);
          path.lineTo(size.width, size.height - drawSize/2);
          path.lineTo(size.width, size.height - drawSize);
        }


        break;
      default:
        if (!useAngle) {

          path.moveTo(drawSize/2, 0);
          path.lineTo(0, drawSize/2);
        }
        path.lineTo(0, drawSize);
        path.lineTo(drawSize, 0);
        break;
    }

    path.close();
    canvas.drawPath(path, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}


class LabelAlignment {
  int labelAlignment;

  LabelAlignment(this.labelAlignment);

  static const leftTop = 0;
  static const leftBottom = 1;
  static const rightTop = 2;
  static const rightBottom = 3;
}