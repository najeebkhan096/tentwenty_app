import 'package:flutter/material.dart';

class BuildGreyText extends StatelessWidget {

  final String ? txt;
  final double ? fontsize;
  final FontWeight ?  weight;

  const BuildGreyText({super.key, required this.txt,required this.fontsize,required this.weight});


  @override
  Widget build(BuildContext context) {

    return       Text(txt!,
      style: TextStyle(
        color: const Color(0xff8F8F8F),
        fontFamily: 'Poppins-Regular',
        fontSize: (fontsize!),
        fontWeight: weight

      ),
    );
  }
}



class BuildBlackText extends StatelessWidget {

  final String ? txt;
  final double ? fontsize;
  final FontWeight ?  weight;

  const BuildBlackText({super.key, required this.txt,required this.fontsize,required this.weight});


  @override
  Widget build(BuildContext context) {

    return       Text(txt!,
      style: TextStyle(
          color: const Color(0xff202C43),
          fontFamily: 'Poppins-Regular',
          fontSize: (fontsize!),
          fontWeight: weight

      ),
    );
  }
}
class BuildBlueText extends StatelessWidget {

  final String ? txt;
  final double ? fontsize;
  final FontWeight ?  weight;

  const BuildBlueText({super.key, required this.txt,required this.fontsize,required this.weight});


  @override
  Widget build(BuildContext context) {

    return       Text(txt!,
      style: TextStyle(
          color: const Color(0xff61C3F2),
          fontFamily: 'Poppins-Regular',
          fontSize: (fontsize!),
          fontWeight: weight

      ),
    );
  }
}


class BuildWhiteText extends StatelessWidget {

  final String ? txt;
  final double ? fontsize;
  final FontWeight ?  weight;

  const BuildWhiteText({super.key, required this.txt,required this.fontsize,required this.weight});


  @override
  Widget build(BuildContext context) {

    return       Text(txt!,
      style: TextStyle(
        color:  Colors.white,
        fontFamily: 'Poppins-Regular',
        fontSize: (fontsize!),
        fontWeight: weight

      ),
    );
  }
}
class BuildLightGrey extends StatelessWidget {

  final String ? txt;
  final double ? fontsize;
  final FontWeight ?  weight;

  const BuildLightGrey({super.key, required this.txt,required this.fontsize,required this.weight});


  @override
  Widget build(BuildContext context) {

    return       Text(txt!,
      style: TextStyle(
        color:  const Color(0xffDBDBDF),
        fontFamily: 'Poppins-Regular',
        fontSize: (fontsize!),
        fontWeight: weight

      ),
    );
  }
}

Color bgcolor=const Color(0xfff6f6fa);