import 'package:flutter/material.dart';
class Custom_Nav_Bar extends StatefulWidget {
  const Custom_Nav_Bar({super.key});


  @override
  State<Custom_Nav_Bar> createState() => _Custom_Nav_BarState();
}

class _Custom_Nav_BarState extends State<Custom_Nav_Bar> {
  int _currentIndex=1;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery
        .of(context)
        .size
        .height;

    return

      OrientationBuilder(
        builder: (context, orientation) {
      return orientation == Orientation.portrait?

      Theme(
        data: Theme.of(context).copyWith(
          // sets the background color of the `BottomNavigationBar`
            canvasColor: const Color(0xff2E2739),
            // sets the active color of the `BottomNavigationBar` if `Brightness` is light
            textTheme: Theme
                .of(context)
                .textTheme
                .copyWith(bodySmall: const TextStyle(color: Color(0xff827D88)))), // sets the inactive color of the `BottomNavigationBar`

        child: SizedBox(
          height: height*0.1,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: BottomNavigationBar(
              currentIndex: _currentIndex,

              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              items: [
                BottomNavigationBarItem(
                  icon: Container(
                      margin: EdgeInsets.only(bottom: height*0.01),
                      child: Image.asset("images/dashboard.png",height: height*0.025,
                        color: _currentIndex==0?
                        Colors.white
                            :const Color(0XFF827D88),
                      )),
                  label: 'Dashboard',
                ),
                BottomNavigationBarItem(
                  icon: Container(
                      margin: EdgeInsets.only(bottom: height*0.01),
                      child: Image.asset("images/Vector.png",height: height*0.025,
                        color: _currentIndex==1?
                        Colors.white
                            :const Color(0XFF827D88),)),
                  label: 'Watch',
                ),
                BottomNavigationBarItem(
                  icon: Container(
                      margin: EdgeInsets.only(bottom: height*0.01),
                      child: Image.asset("images/library.png",height: height*0.025,
                        color: _currentIndex==2?
                        Colors.white
                            :const Color(0XFF827D88),
                      )),
                  label: 'Media Library',
                ),
                BottomNavigationBarItem(
                  icon: Container(
                      margin: EdgeInsets.only(bottom: height*0.01),
                      child: Image.asset("images/more.png",height: height*0.025,
                        color: _currentIndex==3?
                        Colors.white
                            :const Color(0XFF827D88),
                      )),
                  label: 'More',
                ),

              ],
              selectedItemColor: Colors.white,
              unselectedItemColor:const Color(0XFF827D88),
              showSelectedLabels: true,
              showUnselectedLabels: true,
            ),
          ),
        ),
      )
          :
          Theme(
          data: Theme.of(context).copyWith(
          // sets the background color of the `BottomNavigationBar`
          canvasColor: const Color(0xff2E2739),
          // sets the active color of the `BottomNavigationBar` if `Brightness` is light
          textTheme: Theme
              .of(context)
              .textTheme
              .copyWith(bodySmall: const TextStyle(color:
          Color(0xff827D88)))), // sets the inactive color of the `BottomNavigationBar`

          child: SizedBox(
          height: height*0.2,
          child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: BottomNavigationBar(
          currentIndex: _currentIndex,

          onTap: (index) {
          setState(() {
          _currentIndex = index;
          });
          },
          items: [
          BottomNavigationBarItem(
          icon: Container(
          margin: EdgeInsets.only(bottom: height*0.01),
          child: Image.asset("images/dashboard.png",height: height*0.025,
          color: _currentIndex==0?
          Colors.white
              :const Color(0XFF827D88),
          )),
          label: 'Dashboard',
          ),
          BottomNavigationBarItem(
          icon: Container(
          margin: EdgeInsets.only(bottom: height*0.01),
          child: Image.asset("images/Vector.png",height: height*0.025,
          color: _currentIndex==1?
          Colors.white
              :const Color(0XFF827D88),)),
          label: 'Watch',
          ),
          BottomNavigationBarItem(
          icon: Container(
          margin: EdgeInsets.only(bottom: height*0.01),
          child: Image.asset("images/library.png",height: height*0.025,
          color: _currentIndex==2?
          Colors.white
              :const Color(0XFF827D88),
          )),
          label: 'Media Library',
          ),
          BottomNavigationBarItem(
          icon: Container(
          margin: EdgeInsets.only(bottom: height*0.01),
          child: Image.asset("images/more.png",height: height*0.025,
          color: _currentIndex==3?
          Colors.white
              :const Color(0XFF827D88),
          )),
          label: 'More',
          ),

          ],
          selectedItemColor: Colors.white,
          unselectedItemColor:const Color(0XFF827D88),
          showSelectedLabels: true,
          showUnselectedLabels: true,
          ),
          ),
          ),
          );

        });


  }
}
