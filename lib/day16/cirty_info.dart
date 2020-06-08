import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_login_design/animation/fade_animation.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:math';
class CityInfo extends StatefulWidget {
  @override
  _CityInfoState createState() => _CityInfoState();
}

class _CityInfoState extends State<CityInfo> {


  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration:BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/emperor.jpg"),
                  fit: BoxFit.cover
              ),
            ),
            child: ClipPath(
              clipper: CircleClipper(context),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5,sigmaY: 5),
                child: Container(
                  color: Colors.black38,
                ),
              ),
            ),
          ),
          Container(
            color: Colors.black26,
          ),
          Container(
            child: CustomPaint(
              painter: CirclePainter(context),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height/2-200,
            child: Container(
              padding: EdgeInsets.only(left: 10),
              height: 400,
              width: 200+10.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "CITY OF",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                        color: Colors.white
                    ),
                  ),
                  Text(
                    "Adana",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        color: Colors.white
                    ),
                  ),
                  Divider(color: Colors.white,endIndent: 80,),
                  Text(
                    "Wednesday",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                        color: Colors.white.withOpacity(.9)
                    ),
                  ),
                  Text(
                    "January 2013",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                        color: Colors.white.withOpacity(.9)
                    ),
                  ),
                  Divider(color: Colors.white,endIndent: 85,),

                  Row(
                    children: <Widget>[
                      Text(
                        "23 °C",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w300,
                            color: Colors.white.withOpacity(.9)
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(FontAwesomeIcons.cloudSunRain,size: 30,color: Colors.white,)
                    ],
                  )
                ],
              ),
            ),
          ),
          //Top navigation Bar
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: <Widget>[
                  IconButton(
                    onPressed: (){},
                    icon:Icon(
                      FontAwesomeIcons.bars,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: (){},
                    icon:Icon(
                      FontAwesomeIcons.calendarAlt,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Btn(
            duration: 0.3,
            title: "HAPPY",
            degree: -17.6*2.52,
              icon:FontAwesomeIcons.square,
          ),
          Btn(
            duration: 0.6,
            title: "SAD",
            degree: -17.6*1.3,
            icon:FontAwesomeIcons.sadTear,
          ),
          Btn(
            duration: 1.5,
            title: "CAR",
            degree: 11.6*3.8,
            icon:FontAwesomeIcons.carAlt,
          ),
          Btn(
            duration: 1.2,
            title: "NAV",
            degree: 10.6*2.1,
            icon:FontAwesomeIcons.mapMarkedAlt,
          ),
          Btn(
            duration: 0.9,
            title: "FOOD",
            degree: -0.95,
            icon:FontAwesomeIcons.cookie,
          ),
        ],
      )
    );
  }
}
class CirclePainter extends CustomPainter{

  BuildContext context;
  CirclePainter(this.context);
  @override
  void paint(Canvas canvas, Size size) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    Paint paint=Paint()
    ..color=Colors.white.withOpacity(0.4)
    ..strokeWidth=1
    ..style=PaintingStyle.stroke;

    canvas.drawCircle(Offset(0.0,height/2), (width/2-30)+10.0, paint);
    canvas.drawCircle(Offset(0.0,height/2), (width/2-40)+90.0, paint);

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }

}
class CircleClipper extends CustomClipper<Path>{
  BuildContext context;
  CircleClipper(this.context);
  @override
  Path getClip(Size size) {
    Path path1=Path()
    ..moveTo(0,0)
    ..lineTo(0,size.height)
    ..lineTo(size.width,size.height)
    ..lineTo(size.width,0)
    ..close();

    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    //Rect rect=Rect.fromCircle(center: Offset(0.0,height/3),radius: width/3);
    Path path2=Path()
    ..addRRect(RRect.fromRectAndRadius(Rect.fromCenter(center: Offset(0.0,height/2),width: width-90,height:width-90),Radius.circular(width/2)));
    //..close();

    Path path3=Path.combine(PathOperation.difference, path1, path2);

    return path3;

  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
class Btn extends StatelessWidget {


  final double degree;
  final IconData icon;
  final String title;
  final double duration;

  Btn({Key key,this.degree, this.icon,this.title,this.duration}):super(key:key);

  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;

    return Positioned(
      top: width-width/5.9+sin(pi/180*degree)*width/2,
      left:-width/100+30+cos(pi/180*degree)*width/2,
      child: FadeAnimation(duration
        ,Container(
          width: width/6,
          height: width/6,
          decoration: BoxDecoration(
              color: Color.fromARGB(255,49,57, 75),
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white.withOpacity(0.6),
                width: 1
              )
          ),
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Icon(
                icon,
                size: 35,
                color: Colors.white,
              ),
              Transform.translate(
                offset: Offset(width/4-5,0),
                child: Text(
                  "$title",
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.white
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
