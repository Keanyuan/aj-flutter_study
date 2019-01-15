import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/z_z/other_demo/movie/m_widget/movie_hero.dart';
import 'package:flutter_demo/z_z/other_demo/movie/model/movie_model.dart';
import 'package:flutter_demo/z_z/other_demo/movie/services/real_api.dart';

class MoviesDetailPage extends StatefulWidget {
  final Movie movie;
  MoviesDetailPage({Key key, this.movie,}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MoviePageState();
  }
}


class _MoviePageState extends State<MoviesDetailPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    if(widget.movie == null){
      return Scaffold(body: Container(color: Color(0xfff4f4f4), child: Center(child: CupertinoActivityIndicator()),),);
    }

    return Scaffold(
      backgroundColor: Color(0xfff4f4f4),
      body: DefaultTabController(
          length: 2,
          child: SafeArea(
            top: false,
            child: CustomScrollView(
              slivers: <Widget>[
                MovieHero(widget.movie),
                SliverToBoxAdapter(
                    child: MovieSummary(summary: widget.movie.summary,),
                ),
                SliverToBoxAdapter(
                  child: MovieActors(movie: widget.movie,),
                ),
                SliverPadding(
                  padding: EdgeInsets.all(7.0),
                ),
                SliverToBoxAdapter(child:MovieReviewTabbarContent(movie: widget.movie),),
              ],
            ),

          )),
    );
  }
}