import 'package:flutter/material.dart';
import 'package:flutter_login_design/day26/clock/clock.dart';
import 'package:flutter_login_design/day26/clock/clock_text.dart';

import 'screen/first_screen.dart';
import 'screen/second_screen.dart';
class AlarmAppPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.of(context).size.height;
    final width=MediaQuery.of(context).size.width;
    return Container(
      height: height,
      width: width,
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          bottomNavigationBar: BottomBar(),
          appBar: AppBar(

            elevation: 0,
            backgroundColor: Colors.transparent,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(55),
              child: Container(
                color: Colors.transparent,
                child: SafeArea(
                  child: Column(
                    children: <Widget>[
                      TabBar(
                        indicatorWeight: 15,
                        labelColor: Color(0xFF2D386B),
                        indicator: UnderlineTabIndicator(
                          borderSide: BorderSide(
                            color: Color(0xFFFF0863),
                            width: 4.0,
                          ),
                          insets: EdgeInsets.fromLTRB(40,20,40,0)
                        ),
                        indicatorSize: TabBarIndicatorSize.label,
                        unselectedLabelColor: Colors.black26,
                        labelStyle: TextStyle(
                          fontSize: 12,
                          letterSpacing: 1.3,
                          fontWeight: FontWeight.w500
                        ),
                        tabs: <Widget>[
                          Tab(
                            text: "ALARMS",
                            icon: Icon(
                              Icons.watch_later,
                              size: 40,
                            ),
                          ),
                          Tab(
                            text: "RECORDS",
                            icon: Icon(
                              Icons.menu,
                              size: 40,
                            ),
                          ),
                          Tab(
                            text: "PROFILE",
                            icon: Icon(
                              Icons.supervised_user_circle,
                              size: 40,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              Center(
                child: FirstScreen(),
              ),
              Center(
                child: SecondScreen(),
              ),
              Text(
                "Third Screen"
              )
            ],
          ),
        ),

      ),
    );
  }
}
class BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(50,50,50,50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          FlatButton(
            child: Text(
              "EDIT ALARMS",
              style: TextStyle(
                letterSpacing: 1.5
              ),
            ),
            color: Color(0xFFFF5E92),
            textColor: Colors.white,
            padding: EdgeInsets.symmetric(vertical: 20,horizontal: 25),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40)
            ),
            onPressed: (){},
          ),
          FloatingActionButton(
            child: Text(
              "+",
              style: TextStyle(
                color: Color(0xFF253165),
                fontWeight: FontWeight.w700,
                fontSize: 25
              ),
            ),
            onPressed: (){},
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            highlightElevation: 3,
            elevation: 5,
          )

        ],
      ),
    );
  }
}

