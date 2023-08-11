import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:tentwenty/Screens/watch.dart';
import 'package:tentwenty/provider/genre.dart';
import 'package:tentwenty/provider/movie.dart';

void main(){

  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
      statusBarColor: Colors.white, // status bar color
  ));
  runApp(const MyApp());

}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MovieProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => GenreProvider(),
        ),

      ],

      child: const MaterialApp(
        home: WatchScreen(),
        debugShowCheckedModeBanner: false,
        routes: {

        },
      ),
    );
  }
}
