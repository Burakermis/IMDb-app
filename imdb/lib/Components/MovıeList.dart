import 'package:flutter/material.dart';
import 'package:imdb/main.dart';
import '../components/MovieItem.dart';
import '../Models/Movie.dart';

class MovieList extends StatelessWidget {
  final List<Movie> movies;
  final Function itemClick;

  MovieList({required this.movies, required this.itemClick});

  @override
  Widget build(context) {
    return new Container(
        decoration: BoxDecoration(color:iconBool? Colors.white : Color.fromARGB(255, 99, 99, 99)),
        child: ListView.builder(
            padding: const EdgeInsets.all(8.0),
            itemCount: this.movies.length,
            itemBuilder: (BuildContext context, int index) {
              return new GestureDetector(
                  child: MovieItem(movie: this.movies[index]),
                  onTap: () => this.itemClick(this.movies[index]));
            }));
  }
}