import 'package:flutter/material.dart';
import 'package:imdb/main.dart';
import '../Components/PaddedText.dart';
import '../Models/MovieInfo.dart';
import '../Services/MovieService.dart';

class MovieDetail extends StatelessWidget {
  final String movieName;
  final String imdbId;
  Color mainColor = const Color(0xfffeca07);

  MovieDetail({required this.movieName, required this.imdbId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:iconBool? mainColor: Color.fromARGB(255, 58, 58, 58),
        title: Text(this.movieName,style: TextStyle(color:iconBool? Colors.black: Colors.white),),
      ),
      body: FutureBuilder<MovieInfo>(
          future: getMovie(this.imdbId),
          builder: (context, snapshot) {
              final posterUrl = 'http://image.tmdb.org/t/p/w500${snapshot.data!.poster}';
              return Container(
                  color:iconBool? Colors.white : Color.fromARGB(255, 99, 99, 99),
                  padding: EdgeInsets.all(20),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                       Container(
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                          alignment: Alignment.center,
                          child: 
                          Image.network(posterUrl,height:300,width: 300,),
                        ),
                        Text(snapshot.data!.overview, textAlign: TextAlign.justify,style: TextStyle(color: iconBool? Colors.black : Colors.white),),
                        PaddedText("Year : " + snapshot.data!.year),
                        //PaddedText("Runtime : " + snapshot.data!.runtime),
                        PaddedText("IMDB Rating : " + snapshot.data!.imdbRating),
                        PaddedText("Popularity : " + snapshot.data!.popularity),
                      ]));
            }
            //return Center(child: CircularProgressIndicator());
          ),
    );
  }
}