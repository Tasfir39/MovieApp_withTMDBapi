import 'package:flutter/material.dart';
import 'package:movie_app_tmdbapi/text.dart';
import 'package:movie_app_tmdbapi/toprated.dart';
import 'package:movie_app_tmdbapi/traindingmovie.dart';
import 'package:movie_app_tmdbapi/tv.dart';
import 'package:tmdb_api/tmdb_api.dart';

class homePage extends StatefulWidget {


  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {


  List trendingMovie=[];
  List topratedMovies=[];
  List tv=[];

  final String key="09d0c4e6f53cb7f2a6f7cdc182eaf1c7";
  final String readacesstoken="eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwOWQwYzRlNmY1M2NiN2YyYTZmN2NkYzE4MmVhZjFjNyIsInN1YiI6IjYyMjhhMzY2MGE1MTdjMDAxZGZjNTcxNSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.lVRCtAN-4T64vIiNkyF1c8EXdtwfIzqyuKuk0bmMGjM";

  @override
  void initState() {
    // TODO: implement initState
    loadmovies();
    super.initState();
  }

  loadmovies()async{

    TMDB tmdbwithcustomlog= TMDB(ApiKeys(key,readacesstoken),
      logConfig: ConfigLogger(
          showLogs: true,
          showErrorLogs: true
      ),);

    Map trendingresult=await tmdbwithcustomlog.v3.trending.getTrending();
    Map topratedresult=await tmdbwithcustomlog.v3.movies.getTopRated();
    Map tvresult=await tmdbwithcustomlog.v3.tv.getPopular();
    print(trendingresult);

    setState(() {
      trendingMovie= trendingresult['results'];
      topratedMovies= topratedresult['results'];
      tv= tvresult['results'];
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:modifytext(text: "Movie App", color: Colors.white,size: 24,),
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.black54,
      body: ListView(
        children: [
          TV(tv: tv),
          topratedmovie(toprated:topratedMovies),

          traindingmovie(trending:trendingMovie),


        ],
      ),
    );
  }
}