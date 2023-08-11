import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import 'package:tentwenty/Screens/SeatSelection.dart';

import 'package:tentwenty/modal/movie.dart';

import 'package:tentwenty/style/text.dart';
import 'package:tentwenty/widgets/appbar.dart';

class MovieDateScreen extends StatefulWidget {

  const MovieDateScreen ({Key? key,required this.movie}) : super(key: key);
  final Movie? movie;

  @override
  State<MovieDateScreen> createState() => _MovieDateScreenState();
}

class _MovieDateScreenState extends State<MovieDateScreen> {
  DateTime todaydate=DateTime.now();

  List<Map> time=[
    {
      'url':'images/seats.png',
      'status':false,
      'time':'12:30'

    },
    {
      'url':'images/seats.png',
      'status':false,
      'time':'13:00'

    },
    {
      'url':'images/seats.png',
      'status':false,
      'time':'14:30'

    },
    {
      'url':'images/seats.png',
      'status':false,
      'time':'16:00'

    },


  ];

  List<Map> dates=[
    {

      'status':true,
      'date':DateTime.now()

    },
    {

      'status':false,
      'date':DateTime.now().add(const Duration(days: 1))

    }, {

      'status':false,
      'date':DateTime.now().add(const Duration(days: 2))

    }, {

      'status':false,
      'date':DateTime.now().add(const Duration(days: 3))

    }, {

      'status':false,
      'date':DateTime.now().add(const Duration(days: 4))

    }, {

      'status':false,
      'date':DateTime.now().add(const Duration(days: 5))

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
    return Scaffold(
      backgroundColor: bgcolor,
      appBar: BuildMovieDateAppbar(height: height*0.14,movie: widget.movie,
      subtitle: 'In theaters ${widget.movie!.releaseDate}',
      ),
      body: ListView(

        children: [

          Container(
              margin: EdgeInsets.only(left: width*0.05,top: height*0.05),
              child: BuildBlackText(txt: "Date", fontsize: height*0.025, weight: FontWeight.w400))
   ,

          //showing dates
          Container(
            height:
            MediaQuery.of(context).orientation == Orientation.portrait?
            height*0.08:height*0.12,
        padding: EdgeInsets.only(left: width*0.05,top: height*0.02),
        child: ListView.builder(
            itemCount: dates.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context,index){
          return InkWell(
            onTap: (){
              setState(() {
                dates[index]['status']=    ! dates[index]['status'];
              });
            },
            child: Container(
                padding: const EdgeInsets.only(left: 16,right: 16,top: 10,bottom: 10),
                margin: EdgeInsets.only(right: width*0.025),
                decoration: BoxDecoration(
                    color:
                    dates[index]['status']?
                    const Color(0xff61C3F2):Colors.grey.withOpacity(0.25),
                    borderRadius: BorderRadius.circular(10)
                ),
                child:
                dates[index]['status']?
                BuildWhiteText(txt: DateFormat('d MMM').format(dates[index]['date']), fontsize:
                MediaQuery.of(context).orientation == Orientation.portrait?
                height*0.022:height*0.03, weight: FontWeight.w400)
                    :
                BuildBlackText(txt: DateFormat('d MMM').format(dates[index]['date']), fontsize:     MediaQuery.of(context).orientation == Orientation.portrait?
                height*0.022:height*0.03, weight: FontWeight.w600)),
          );




            })

          ),

          SizedBox(height: height*0.025,),


          Container(
              height:
              MediaQuery.of(context).orientation == Orientation.portrait?
              height*0.35:height*0.55,
width: width*1,


              padding: EdgeInsets.only(left: width*0.05,top: height*0.02),
              child: ListView.builder(
                  itemCount: time.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context,index){
                    return InkWell(
                      onTap: (){
                        setState(() {
                          time[index]['status']=    ! time[index]['status'];
                        });
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: width*0.015),
                            child: Row(
                              children: [
                                BuildBlackText(txt: time[index]['time'], fontsize:
                                MediaQuery.of(context).orientation == Orientation.portrait?
                                height*0.025:height*0.03, weight: FontWeight.w500),
                                SizedBox(width: width*0.02,),
                                BuildGreyText(txt: "Cinetech + hall 1", fontsize:
                                MediaQuery.of(context).orientation == Orientation.portrait?
                                height*0.025:height*0.03, weight: FontWeight.w500),


                              ],
                            ),
                          ),
                          SizedBox(height: height*0.01,),
                          Container(
                            padding: const EdgeInsets.all(10),
                            margin: EdgeInsets.only(right: width*0.025),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: time[index]['status']?const Color(0xff61C3F2):
                                    const Color(0xff8F8F8F).withOpacity(0.5)
                              ),
                              borderRadius: BorderRadius.circular(20)
                            ),
                            child: Center(
                              child: Container(
                                height:
                                MediaQuery.of(context).orientation == Orientation.portrait?
                                height*0.2:height*0.35,
                                width:

                                width*0.65,

                                decoration: BoxDecoration(
                                  image:DecorationImage(
                                      fit: BoxFit.fill,
                                      image:  AssetImage(time[index]['url']))
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: height*0.01,),

                          Container(
                            margin: EdgeInsets.only(left: width*0.015),
                            child: Row(
                              children: [

                                BuildGreyText(txt: "From", fontsize: height*0.022, weight: FontWeight.w500),

                                SizedBox(width: width*0.02,),
                                BuildBlackText(txt: "50\$", fontsize: height*0.022, weight: FontWeight.w700),
                                SizedBox(width: width*0.02,),
                                BuildGreyText(txt: "or", fontsize: height*0.022, weight: FontWeight.w500),

                                SizedBox(width: width*0.02,),
                                BuildBlackText(txt: "2500 bonus", fontsize: height*0.022, weight: FontWeight.w700),

                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  })

          ),

          SizedBox(height: height*0.15,),

          InkWell(
            onTap: (){
             int timeIndex= time.indexWhere((element) => element['status']==true);
             int datesIndex= dates.indexWhere((element) => element['status']==true);
            //if time is selected
             if(timeIndex!=-1 && datesIndex!=-1){


               Navigator.of(context).push(
                 PageRouteBuilder(
                     pageBuilder: (_, __, ___) =>  SeatSelectionScreen(movie:  widget.movie,
                       time: time[timeIndex]['time'],
                       date: dates[datesIndex]['date'],),
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
             }
             else{

             }


            },
            child: Container(
              height:
              MediaQuery.of(context).orientation == Orientation.portrait?
              height*0.07:height*0.12,
              width: width*1,
              margin: EdgeInsets.only(left: width*0.05,
              right: width*0.05
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xff61C3F2)
              ),
              child: Center(child: BuildWhiteText(txt: "Select Seats", fontsize:
              MediaQuery.of(context).orientation == Orientation.portrait?
              height*0.025:height*0.04, weight: FontWeight.w500)),
            ),
          ),

          SizedBox(height:
          MediaQuery.of(context).orientation == Orientation.portrait?
          height*0.025:height*0.075,),



        ],
      ),
    );

  }

}

