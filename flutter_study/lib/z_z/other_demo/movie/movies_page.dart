import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_study/z_z/other_demo/movie/m_widget/movie_item.dart';
import 'package:flutter_study/z_z/other_demo/movie/model/movie_model.dart';
import 'package:flutter_study/z_z/other_demo/movie/services/real_api.dart';


const int _childrenPerBlock = 5;
const int _rowsPerBlock = 3;

class MoviesPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MoviesPageState();
  }
}

class _MoviesPageState extends State<MoviesPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Douban Movie Top 250'),
        actions: <Widget>[
        ],
      ),
      body: Movies(),
    );
  }
}

class Movies extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MoviesState();
  }
}

class _MoviesState extends State<Movies> {
  RealAPI api = new RealAPI();
  MovieEnvelope _movieModel = MovieEnvelope();
  var _moviesIndex = 0;

  @override
  void initState() {
    super.initState();
    _moviesIndex = 0;
    _getMoviesInfo(_moviesIndex);
  }


  _getMoviesInfo(count) async{
    api.getMovieList(count).then((movieEnvelope){
      if (_movieModel.movies != null) {
        print(movieEnvelope.start);
        _movieModel.movies= _movieModel.movies
          ..addAll(movieEnvelope.movies);
        _movieModel.start = movieEnvelope.start;
        _movieModel.total = movieEnvelope.total;
        _movieModel.count += movieEnvelope.count;
      } else {
        _movieModel = movieEnvelope;
      }
      setState(() {
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _movieModel.movies == null ? Center(child: CupertinoActivityIndicator(),) :
    GridView.builder(
        gridDelegate: _MoviesGridDelegate(totalCount: _movieModel.movies.length + 1),
        itemCount: _movieModel.movies.length + 1,
        itemBuilder: (context, index){
          if (index == _movieModel.movies.length) {
            if (_movieModel.start >= _movieModel.total) {
              return Center(
                child: Text('没有更多了···'),
              );
            }
            _getMoviesInfo(_movieModel.count);

            return Center(
              child: CupertinoActivityIndicator(),
            );
          }
          Movie movie = _movieModel.movies[index];
          if (((index + 1) % _childrenPerBlock) == 1) {
            return MovieItemBig(movie);
          } else {
            return MovieItemSmall(movie);
          }

        },);
  }
}

class _MoviesGridDelegate extends SliverGridDelegate {
  static const int _spacing = 10;
  static const double _bottomHeight = 50;

  final int totalCount;

  _MoviesGridDelegate({@required this.totalCount});

  @override
  SliverGridLayout getLayout(SliverConstraints constraints) {
    final double tileWidth = (constraints.crossAxisExtent - _spacing) / 2.0;
    const double tileHeight = 250;
    return _MoviesGridLayout(
      tileWidth: tileWidth,
      tileHeight: tileHeight,
      rowStride: tileHeight + _spacing,
      columnStride: tileWidth + _spacing,
      bottomHeight: _bottomHeight,
      totalCount: totalCount,
    );
  }

  @override
  bool shouldRelayout(SliverGridDelegate oldDelegate) {
    return false;
  }
}

class _MoviesGridLayout extends SliverGridLayout {
  const _MoviesGridLayout({
    @required this.rowStride,
    @required this.columnStride,
    @required this.tileHeight,
    @required this.tileWidth,
    @required this.bottomHeight,
    @required this.totalCount,
  });

  final double rowStride; // 一行有多高
  final double columnStride; // 一列有多宽
  final double tileHeight; // 一行有多高（不带 spacing）
  final double tileWidth; // 一列有多宽（不带 spacing）
  final double bottomHeight; // 用于展示 loadmore
  final int totalCount;

  int rowOfIndex(int index) {
    return index ~/ _childrenPerBlock * _rowsPerBlock +
        <int>[0, 1, 1, 2, 2][index % _childrenPerBlock];
  }

  @override
  int getMinChildIndexForScrollOffset(double scrollOffset) {
    final nthRow = scrollOffset ~/ rowStride;
    return <int>[0, 1, 3][nthRow % _rowsPerBlock] +
        nthRow ~/ _rowsPerBlock * _childrenPerBlock;
  }

  @override
  int getMaxChildIndexForScrollOffset(double scrollOffset) {
    final nthRow = scrollOffset ~/ rowStride;
    return <int>[0, 2, 4][nthRow % _rowsPerBlock] +
        nthRow ~/ _rowsPerBlock * _childrenPerBlock;
  }

  @override
  SliverGridGeometry getGeometryForChildIndex(int index) {
    return SliverGridGeometry(
      crossAxisExtent:
      <int>[1, 0, 0, 0, 0][index % _childrenPerBlock] * columnStride +
          tileWidth,
      mainAxisExtent: (index == totalCount - 1) ? bottomHeight : tileHeight,
      crossAxisOffset:
      <int>[0, 0, 1, 0, 1][index % _childrenPerBlock] * columnStride,
      scrollOffset: rowOfIndex(index) * rowStride,
    );
  }

  @override
  double computeMaxScrollOffset(int childCount) {
    final offset = rowOfIndex(childCount - 1) * rowStride;
    return (childCount - 1) % _childrenPerBlock == 0
        ? offset + bottomHeight
        : offset;
  }
}