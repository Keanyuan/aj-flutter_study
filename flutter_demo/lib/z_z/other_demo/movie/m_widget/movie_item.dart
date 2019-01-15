import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_demo/z_z/other_demo/movie/movies_detail_page.dart';
import '../model/movie_model.dart';

class MovieItemBig extends StatelessWidget {

  final Movie movie;
  final GestureTapCallback onTap;
  final GestureTapCallback collectionTap;

  MovieItemBig(this.movie, {this.onTap, this.collectionTap});


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        color: Colors.black87,
        child: Material(//也必须被Material所包裹。
          color: Colors.transparent,
          child: InkWell( //水波纹
            onTap: this.onTap,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Hero(
                        tag: "movie-${movie.id}",
                        child: Image.network(
                          movie.poster,
                          width: 150,
                          height: double.infinity,
                          fit: BoxFit.cover,
                        )
                    ),
                    SizedBox(
                      width: 30,
                      height: 18,
                      child: Container(
                          alignment: Alignment.center,
                          color: Colors.green,
                          child: Text(
                            movie.rating,
                            style: TextStyle(color: Colors.white),
                          )),
                    ),
                  ],
                ),
                Expanded(
                    child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Text(
                                    movie.title,
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: this.collectionTap,
                                  child: Icon(
                                    Icons.grade,
                                    size: 22,
                                    color: movie.hasLiked
                                        ? Colors.red
                                        : Colors.white,
                                  ),
                                )
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 3),
                            ),
                            Text(
                              '导演: ${movie.director}',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 16, color: Colors.white54),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 3),
                            ),
                            Text(
                              '主演: ${movie.actors[0].name}',
                              style: TextStyle(
                                  fontSize: 16, color: Colors.white54),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 3),
                            ),
                            Text(
                              '上映: ${movie.year}',
                              style: TextStyle(
                                  fontSize: 16, color: Colors.white54),
                            ),
                            Expanded(
                              child: Container(),
                            ),
                            Text(
                              movie.shortReview,
                              style: TextStyle(
                                  color: Colors.white70, fontSize: 16),
                            ),
                          ],
                        )))
              ],
            ),
          ),
        ));
  }

}




class MovieItemSmall extends StatelessWidget  {
  final Movie movie;
  final GestureTapCallback onTap;
  final GestureTapCallback collectionTap;


  MovieItemSmall(this.movie,{this.onTap, this.collectionTap});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Material(
        color: Colors.grey,
        child: InkWell(
          onTap: this.onTap,
          child: Stack(children: <Widget>[
            Positioned.fill(
              child: Hero(
                tag: 'movie-${movie.id}',
                child: FadeInImage.memoryNetwork(
                  image: movie.poster,
                  fadeInDuration: Duration(milliseconds: 200),
                  placeholder: kTransparentImage,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned.fromRect(
              rect: Rect.fromLTWH(0, 0, 30, 18),
              child: Container(
                  alignment: Alignment.center,
                  color: Colors.green,
                  child: Text(
                    movie.rating,
                    style: TextStyle(color: Colors.white),
                  )),
            ),
            Positioned.fill(
                left: 0,
                top: constraints.maxHeight - 60,
                child: Container(
                    color: Colors.black87,
                    child: Padding(
                      padding: EdgeInsets.all(7.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Text(
                                    movie.title,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: this.collectionTap,
                                  child: Icon(
                                    Icons.grade,
                                    size: 18,
                                    color: movie.hasLiked
                                        ? Colors.red
                                        : Colors.white,
                                  ),
                                )
                              ],
                            ),
                            Text(
                              movie.actors
                                  .map((actor) => actor.name)
                                  .join("/"),
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Colors.white70, fontSize: 14),
                            ),
                          ]),
                    ))),
          ]),
        ),
      );
    });
  }

}


final Uint8List kTransparentImage = new Uint8List.fromList(<int>[
  0x89,
  0x50,
  0x4E,
  0x47,
  0x0D,
  0x0A,
  0x1A,
  0x0A,
  0x00,
  0x00,
  0x00,
  0x0D,
  0x49,
  0x48,
  0x44,
  0x52,
  0x00,
  0x00,
  0x00,
  0x01,
  0x00,
  0x00,
  0x00,
  0x01,
  0x08,
  0x06,
  0x00,
  0x00,
  0x00,
  0x1F,
  0x15,
  0xC4,
  0x89,
  0x00,
  0x00,
  0x00,
  0x0A,
  0x49,
  0x44,
  0x41,
  0x54,
  0x78,
  0x9C,
  0x63,
  0x00,
  0x01,
  0x00,
  0x00,
  0x05,
  0x00,
  0x01,
  0x0D,
  0x0A,
  0x2D,
  0xB4,
  0x00,
  0x00,
  0x00,
  0x00,
  0x49,
  0x45,
  0x4E,
  0x44,
  0xAE,
]);