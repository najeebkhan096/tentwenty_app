import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:tentwenty/Screens/DetailScreen.dart';
import 'package:tentwenty/modal/genre.dart';

import 'package:tentwenty/modal/movie.dart';
import 'package:tentwenty/provider/genre.dart';

import 'package:tentwenty/style/text.dart';
import 'package:tentwenty/widgets/appbar.dart';
import 'package:tentwenty/widgets/bottom_nav_bar.dart';

class MovieResultScreen extends StatelessWidget {

  
  const MovieResultScreen ({Key? key,required this.movies}) : super(key: key);
  final List<Movie>? movies;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery
        .of(context)
        .size
        .height;

    return Scaffold(
      bottomNavigationBar: const Custom_Nav_Bar(),
      appBar: BuildResultAppbar(height:
      MediaQuery.of(context).orientation == Orientation.portrait?
      height*0.11:
        height*0.16
        ,length: movies!.length,),
      body:    ListView(
        children: List.generate(
            movies!.length , (index) => InkWell(
          onTap: (){
            SystemChrome.setSystemUIOverlayStyle(
                const SystemUiOverlayStyle(
                  statusBarColor: Colors.transparent, // status bar color
                ));


            Navigator.of(context).push(
              PageRouteBuilder(
                  pageBuilder: (_, __, ___) =>   DetailScreen(movie:  movies![index]),
                  transitionsBuilder: (context, animation, secondaryAnimation, child) {
                    return SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(1, 0),
                        end: Offset.zero,
                      ).animate(animation),
                      child: child,
                    );
                  }
              ),
            );
            },
          child: buildMovie(
              context,
              movies![index]),
        )
        ),
      ),
    );

  }
  Widget buildMovie(BuildContext context, Movie movie){
    final height = MediaQuery
        .of(context)
        .size
        .height;
    final width = MediaQuery
        .of(context)
        .size
        .width;

    return
      MediaQuery.of(context).orientation == Orientation.portrait?
      Row(
        children: [
          Card(
            elevation: 1,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)
            ),
            margin: EdgeInsets.only(bottom: height*0.025,
                left: width*0.025,
                right: width*0.025
            ),
            child: Container(
              height: height*0.17,
              width: width*0.32,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage('https://image.tmdb.org/t/p/w500${movie.backdropPath}'))
              ),

            ),
          ),
          Expanded(
            child: Container(
                margin: EdgeInsets.only(left: width*0.025,right: width*0.05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BuildBlackText(txt: movie.title!, fontsize: height*0.025, weight: FontWeight.w500),
                    SizedBox(height: height*0.01,),
                    FutureBuilder(
                        future:  Future.value(  Provider.of<GenreProvider>(context, listen: false).getGenresByID(movie.genreIds!)),
                        builder: (ctx,AsyncSnapshot<List<Genre>> snapshot){
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return const Text("");
                          } else if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                            return         BuildBlackText(txt: "No Genre found", fontsize: height*0.025, weight: FontWeight.w500);
                          } else {
                            final genres = snapshot.data!;

                            return Wrap(
                              children: List.generate(genres.length, (index) => BuildLightGrey(txt: "${genres[index].name!} , ", fontsize: height*0.018, weight: FontWeight.w500)
                              ),
                            );
                          }})
                  ],
                )),
          ),

          Padding(
            padding:  EdgeInsets.only(right: width*0.05),
            child: const Icon(Icons.more_horiz,color: Color(0xff61C3F2),),
          )

        ],
      ):
      Row(
        children: [
          Card(
            elevation: 1,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)
            ),
            margin: EdgeInsets.only(bottom: height*0.025,
                left: width*0.025,
                right: width*0.025
            ),
            child: Container(
              height: height*0.35,
              width: width*0.32,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage('https://image.tmdb.org/t/p/w500${movie.backdropPath}'))
              ),

            ),
          ),
          Expanded(
            child: Container(
                margin: EdgeInsets.only(left: width*0.025,right: width*0.05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BuildBlackText(txt: movie.title!, fontsize: height*0.05, weight: FontWeight.w500),
                    SizedBox(height: height*0.01,),
                    FutureBuilder(
                        future:  Future.value(  Provider.of<GenreProvider>(context, listen: false).getGenresByID(movie.genreIds!)),
                        builder: (ctx,AsyncSnapshot<List<Genre>> snapshot){
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return const Text("");
                          } else if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                            return         BuildBlackText(txt: "No Genre found", fontsize: height*0.025, weight: FontWeight.w500);
                          } else {
                            final genres = snapshot.data!;

                            return Wrap(
                              children: List.generate(genres.length, (index) => BuildLightGrey(txt: "${genres[index].name!} , ", fontsize: height*0.038, weight: FontWeight.w500)
                              ),
                            );
                          }})
                  ],
                )),
          ),

          Padding(
            padding:  EdgeInsets.only(right: width*0.05),
            child: const Icon(Icons.more_horiz,color: Color(0xff61C3F2),),
          )

        ],
      );

  }
}

