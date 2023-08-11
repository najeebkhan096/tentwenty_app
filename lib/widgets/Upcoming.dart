import 'package:flutter/material.dart';
import 'package:tentwenty/Screens/categories.dart';

import 'package:tentwenty/modal/movie.dart';

import 'package:tentwenty/style/text.dart';

class UpComingMovies extends StatelessWidget {
   const UpComingMovies({Key? key,required this.movies}) : super(key: key);
  final List<Movie>? movies;

  @override
  Widget build(BuildContext context) {

    return       Column(
      children: List.generate(
    movies!.length , (index) => InkWell(
      onTap: (){

        Navigator.of(context).push(
            PageRouteBuilder(
                pageBuilder: (_, __, ___) =>  const CategoryScreen(),
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
        child: BuildMovie(
            context,
      movies![index]),
    )
      ),
    );

  }
  Widget BuildMovie(BuildContext context, Movie movie){
    final height = MediaQuery
        .of(context)
        .size
        .height;
    final width = MediaQuery
        .of(context)
        .size
        .width;


    return
      OrientationBuilder(
        builder: (context, orientation) {

      return MediaQuery.of(context).orientation == Orientation.portrait?
      Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)
        ),
        margin: EdgeInsets.only(bottom: height*0.025,
            left: width*0.025,
            right: width*0.025
        ),
        child: Container(

          height: height*0.3,
          width: width*1,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage('https://image.tmdb.org/t/p/w500${movie.backdropPath}'))
          ),
          alignment: Alignment.bottomLeft,
          child: Container(
            width: width*0.8,
            padding:  EdgeInsets.only(bottom: height*0.025,
                left: width*0.05
            ),
            child:BuildWhiteText(txt: movie.title!,
                fontsize: width*0.05, weight: FontWeight.w500),
          ),
        ),
      )
          :
          Card(
          elevation: 3,
          shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)
          ),
          margin: EdgeInsets.only(bottom: height*0.025,
          left: width*0.025,
          right: width*0.025
          ),
          child: Container(

          height: height*0.55,
          width: width*1,
          decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage('https://image.tmdb.org/t/p/w500${movie.backdropPath}'))
          ),
          alignment: Alignment.bottomLeft,
          child: Container(
          width: width*0.8,
          padding:  EdgeInsets.only(bottom: height*0.025,
          left: width*0.05
          ),
          child:BuildWhiteText(txt: movie.title!,
          fontsize: width*0.05, weight: FontWeight.w500),
          ),
          ),
          );
        });


  }
}

