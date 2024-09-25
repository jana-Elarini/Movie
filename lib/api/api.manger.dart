import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/category.dart';
import '../response/MovieDetailResponse.dart';
import 'apicontants.dart';

class ApiManager {
  static const popularUrl =
      "https://api.themoviedb.org/3/movie/popular?api_key=${Constants.apiKey}";
  static const topRatedUrl =
      'https://api.themoviedb.org/3/movie/top_rated?api_key=${Constants.apiKey}';

  static const upcomingUrl =
      'https://api.themoviedb.org/3/movie/upcoming?api_key=${Constants.apiKey}';

  static Future<List<Movie>> getPopularMovies() async {
    final response = await http.get(Uri.parse(popularUrl));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Something happened');
    }
  }

  ////////////////////////////////////////////////

  static Future<List<Movie>> getTopRatedMovies() async {
    final response = await http.get(Uri.parse(topRatedUrl));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Something happened');
    }
  }

//////////////////////////////////////

  static Future<List<Movie>> getUpcomingMovies() async {
    final response = await http.get(Uri.parse(upcomingUrl));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Something happened');
    }
  }

  static Future<MovieDetailResponse> getMovieDetails(int id) async {
    Uri url = Uri.https('api.themoviedb.org', Constants.getDetails(id),
        {"api_key": Constants.apiKey, "language": "en-US"});
    print(url);
    try {
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return MovieDetailResponse.fromJson(json);
    } catch (e) {
      print(e);
      throw e;
    }
  }
}
