import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_tmdbapi/text.dart';

import 'description.dart';

class traindingmovie extends StatelessWidget {
  const traindingmovie({Key? key, required this.trending}) : super(key: key);

  final List trending;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modifytext(text: "Trending Movies", color: Colors.white, size: 20),
          SizedBox(height: 20,),

          Container(
            height: 270,
            child: ListView.builder(itemCount: trending.length,scrollDirection: Axis.horizontal, itemBuilder: (context,index)
            {
              return InkWell(
                onTap: (){

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Description(
                            name: trending[index]['title'],
                            bannerurl:
                            'https://image.tmdb.org/t/p/w500' +
                                trending[index]['backdrop_path'],
                            posterurl:
                            'https://image.tmdb.org/t/p/w500' +
                                trending[index]['poster_path'],
                            description: trending[index]['overview'],
                            vote: trending[index]['vote_average']
                                .toString(),
                            launch_on: trending[index]
                            ['release_date'],
                          )));
                },

                child: Container(
                  width: 140,
                  child: Column(
                    children: [
                      Container(
                        height:200,
                        decoration: BoxDecoration(image: DecorationImage(
                          image: NetworkImage(
                            'https://image.tmdb.org/t/p/w500'+trending[index]['poster_path']
                          ),
                        )),
                      ),

                      Container(
                        height: 50,
                        child: modifytext(color: Colors.white, size: 18,text: trending[index]['title']!=null?
                        trending[index]['title']:'Loading', ),
                      ),
                    ],
                  ),
                ),
              );
            }
            ),
          ),

        ],
      ),
    );
  }
}
