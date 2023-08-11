import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:tentwenty/Api/api_request.dart';
import 'package:tentwenty/Screens/MovieDateScreen.dart';
import 'package:tentwenty/Screens/video_player.dart';
import 'package:tentwenty/modal/genre.dart';

import 'package:tentwenty/modal/movie.dart';
import 'package:tentwenty/provider/genre.dart';

import 'package:tentwenty/style/text.dart';


class DetailScreen extends StatefulWidget {

  const DetailScreen ({Key? key,required this.movie}) : super(key: key);
  final Movie movie;

  @override
  State<DetailScreen> createState() => _DetailScreenState();

}

class _DetailScreenState extends State<DetailScreen> {


  @override
  void dispose() {
    // TODO: implement dispose
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          statusBarColor: Colors.white, // status bar color
        ));
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body:    SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
     children: [

         BuildPoster(
             context,
             widget.movie),
         BuildDescription(context, widget.movie),

     ],
        ),
      ),
    );

  }

  Widget BuildPoster(BuildContext context, Movie movie){
    final height = MediaQuery
        .of(context)
        .size
        .height;
    final width = MediaQuery
        .of(context)
        .size
        .width;

    return
      Stack(
        children: [
          Container(
            height:
            MediaQuery.of(context).orientation == Orientation.portrait?
            height*0.55:height*1.5,
            width: width*1,
            decoration: BoxDecoration(

                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage('https://image.tmdb.org/t/p/w500${movie.backdropPath}'))
            ),

          ),
          Container(
            margin: EdgeInsets.only(left: width*0.025,top:
            MediaQuery.of(context).orientation == Orientation.portrait?
            height*0.05:
            height*0.1
            ),
            child: Row(
              children: [
                IconButton(
                  icon:const Icon(
                  Icons.arrow_back_ios_new,color: Colors.white),
                onPressed: (){
                Navigator.of(context).pop();
                },),
SizedBox(width: width*0.018,),
                BuildWhiteText(txt: "Watch", fontsize: MediaQuery.of(context).size.width * 16 / 375, weight: FontWeight.w500),

              ],
            ),
          ),
          Positioned(
            bottom: height*0.05,
            child: SizedBox(
              width: width*1,
              child: Column(
                children: [
                  BuildWhiteText(txt: "In theaters december 22, 2021", fontsize:
                  MediaQuery.of(context).orientation == Orientation.portrait?
                  height*0.025:height*0.042, weight: FontWeight.w500),
                  SizedBox(height: height*0.015,),
                  InkWell(
                    onTap: (){

                      Navigator.of(context).push(
                        PageRouteBuilder(
                            pageBuilder: (_, __, ___) =>  MovieDateScreen(movie:  movie),
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
                    child: Container(
                      height:
                      MediaQuery.of(context).orientation == Orientation.portrait?
                      height*0.07:height*0.13,
                      width:
                      MediaQuery.of(context).orientation == Orientation.portrait?
                      width*0.6:width*0.3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xff61C3F2)
                      ),
                      child: Center(child: BuildWhiteText(txt: "Get Tickets", fontsize:
                      MediaQuery.of(context).orientation == Orientation.portrait?
                      height*0.025:height*0.043, weight: FontWeight.w500)),
                    ),
                  ),

                  SizedBox(height:           MediaQuery.of(context).orientation == Orientation.portrait? height*0.01:
                    height*0.025,),
                  InkWell(
                    onTap: ()async{
                      String ? videourl=await api_request.getTrailerURL(movieid: movie.id);


                      Navigator.of(context).push(
                        PageRouteBuilder(
                            pageBuilder: (_, __, ___) =>
                                YoutubePlayVideo(
                                  videoid: videourl,
                                ),
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
                    child: Container(
                      height:
                      MediaQuery.of(context).orientation == Orientation.portrait?
    height*0.07:height*0.13
                      ,
                      width:
                      MediaQuery.of(context).orientation == Orientation.portrait?
                      width*0.6:width*0.3,
                      decoration: BoxDecoration(
                         border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.play_arrow_rounded,color: Colors.white,),
                          SizedBox(
                            width: width*0.015,
                          ),
                          BuildWhiteText(txt: "Watch Trailer", fontsize: height*0.025, weight: FontWeight.w500),
                        ],
                      ),
                    ),
                  ),

                ],
              ),
            ),
          )

        ],
      );

  }

  Widget BuildDescription(BuildContext context, Movie movie){
    final height = MediaQuery
        .of(context)
        .size
        .height;
    final width = MediaQuery
        .of(context)
        .size
        .width;

    return
     Container(
       margin: EdgeInsets.only(left: width*0.1,top: height*0.025),
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           BuildBlackText(txt: "Genre", fontsize:
           MediaQuery.of(context).orientation == Orientation.portrait?
           height*0.025:height*0.036, weight: FontWeight.w500),
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
                     children: List.generate(genres.length, (index) => Container(
                       margin: EdgeInsets.only(right: width*0.015),
                       child: Chip(

                           label: BuildLightGrey(txt: genres[index].name, fontsize:
                           MediaQuery.of(context).orientation == Orientation.portrait?height*0.018:
                               height*0.024
                               , weight: FontWeight.w500),
                           backgroundColor: index==0?const Color(0xff15D2BC):
                           index==1?const Color(0xffE26CA5):
                           index==2?const Color(0xff564CA3)
                               :const Color(0xffCD9D0F),
                       ),
                     )
                     ),
                   );
                 }}),
           SizedBox(height: height*0.015,),
           BuildBlackText(txt: "Overview", fontsize: height*0.025, weight: FontWeight.w500),
           SizedBox(height: height*0.015,),
           BuildBlackText(txt: "As a collection of history's worst tyrants and criminal masterminds gather to plot a war to wipe out millions, one man must race against time to stop them. Discover the origins of the very first independent intelligence agency in The King's Man. The Comic Book “The Secret Service” by Mark Millar and Dave Gibbons.",
               fontsize: height*0.02, weight: FontWeight.w400),



         ],
       ),
     );

  }
}

