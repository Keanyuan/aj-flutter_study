import 'dart:io';
import '../model/movie_model.dart';

import 'api.dart';
import 'dart:convert';

class RealAPI extends API {
  @override
  Future<MovieEnvelope> getMovieList(int start) async {
    var client = HttpClient();
    var request = await client.getUrl(Uri.parse(
        'https://api.douban.com/v2/movie/top250?start=$start&count=40'));
    print("https://api.douban.com/v2/movie/top250?start=$start&count=40");
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
