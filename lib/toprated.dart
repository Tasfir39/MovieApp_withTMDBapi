import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_tmdbapi/text.dart';

class topratedmovie extends StatelessWidget {
  const topratedmovie({Key? key, required this.toprated}) : super(key: key);

  final List toprated;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modifytext(text: "Top Rated Movies", color: Colors.white, size: 20),
          SizedBox(height: 20,),

          Container(
            height: 270,
            child: ListView.builder(itemCount: toprated.length,scrollDirection: Axis.horizontal, itemBuilder: (context,index)
            {
              return InkWell(
                onTap: (){},

                child: Container(
                  width: 140,
                  child: Column(
                    children: [
                      Container(
                        height:200,
                        decoration: BoxDecoration(image: DecorationImage(
                          image: NetworkImage(
                              'https://image.tmdb.org/t/p/w500'+toprated[index]['poster_path']
                          ),
                        )),
                      ),

                      Container(
                        height: 50,
                        child: modifytext(color: Colors.white, size: 18,text: toprated[index]['title']!=null?
                        toprated[index]['title']:'Loading', ),
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
