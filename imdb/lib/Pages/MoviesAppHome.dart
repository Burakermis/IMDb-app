import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:imdb/Pages/MovieDetail.dart';
import 'package:imdb/Pages/TopMovieTab.dart';
import 'package:imdb/Pages/TrendMovieTab.dart';
import 'package:imdb/Pages/UpcomingMovieTab.dart';
import 'package:imdb/Services/MovieService.dart';
import '../Components/MovıeList.dart';
import '../Models/Movie.dart';
import 'package:http/http.dart' as http;
import '../Models/MovieInfo.dart';
import '../main.dart';

class MoviesAppHome extends StatefulWidget {
  List<Widget> pages=[TopMovieTab(),TrendMovieTab(),UpcomingMovieTab()];
  int pageindex=0;
  @override
  MoviesAppHomeState createState() => MoviesAppHomeState();
}

class MoviesAppHomeState extends State<MoviesAppHome> {
  final searchTextController = TextEditingController();
  String searchText = "";
  Color mainColor = const Color(0xfffeca07);

  @override
  void dispose() {
    searchTextController.dispose();
    super.dispose();
  }

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
    double height = MediaQuery.of(context).size.height;
    // Dark mode ve light mode için icon simgeleri
    IconData _iconDark= Icons.nights_stay;
    IconData _iconLight=Icons.wb_sunny;
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 2.0, vertical: 16.0),
              child: Column(
                children: [
                  Text(
                    "IMDb",
                    style: TextStyle(color:iconBool?Colors.black : mainColor ,fontFamily: 'Arvo',fontWeight: FontWeight.bold,fontSize:20),
                  ),
                ],
              ),
            ),
      elevation: 0.3,
      backgroundColor: iconBool? mainColor : Color.fromARGB(255, 58, 58, 58),
      title: Container(
              height: 45,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: TextField(
                    controller: searchTextController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Search Movie",
                      suffixIcon: IconButton(
                          icon: Icon(Icons.search,color: Colors.black,),
                          onPressed: () {
                            setState(() {
                            searchText = searchTextController.text;
                            SystemChannels.textInput.invokeMethod('TextInput.hide');
                    });
                          }),
                    )),
              ),
            ),
      actions: [
        IconButton(
            onPressed: (){
              setState(() {
                iconBool=!iconBool;
              });
            },
            icon: Icon(iconBool ? _iconDark : _iconLight),
          ),
          IconButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut().then(
                    (value) =>
                        Navigator.of(context).pushReplacementNamed('/login'),
                  );
            },
            icon:Icon(
              color: iconBool? Colors.black : Colors.white,
              Icons.logout,
            ),
          ),         
        ],
    ),
        body:SizedBox( 
          height: height,
          child: 
            searchText.length > 0  ? (FutureBuilder<List<Movie>>(
                  future: getSearchedMovies(searchText),
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
                  })) :  
                  (widget.pages[widget.pageindex])                                
        ),  
        bottomNavigationBar: Theme(
        data: ThemeData(canvasColor: iconBool? Colors.white : Color.fromARGB(255, 58, 58, 58)),
        child : BottomNavigationBar(
        onTap: (index){
          setState(() {
            searchText="";
            searchTextController.text="";
            widget.pageindex=index;
            print(widget.pageindex);
          });
        },
        unselectedItemColor:iconBool? Colors.grey : Colors.white,
        selectedItemColor: Color(0xfffeca07),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.align_vertical_bottom),
            label: 'Top Rated',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.trending_up),
            label: 'Trend',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.update),
            label: 'Upcoming',
          ),
        ],            
        ),
        ),
        );
  }
}