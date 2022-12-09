import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import '../Models/Movie.dart';
import '../Models/MovieInfo.dart';

Future<List<Movie>> getSearchedMovies(String query) async {
    List<Movie> movies = [];
      http.Response response = await http.get(Uri.parse(
          'https://api.themoviedb.org/3/search/movie?api_key=40797ff2c89935778fc86188943b775a&language=en-US&query=$query&page=1&include_adult=false'));
      var res = jsonDecode(response.body);
      res['results'].forEach(
        (m) => movies.add(
          Movie.fromJson(m),
        ),
      );
      return movies;
  }
//get movie detail
Future<MovieInfo> getMovie(movieId) async {
  final response = await http.get(Uri.parse('https://api.themoviedb.org/3/movie/$movieId?api_key=1bc27d63dab9edb89c8f9e6fad91dfab'));
  if (response.statusCode == 200) {
    final data = jsonDecode(response.body) as Map<String,dynamic>;
    return MovieInfo.fromJSON(data);
    }
   else {
    throw Exception('Something went wrong !');
  }
}

Future<List<Movie>> fetchTopRatedMovies(int page) async {
    final response = await get(Uri.parse('https://api.themoviedb.org/3/movie/top_rated?api_key=1bc27d63dab9edb89c8f9e6fad91dfab'));
    final json = jsonDecode(response.body);
    final results = json['results'] as List<dynamic>;
    return results.map((e) => Movie.fromJson(e)).toList();
}

Future<List<Movie>> fetchTrendingMovies(int page) async {
  //https://api.themoviedb.org/3/trending/all/day?api_key=1bc27d63dab9edb89c8f9e6fad91dfab
    final response = await get(Uri.parse('https://api.themoviedb.org/3/movie/upcoming?api_key=1bc27d63dab9edb89c8f9e6fad91dfab'));
    final json = jsonDecode(response.body);
    final results=json['results'] as List<dynamic>;
    return results.map((e) => Movie.fromJson(e)).toList();
  }

  Future<List<Movie>> fetchUpcomingMovies(int page) async {
    final response = await get(Uri.parse('https://api.themoviedb.org/3/movie/upcoming?api_key=1bc27d63dab9edb89c8f9e6fad91dfab'));
    final json = jsonDecode(response.body);
    final results=json['results'] as List<dynamic>;
    return results.map((e) => Movie.fromJson(e)).toList();
  }