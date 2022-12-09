import 'package:flutter/material.dart';
import '../components/MovieItem.dart';
import '../Models/Movie.dart';

class MovieList extends StatelessWidget {
  final List<Movie> movies;
  final Function itemClick;

  MovieList({required this.movies, required this.itemClick});

  @override
  Widget build(context) {
    return new Container(
        decoration: BoxDecoration(color: Colors.white),
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