import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:imdb/Pages/MovieDetail.dart';
import 'package:imdb/Services/MovieService.dart';
import '../Components/MovıeList.dart';
import '../Models/Movie.dart';
import 'package:http/http.dart' as http;
import '../Models/MovieInfo.dart';

class TopMovieTab extends StatefulWidget {
  @override
  TopMovieTabState createState() => TopMovieTabState();
}

class TopMovieTabState extends State<TopMovieTab> {
  Color mainColor = const Color(0xfffeca07);
  
  void itemClick(Movie item) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => MovieDetail(
                movieName: item.title,
                imdbId: item.imdbID,
              )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(    
        body:
        Column(
          children: <Widget>[          
                (FutureBuilder<List<Movie>>(
                  future: fetchTopRatedMovies(1),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Expanded(
                          child: MovieList(
                              movies: snapshot.data!,
                              itemClick: this.itemClick));
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }
                    return CircularProgressIndicator();
                  }))             
          ],
        ),      
        );
  }
}