import 'package:flutter/material.dart';
import 'package:imdb/main.dart';
import '../Models/Movie.dart' as models;

class MovieItem extends StatelessWidget {
  final models.Movie movie;

  MovieItem({required this.movie});

  @override
  Widget build(BuildContext context) {
    final posterUrl = 'http://image.tmdb.org/t/p/w500${movie.poster}';
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Column(children: <Widget>[
            if (posterUrl != "N/A")
              Image.network(posterUrl, height: 110, width: 180)
          ]),
          Expanded(child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(this.movie.title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(color: iconBool? Colors.black : Colors.white),
                ),
                Text(this.movie.year, style: TextStyle(color: iconBool? Colors.black : Colors.white),),
              ]),)
        ],
      ),
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(top: 8, left: 10, right: 10),
      decoration:
          new BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(5)),color:iconBool? Color.fromARGB(255, 235, 235, 235): Colors.grey),
    );
  }
}