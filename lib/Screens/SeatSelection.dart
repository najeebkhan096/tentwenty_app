import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import 'package:tentwenty/modal/movie.dart';


import 'package:tentwenty/style/text.dart';
import 'package:tentwenty/widgets/appbar.dart';

class SeatSelectionScreen extends StatefulWidget {

  const SeatSelectionScreen ({Key? key,required this.movie,required this.time,required this.date}) : super(key: key);
  final Movie? movie;
  final String ? time;
 final  DateTime ? date;

  @override
  State<SeatSelectionScreen> createState() => _SeatSelectionScreenState();
}

class _SeatSelectionScreenState extends State<SeatSelectionScreen> {
  DateTime todaydate=DateTime.now();

  List<Map> data=[
    {
      'url':'images/seats.png',
      'status':false,

    },
    {
      'url':'images/seats.png',
      'status':false,

    },
    {
      'url':'images/seats.png',
      'status':false,

    },
    {
      'url':'images/seats.png',
      'status':false,

    },
    {
      'url':'images/seats.png',
      'status':false,

    },
    {
      'url':'images/seats.png',
      'status':false,

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
      appBar: BuildMovieDateAppbar(height: height*0.11,movie: widget.movie,
      subtitle: '${DateFormat('d MMM').format(widget.date!)} ${widget.date!.year} , ${widget.time} Hall 1',
      ),
      body: ListView(

        children: [


          SizedBox(height: height*0.05,),


          Container(
            height:
            MediaQuery.of(context).orientation == Orientation.portrait?
            height*0.25:height*0.45,
            width: width*1,
margin: EdgeInsets.only(left: width*0.05,right: width*0.05),
            decoration: const BoxDecoration(
                image:DecorationImage(
                    fit: BoxFit.fill,
                    image:  AssetImage("images/seats2.png"))
            ),
          ),


          SizedBox(height: height*0.11,),



Container(
  margin: EdgeInsets.only(right: width*0.05,bottom: height*0.025),
  alignment: Alignment.centerRight,
  child: Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      const CircleAvatar(
        backgroundColor: Colors.white,
        child: Icon(Icons.add,color: Color(0xff202C43),),
      ),
      SizedBox(width: width*0.025,),
      const CircleAvatar(
        backgroundColor: Colors.white,
        child: Icon(Icons.remove,color: Color(0xff202C43),),
      )
    ],
  ),
),
//divider
Container(
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(10),
color: const Color(0xffA6A6A6)
  ),
  height: height*0.006,
  width: width*1,
margin: EdgeInsets.only(left: width*0.05,
right: width*0.05
),
),


          SizedBox(height:
          MediaQuery.of(context).orientation == Orientation.portrait?
          height*0.025:height*0.075,),

        Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height*0.025,),
              Container(
                margin: EdgeInsets.only(left: width*0.15,right: width*0.15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset("images/box.png",height:


                        MediaQuery.of(context).orientation == Orientation.portrait?
                        height*0.035:height*0.045,width: width*0.035,),
                        SizedBox(width: width*0.025,),
                        BuildGreyText(txt: "Selected", fontsize: MediaQuery.of(context).orientation == Orientation.portrait?height*0.02:height*0.035, weight: FontWeight.w500)

                      ],
                    ),
                    Row(
                      children: [
                        Image.asset("images/box.png",height: MediaQuery.of(context).orientation == Orientation.portrait?
                        height*0.035:height*0.045,width: width*0.035,color: const Color(0xffA6A6A6),),
                        SizedBox(width: width*0.025,),
                        BuildGreyText(txt: "Not available", fontsize: MediaQuery.of(context).orientation == Orientation.portrait?height*0.02:height*0.035, weight: FontWeight.w500)

                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height:

              MediaQuery.of(context).orientation == Orientation.portrait?
              height*0.0025:height*0.025,),
              Container(
                margin: EdgeInsets.only(left: width*0.15,right: width*0.15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset("images/box.png",height: MediaQuery.of(context).orientation == Orientation.portrait?
                        height*0.035:height*0.045,width: width*0.035,
                        color: const Color(0xff564CA3),
                        ),
                        SizedBox(width: width*0.025,),
                        BuildGreyText(txt: "VIP (\$150)", fontsize: MediaQuery.of(context).orientation == Orientation.portrait?height*0.02:height*0.035, weight: FontWeight.w500,

                        )

                      ],
                    ),
                    Row(
                      children: [
                        Image.asset("images/box.png",height: MediaQuery.of(context).orientation == Orientation.portrait?
                        height*0.035:height*0.045,width: width*0.035,
                        color: const Color(0xff61C3F2),
                        ),
                        SizedBox(width: width*0.025,),
                        BuildGreyText(txt: "Regular (\$50)", fontsize: MediaQuery.of(context).orientation == Orientation.portrait?height*0.02:height*0.035, weight: FontWeight.w500,
                        )

                      ],
                    ),

                  ],
                ),
              ),
              SizedBox(height: height*0.02,),
              Container(
                width:
                MediaQuery.of(context).orientation == Orientation.portrait?
                width*0.26:width*0.2,
                margin: EdgeInsets.only(left: width*0.05),
                padding:const  EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xffA6A6A6).withOpacity(0.10),
                  borderRadius: BorderRadius.circular(12)
                ),
                child: Row(
                  children: [
                    BuildBlackText(txt: "4/", fontsize:

                    MediaQuery.of(context).orientation == Orientation.portrait?
                    height*0.018:height*0.035, weight: FontWeight.w700),
                    BuildBlackText(txt: "3 row  ", fontsize:  MediaQuery.of(context).orientation == Orientation.portrait?
                    height*0.018:height*0.035, weight: FontWeight.w400),
               Icon(Icons.close,color: const Color(0xff202C43),size: width*0.05,)
                  ],
                ),
              ),
              SizedBox(height: height*0.02,),
              Row(
                children: [
                  Container(
                    width:
                    MediaQuery.of(context).orientation == Orientation.portrait?
                    width*0.26:width*0.2,
                    margin: EdgeInsets.only(left: width*0.05),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        color: const Color(0xffA6A6A6).withOpacity(0.10),
                        borderRadius: BorderRadius.circular(12)
                    ),
                    child: Column(
                      children: [
                        BuildBlackText(txt: "Total price ", fontsize: MediaQuery.of(context).orientation == Orientation.portrait?
                        height*0.018:height*0.035, weight: FontWeight.w400),

                        BuildBlackText(txt: "\$50", fontsize:MediaQuery.of(context).orientation == Orientation.portrait?
                        height*0.018:height*0.035, weight: FontWeight.w700),

                      ],
                    ),
                  ),

                  Container(
                    height:
                    MediaQuery.of(context).orientation == Orientation.portrait?
                    height*0.07:height*0.12,
                    width: width*0.55,
                    margin: EdgeInsets.only(left: width*0.05,
                        right: width*0.05
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xff61C3F2)
                    ),
                    child: Center(child: BuildWhiteText(txt: "Proceed to pay", fontsize:
                    MediaQuery.of(context).orientation == Orientation.portrait?
                    height*0.025:height*0.032, weight: FontWeight.w500)),
                  ),
                ],
              ),
              SizedBox(height: height*0.02,),
            ],
          ),
        )





        ],
      ),
    );

  }


}

