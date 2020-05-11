import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:ui' as flutterui;

import 'package:flutter/rendering.dart' as ui;
import 'package:flutter/services.dart' as ui;
import 'package:flutter/widgets.dart' as ui;
import 'package:flutter/material.dart' as ui;
import 'package:flutter/painting.dart' as ui;


class CustomImageView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PainterDemoState();
  }
}

class PainterDemoState extends State<CustomImageView> {
  var image;

  @override
  void initState() {
    super.initState();
    ImageLoader.load("images/item2.png").then((image) {
      setState(() {
        this.image = image;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PainterDemo"),
      ),
      body: CustomPaint(
        painter: CirclePainter(image),
      ),
    );
  }
}

class CirclePainter extends CustomPainter {
  var image;

  Paint _paint = new Paint()
    ..color = Colors.blueAccent
    ..strokeCap = StrokeCap.round
    ..isAntiAlias = true
    ..style = PaintingStyle.stroke
    ..strokeWidth = 5.0;

  CirclePainter(this.image);

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawImage(image, Offset(100.0, 100.0), _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

//class ImageLoader {
//  static ui.AssetBundle getAssetBundle() => (ui.rootBundle != null)
//      ? ui.rootBundle
//      : new ui.NetworkAssetBundle(new Uri.directory(Uri.base.origin));
//
//  static Future<flutterui.Image> load(String url) async {
//    ui.ImageStream stream = new ui.AssetImage(url, bundle: getAssetBundle())
//        .resolve(ui.ImageConfiguration.empty);
//    Completer<flutterui.Image> completer = new Completer<flutterui.Image>();
//    void listener(ui.ImageInfo frame, bool synchronousCall) {
//      final flutterui.Image image = frame.image;
//      completer.complete(image);
//      stream.removeListener(listener);
//    }
//
//    stream.addListener(listener);
//    return completer.future;
//  }
//}

// Flutter 1.7.8使用
 class ImageLoader {
   static ui.AssetBundle getAssetBundle() => (ui.rootBundle != null)
       ? ui.rootBundle
       : new ui.NetworkAssetBundle(new Uri.directory(Uri.base.origin));

   static Future<flutterui.Image> load(String url) async {
     ui.ImageStream stream = new ui.AssetImage(url, bundle: getAssetBundle())
         .resolve(ui.ImageConfiguration.empty);
     Completer<flutterui.Image> completer = new Completer<flutterui.Image>();
     final listener = ImageStreamListener((ImageInfo info, bool synchronousCall){
       final flutterui.Image image = info.image;
       completer.complete(image);
     });

     stream.addListener(listener);
     completer.future.then((_) {
       stream.removeListener(listener);
     });
     return completer.future;
   }
 }