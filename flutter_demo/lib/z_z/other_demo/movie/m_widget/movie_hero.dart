import 'package:flutter/material.dart';
import 'package:flutter_demo/z_z/other_demo/movie/model/actor_model.dart';
import 'package:flutter_demo/z_z/other_demo/movie/model/movie_model.dart';
class MovieHero extends StatelessWidget {
  final Movie movie;
  MovieHero(this.movie);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SliverAppBar(
      expandedHeight: 300,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(movie.title),
        background: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            Positioned.fill(
              top: 0,
              bottom: 0,
              left: 0,
              right: 0,
              child: Hero(
                  tag: "movie-${movie.id}",
                  child: Image.network(
                    movie.poster,
                    fit: BoxFit.cover,
                  )
              ),
            ),
            Container(
              height: 200,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [Colors.black87, Colors.transparent],
                  )),
            )
          ],
        ),
      ),
    );
  }

}

class MovieSummary extends StatelessWidget {
  final String summary;

  MovieSummary({this.summary = "loading..."});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 15),
      child: Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(color: Colors.grey[300], width: 0.5),
            bottom: BorderSide(color: Colors.grey[300], width: 0.5),
          ),
        ),
        child: Column(children: <Widget>[
          Text(summary,style: TextStyle(color: Colors.black),)
        ],),
      ),
    );
  }
}

class MovieActors extends StatelessWidget {
  final Movie movie;

  MovieActors({this.movie});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(vertical: 7.0),
        ),
        Container(
            padding: EdgeInsets.only(top: 10.0),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  top: BorderSide(color: Colors.grey[300], width: 0.5),
                  bottom: BorderSide(color: Colors.grey[300], width: 0.5),
                )),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      '影人',
                      style: TextStyle(fontSize: 18),
                    )),
                Container(
                  height: 180,
                  child: ListView(
                    padding: EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 5.0),
                    itemExtent: 120,
                    scrollDirection: Axis.horizontal,
                    children: movie.actors
                        .map<Widget>((actor) => _MovieActor(
                      actor: actor,
                    ))
                        .toList(),
                  ),
                ),
              ],
            )),
      ],
    );
  }
}
const _defaultAvatar =
    'https://img3.doubanio.com/f/movie/8dd0c794499fe925ae2ae89ee30cd225750457b4/pics/movie/celebrity-default-medium.png';

class _MovieActor extends StatelessWidget {
  final Actor actor;
  _MovieActor({Key key, this.actor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.0),
      child: LayoutBuilder(builder: (context, constraint) {
        final height = constraint.maxHeight;
        return Column(
          children: <Widget>[
            Container(
              height: height - 30,
              width: double.infinity,
              child: Image.network(
                actor.avatar == null ? _defaultAvatar : actor.avatar,
                fit: BoxFit.cover,
              ),
            ),
            Text(
              actor.name,
              overflow: TextOverflow.ellipsis,
            )
          ],
        );
      }),
    );
  }
}



class MovieReviewTabbarContent extends StatelessWidget {
  final Movie movie;

  MovieReviewTabbarContent({this.movie});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: movie.reviews.map((reviews){
          return _MovieReview(
            content: reviews.content,
            avatar: reviews.avatar,
          );
        }).toList(),),
    );
  }
}

class _MovieReview extends StatelessWidget {
  final String avatar;
  final String content;

  _MovieReview({Key key, this.avatar, this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border(
            bottom:
            BorderSide(width: 0.5, color: Theme.of(context).dividerColor)),
        color: Colors.white,
      ),
      child: Row(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(avatar),
                )),
            width: 32,
            height: 32,
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.0),
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  content,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

