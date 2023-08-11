import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tentwenty/provider/genre.dart';
import 'package:tentwenty/provider/movie.dart';
import 'package:tentwenty/style/text.dart';

import 'package:tentwenty/widgets/appbar.dart';
import 'package:tentwenty/widgets/bottom_nav_bar.dart';
import 'package:tentwenty/widgets/Upcoming.dart';

class WatchScreen extends StatefulWidget {
  const WatchScreen({Key? key}) : super(key: key);

  @override
  State<WatchScreen> createState() => _WatchScreenState();
}

class _WatchScreenState extends State<WatchScreen> {
bool fetched=false;

@override
void initState() {
  super.initState();
  // Fetch movies when the app loads
  Provider.of<MovieProvider>(context, listen: false).fetchMovies().then((value) {
    setState(() {

    });
  });
  Provider.of<GenreProvider>(context, listen: false).fetchGenres();

}

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery
        .of(context)
        .size
        .height;

    return Scaffold(
      backgroundColor: bgcolor,
      extendBody: true,
      bottomNavigationBar: const Custom_Nav_Bar(),
      appBar: BuildAppbar(height: height * 0.085,),
      body: ListView(
        children:  [

          SizedBox(height: height*0.025,),

          UpComingMovies(
            movies:  Provider.of<MovieProvider>(context, listen: false).movies,
          )
        //
         ],
      ),
    );
  }
}