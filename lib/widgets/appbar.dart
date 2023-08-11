import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tentwenty/Screens/categories.dart';
import 'package:tentwenty/modal/movie.dart';
import 'package:tentwenty/provider/movie.dart';
import 'package:tentwenty/style/text.dart';
class BuildAppbar extends StatelessWidget implements PreferredSizeWidget{
  final double ? height;
  const BuildAppbar({super.key,required this.height});

  @override
  Size get preferredSize => Size.fromHeight(height!); // Set your desired height

  @override
  Widget build(BuildContext context) {

    final width=MediaQuery.of(context).size.height;
    return

      OrientationBuilder(
        builder: (context, orientation) {

      return MediaQuery.of(context).orientation == Orientation.portrait?
      AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title:BuildBlackText(txt: "Watch", fontsize: MediaQuery.of(context).size.width * 16 / 375, weight: FontWeight.w500),
        actions: [
          InkWell(
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
            child: Container(
               margin: EdgeInsets.only(right: width*0.025),
                child: Image.asset("images/search.png",width: width*0.05,)),
          ),

        ],
      ):
      AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title:BuildBlackText(txt: "Watch", fontsize: MediaQuery.of(context).size.width * 16 / 375, weight: FontWeight.w500),
        actions: [
          InkWell(
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
            child: Container(
                margin: EdgeInsets.only(right: width*0.025),

                child: Image.asset("images/search.png",width: width*0.2,height: MediaQuery.of(context).size.height*0.1,)),
          ),

        ],
      );
        });

  }
}



// ignore: must_be_immutable
class BuildSearchAppbar extends StatelessWidget implements PreferredSizeWidget{
  final double ? barheight;
   BuildSearchAppbar({super.key,required this.barheight});

  @override
  Size get preferredSize => Size.fromHeight(barheight!); // Set your desired height
TextEditingController text=TextEditingController();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery
        .of(context)
        .size
        .height;
    final width=MediaQuery.of(context).size.height;
    return PreferredSize(

        preferredSize: preferredSize,

        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.only(bottom: 10,left: 15,right: 15),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [

              TextField(
                controller: text,
                onChanged: (value){
                  Provider.of<MovieProvider>(context, listen: false);
                },
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  filled: true,
                  prefixIcon:    Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("images/search.png",height: height*0.055,
                      width: width*0.055,
                    fit: BoxFit.fill,),
                  ],
                ),
                  suffixIcon: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("images/close.png",height: height*0.04,
                        width: width*0.04,
                        fit: BoxFit.fill,),
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
        ));
  }
}


class BuildResultAppbar extends StatelessWidget implements PreferredSizeWidget{
  final double ? height;
  final int ? length;
  const BuildResultAppbar({super.key,required this.height,required this.length});

  @override
  Size get preferredSize => Size.fromHeight(height!); // Set your desired height

  @override
  Widget build(BuildContext context) {


    return  AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      leading: IconButton(
        icon:const Icon(
        Icons.arrow_back_ios_new,color: Colors.black,),
      onPressed: (){
          Navigator.of(context).pop();
      },
      ),
      title:BuildBlackText(txt: "$length Results Found", fontsize: MediaQuery.of(context).size.width * 16 / 375, weight: FontWeight.w500),

    );
  }
}


class BuildMovieDateAppbar extends StatelessWidget implements PreferredSizeWidget{
  final double ? height;
  final Movie ? movie;
  final String  ? subtitle;

  const BuildMovieDateAppbar({super.key,required this.height,this.movie,required this.subtitle});

  @override
  Size get preferredSize => Size.fromHeight(height!); // Set your desired height

  @override
  Widget build(BuildContext context) {


    return  AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      leading: IconButton(
        icon:
      const Icon(
        Icons.arrow_back_ios_new,color: Colors.black,
      ),
        onPressed: (){
          Navigator.of(context).pop();
        },
      ),
      centerTitle: true,
      title:Column(
        children: [
          BuildBlackText(txt:movie!.title! ,


              fontsize:
              MediaQuery.of(context).orientation == Orientation.portrait?
              MediaQuery.of(context).size.width * 16 / 375: MediaQuery.of(context).size.height*0.04
              , weight: FontWeight.w500),
          BuildBlueText(txt:subtitle , fontsize:
          MediaQuery.of(context).orientation == Orientation.portrait?
          MediaQuery.of(context).size.width * 16 / 375:
          MediaQuery.of(context).size.height*0.03
              , weight: FontWeight.w500),

        ],
      ),

    );
  }
}


class BuildDetailAppbar extends StatelessWidget implements PreferredSizeWidget{
  final double ? height;

  const BuildDetailAppbar({super.key,required this.height});

  @override
  Size get preferredSize => Size.fromHeight(height!); // Set your desired height

  @override
  Widget build(BuildContext context) {


    return  AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      leading: const Icon(Icons.arrow_back_ios_new,color: Colors.black,),
      title:BuildBlackText(txt: "Watch", fontsize: MediaQuery.of(context).size.width * 16 / 375, weight: FontWeight.w500),

    );
  }
}
