import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tentwenty/Screens/MovieResult.dart';
import 'package:tentwenty/modal/movie.dart';
import 'package:tentwenty/provider/movie.dart';
import 'package:tentwenty/style/text.dart';
import 'package:tentwenty/widgets/bottom_nav_bar.dart';
import 'package:tentwenty/widgets/category.dart';
import 'package:tentwenty/widgets/top_results.dart';

class CategoryScreen extends StatefulWidget {
   const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
final TextEditingController _controller=TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery
        .of(context)
        .size
        .height;
    final width = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
      backgroundColor: bgcolor,
       bottomNavigationBar: const Custom_Nav_Bar(),
      appBar:


      PreferredSize(

          preferredSize:  Size.fromHeight(

              MediaQuery.of(context).orientation == Orientation.portrait?
              height*0.11:
          height*0.18
          ),

          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.only(bottom: 10,left: 15,right: 15),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [

                TextField(
                  controller: _controller,
                  onEditingComplete: (){


                    Navigator.of(context).push(
                      PageRouteBuilder(
                          pageBuilder: (_, __, ___) =>  MovieResultScreen(movies:  Provider.of<MovieProvider>(context, listen: false).searchedmovies),
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
                  onChanged: (value){
                   List<Movie> movies= Provider.of<MovieProvider>(context, listen: false).movies;
               var data=movies.where((element) => element.title!.toUpperCase() .contains(_controller.text.toUpperCase())).toList();
                   Provider.of<MovieProvider>(context, listen: false).setSearchedMovies(data);
setState(() {

});
                  },
                  style: const TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    filled: true,
                    prefixIcon:    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("images/search.png",height:
                        MediaQuery.of(context).orientation == Orientation.portrait?
                        height*0.055:height*0.09,
                          width:
                          MediaQuery.of(context).orientation == Orientation.portrait?
                          width*0.08:width*0.06,
                          fit: BoxFit.fill,),
                      ],
                    ),
                    suffixIcon: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: (){
                            _controller.clear();
                            setState(() {

                            });
                          },
                          child: Image.asset("images/close.png",

                            height:
                            MediaQuery.of(context).orientation == Orientation.portrait?
                            height*
                                0.04:height*0.07,
                            width:
                            MediaQuery.of(context).orientation == Orientation.portrait?
                            width*0.07:width*0.05,
                            fit: BoxFit.fill,),
                        ),
                      ],
                    ),
                    hintText: "TV shows, movies and more",
                    fillColor: const Color(0xffF2F2F6), // Background color
                    contentPadding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0), // Border radius
                      borderSide: BorderSide.none,

                    ),
                  ),
                ),
              ],
            ),
          )),
      body: ListView(
        children:  [

          SizedBox(height: height*0.025,),
         _controller.text.isEmpty?
         CategoryTile():
         TopResultsScreen(
           movies:  Provider.of<MovieProvider>(context, listen: false).searchedmovies,
         )
          ,


        ],
      ),
    );
  }
}