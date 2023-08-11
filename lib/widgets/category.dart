import 'package:flutter/material.dart';

import 'package:tentwenty/style/text.dart';
class CategoryTile extends StatelessWidget {



  CategoryTile({super.key});
 final  List<Map> categ=[
    {
      'url':'images/comedies.png',
      'title':'Comedies'
    },
    {
      'url':'images/crime.png',
      'title':'Crime'
    },
    {
      'url':'images/family.png',
      'title':'Family'
    },
    {
      'url':'images/docs.png',
      'title':'Documentation'
    },
    {
      'url':'images/dramas.png',
      'title':'Dramas'
    },
    {
      'url':'images/fantasy.png',
      'title':'Fantasy'
    },
    {
      'url':'images/holidays.png',
      'title':'Holidays'
    },
    {
      'url':'images/horor.png',
      'title':'Horor'
    },
    {
      'url':'images/scifi.png',
      'title':'Sci-fi'
    },
    {
      'url':'images/thriller.png',
      'title':'Thriller'
    },


  ];


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


    return

    MediaQuery.of(context).orientation == Orientation.portrait?

      Container(
      height: height*1,
      margin: EdgeInsets.only(
          left: width*0.025,
          right: width*0.025
      ),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns in the grid
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10,
          mainAxisExtent:


          110
        ),
        itemCount: categ.length, // Total number of items in the grid
        itemBuilder: (BuildContext context, int index) {
          return   Container(
            width: width*1,

            decoration: BoxDecoration(

                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(categ[index]['url']))
            ),
            alignment: Alignment.bottomLeft,
            child: Container(
              width: width*0.8,
              padding:  EdgeInsets.only(bottom: height*0.025,
                  left: width*0.05
              ),
              child:BuildWhiteText(txt: categ[index]['title'],
                  fontsize: width*0.05, weight: FontWeight.w500),
            ),
          );
        },
      ),
    ) :      Container(
      height: height*1,
      margin: EdgeInsets.only(
          left: width*0.025,
          right: width*0.025
      ),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Number of columns in the grid
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10,
            mainAxisExtent:
            160
        ),
        itemCount: categ.length, // Total number of items in the grid
        itemBuilder: (BuildContext context, int index) {
          return   Container(
            width: width*1,

            decoration: BoxDecoration(

                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(categ[index]['url']))
            ),
            alignment: Alignment.bottomLeft,
            child: Container(
              width: width*0.8,
              padding:  EdgeInsets.only(bottom: height*0.025,
                  left: width*0.05
              ),
              child:BuildWhiteText(txt: categ[index]['title'],
                  fontsize: width*0.05, weight: FontWeight.w500),
            ),
          );
        },
      ),
    ) ;
  }

}

