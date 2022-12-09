import 'package:intl/intl.dart';

class Movie {
  final String title;
  final String year;
  final String poster;
  final String imdbID;

  Movie({required this.title,required this.year,required this.poster, required this.imdbID});

  factory Movie.fromJson(Map<String, dynamic> json) {
    DateTime? dateParser = DateTime.parse(json['release_date']);
    var dateFormatter =new DateFormat('yMMM');
    String finalDate = (dateFormatter.format(dateParser)).toString();
    return Movie(
        title: json['title'],
        year: finalDate.replaceAll(',','') ?? "null",
        poster: json['backdrop_path'],
        imdbID: json['id'].toString());
  }
}