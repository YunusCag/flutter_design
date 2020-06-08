import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class ParallaxPageView extends StatefulWidget {

  @override
  _ParallaxPageViewState createState() => _ParallaxPageViewState();
}

class _ParallaxPageViewState extends State<ParallaxPageView> {
  double topOne=0;
  double topTwo=100;
  double rateZero=0;
  double rateOne=0;
  double rateTwo=0;
  double rateThree=0;
  double rateFour=0;
  double rateFive=0;
  double rateSix=0;
  double rateSeven=0;
  double rateEight=90;

  String assets;
  double top;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    return Scaffold(
      body: NotificationListener(
        onNotification: (v){
          if(v is ScrollUpdateNotification){
            //only if scroll update notification is triggered
            setState(() {
              rateEight-=v.scrollDelta/1;
              rateSeven-=v.scrollDelta/1.5;
              rateSix-=v.scrollDelta/2;
              rateFive-=v.scrollDelta/2.5;
              rateFour-=v.scrollDelta/3;
              rateThree-=v.scrollDelta/3.5;
              rateTwo-=v.scrollDelta/4;
              rateOne-=v.scrollDelta/4.5;
              rateZero-=v.scrollDelta/5;
            });

          }
          return true;
        },
        child: Stack(
          children: <Widget>[
            ParallaxWidget(
              top:rateZero,
              assets:"parallax0"
            ),
            ParallaxWidget(
                top:rateOne,
                assets:"parallax1"
            ),
            ParallaxWidget(
                top:rateTwo,
                assets:"parallax2"
            ),
            ParallaxWidget(
                top:rateThree,
                assets:"parallax3"
            ),
            ParallaxWidget(
                top:rateFour,
                assets:"parallax4"
            ),
            ParallaxWidget(
                top:rateFive,
                assets:"parallax5"
            ),
            ParallaxWidget(
                top:rateSix,
                assets:"parallax6"
            ),
            ParallaxWidget(
                top:rateSeven,
                assets:"parallax7"
            ),
            ParallaxWidget(
                top:rateEight,
                assets:"parallax8"
            ),
            ListView(
              children: <Widget>[
                Container(
                  height: 800,
                  color: Colors.transparent,
                ),
                Container(
                  color: Color(0xFF21002),
                  width: double.infinity,
                  padding: EdgeInsets.only(top: 70),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Parallax In",
                        style: TextStyle(
                          fontSize: 30,
                          fontFamily: "Montserrat",
                          letterSpacing: 1.8,
                          color: Color(0xFFFFAF00)
                        ),
                      ),
                      Text(
                        "Flutter",
                        style: TextStyle(
                            fontSize: 51,
                            fontFamily: "Montserrat",
                            letterSpacing: 1.8,
                            color: Color(0xFFFFAF00)
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: 190,
                        child: Divider(
                          height: 1,
                          color: Color(0xFFFFAF00),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Made By",
                        style: TextStyle(
                          fontFamily:"Montserrat",
                          letterSpacing: 1.3,
                          color: Color(0xFFFFAF00)
                        ),
                      ),
                      Text(
                        "Yunus C.",
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: "Montserrat",
                          letterSpacing: 1.8,
                          color: Color(0xFFFFAF00)
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
class ParallaxWidget extends StatelessWidget {
  final double top;
  final String assets;

  ParallaxWidget({Key key,this.top, this.assets}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: -45,
      child: Container(
        height: 550,
        width: 900,
        child: Image.asset(
          "assets/images/$assets.png",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
