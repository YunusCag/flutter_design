import 'package:flutter/material.dart';
import 'package:flutter_login_design/day28/screen/uevento_home_screen.dart';
class UEvenToSplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width=MediaQuery.of(context).size.width;
    final height=MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: height,
            width: width,
            child: Image.asset("assets/event/background.png",fit: BoxFit.fitWidth,),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset("assets/event/logo.png",height: 50,),
                SizedBox(
                  height: 18,
                ),
                Row(
                  children: <Widget>[
                    Text(
                      "UVE",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "NTO",
                      style: TextStyle(
                        color: Color(0xFFFFA700),
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                  ],
                ),
                SizedBox(
                  height: 14,
                ),
                Text(
                  "There’s a lot happening around you! Our mission is to provide what’s happening near you!",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 14,
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder:(context)=>UEventToHomeScreen()
                      ),
                    );
                  },
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Get Started",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w400
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.arrow_forward,
                          size: 24,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
