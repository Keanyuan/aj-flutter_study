import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../model/movie_model.dart';

import 'api.dart';
import 'dart:convert';

class RealAPI extends API {
  @override
  Future<MovieEnvelope> getMovieList(int start) async {
    var client = HttpClient();
    var request = await client.getUrl(Uri.parse(
        'https://api.douban.com/v2/movie/top250?start=$start&count=40'));
    var response = await request.close();
    var responseBody = await response.transform(utf8.decoder).join();
    Map data = json.decode(responseBody);
    return MovieEnvelope.fromJSON(data);
  }

  @override
  Future<Movie> getMovie(String movieID) async {
    var client = HttpClient();
    var request = await client
        .getUrl(Uri.parse('https://api.douban.com/v2/movie/subject/$movieID'));
    var response = await request.close();
    var responseBody = await response.transform(utf8.decoder).join();
    Map data = json.decode(responseBody);
    return Movie.fromJSON(data);
  }

}







class Loading {
  //加载样式
  static Future<Null> showLoadingDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return new Material(
              color: Colors.transparent,
              child: WillPopScope(
                onWillPop: () => new Future.value(false),
                child: Center(
                  child: new Container(
                    width: 200.0,
                    height: 200.0,
                    padding: new EdgeInsets.all(4.0),
                    decoration: new BoxDecoration(
                      color: Colors.transparent,
                      //用一个BoxDecoration装饰器提供背景图片
                      borderRadius: BorderRadius.all(Radius.circular(4.0)),
                    ),
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Container(child: SpinKitFadingGrid(color: Colors.white)),
                        new Container(height: 10.0),
                        new Container(child: new Text("努力加载中···", style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        ))),
                      ],
                    ),
                  ),
                ),
              ));
        });
  }
}
