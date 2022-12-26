import 'package:intl/intl.dart';
class MovieInfo {
  final String title;
  final String year;
  final String overview;
  final String poster;
  final String imdbRating;
  final String popularity;

  MovieInfo(
      {required this.title,
      required this.year,
      required this.overview,
      required this.poster,
      required this.imdbRating,
      required this.popularity});

  factory MovieInfo.fromJSON(Map<String, dynamic> json) {
    var dateParser = DateTime.parse(json['release_date']);
    var dateFormatter =new DateFormat('yMMM');
    String finalDate = (dateFormatter.format(dateParser)).toString();
    return MovieInfo(
        title: json['title'],
        year: finalDate.replaceAll(',', ''),
        overview: json['overview'],
        poster: json['backdrop_path'] ?? null,
        imdbRating: json['vote_average'].toString(),
        popularity: json['popularity'].toString());
  }
}