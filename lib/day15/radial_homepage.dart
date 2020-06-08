import 'package:flutter/material.dart';
import 'package:flutter_login_design/day15/blocs/bloc.dart';
import 'package:flutter_login_design/day15/colors.dart';
import 'package:flutter_login_design/day15/date_utils.dart';
import 'package:flutter_login_design/day15/radial_progress.dart';

import 'top_bar.dart';

class RadialHomePage extends StatefulWidget {
  @override
  _RadialHomePageState createState() => _RadialHomePageState();
}

class _RadialHomePageState extends State<RadialHomePage> with SingleTickerProviderStateMixin {
  HomePageBloc homePageBloc;
  AnimationController _iconAnimationController;
  @override
  void initState() {
    // TODO: implement initState
    homePageBloc=HomePageBloc();
    _iconAnimationController=AnimationController(
        vsync: this,
      duration: Duration(milliseconds: 200)
    );
    super.initState();

  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    homePageBloc.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  TopBar(),
                  Positioned(
                    top: 30.0,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                            size: 26,
                          ),
                          onPressed: () {
                            homePageBloc.subtractDate();
                          },
                        ),
                        StreamBuilder(
                          stream: homePageBloc.dateStream,
                          initialData: homePageBloc.selectedDate,
                          builder: (context,snapshot){
                            return Expanded(
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    formatterDayOfWeek.format(snapshot.data),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24,
                                        letterSpacing: 1.2,
                                        color: Colors.white
                                    ),
                                  ),
                                  Text(
                                    formatterDate.format(snapshot.data),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22,
                                        letterSpacing: 1.3,
                                        wordSpacing: 1,
                                        color: Colors.white
                                    ),
                                  )
                                ],
                              ),
                            );

                          },
                        ),
                        Transform.rotate(
                          angle: 135,
                          child: IconButton(
                            icon: Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                              size: 26,
                            ),
                            onPressed: () {
                              homePageBloc.addDate();
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              RadialProgress(),
              MonthlyStatusListing()
            ],
          ),
          Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.red,
                  width: 3
                )
              ),
              child: IconButton(
                icon: AnimatedIcon(
                  icon: AnimatedIcons.menu_close,
                  progress: _iconAnimationController.view,
                ),
                onPressed: (){
                  setState(() {
                    onIconPressed();
                  });

                },
              ),
            ),
          )
        ],
      ),
    );
  }

  void onIconPressed() {
    animationStatus ?_iconAnimationController.reverse():_iconAnimationController.forward();

  }
  bool get animationStatus{
    final AnimationStatus status=_iconAnimationController.status;
    return status==AnimationStatus.completed;
  }

}
class MonthlyStatusListing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.only(left:8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                MonthlyStatusRow('February 2017', 'On going'),
                MonthlyStatusRow('January 2017', 'Failed'),
                MonthlyStatusRow('December 2016', 'Completed'),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                MonthlyTargetRow('Lose weight', '3.8 ktgt/7 kg'),
                MonthlyTargetRow('Running per month', '15.3 km/20 km'),
                MonthlyTargetRow('Avg steps Per day', '10000/10000'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MonthlyStatusRow extends StatelessWidget {
  final String monthYear, status;

  MonthlyStatusRow(this.monthYear, this.status);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            monthYear,
            style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                fontSize: 20.0),
          ),
          Text(
            status,
            style: TextStyle(
                color: Colors.grey,
                fontStyle: FontStyle.italic,
                fontSize: 16.0),
          ),
        ],
      ),
    );
  }
}

class MonthlyTargetRow extends StatelessWidget {
  final String target, targetAchieved;

  MonthlyTargetRow(this.target, this.targetAchieved);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            target,
            style: TextStyle(color: Colors.black, fontSize: 18.0),
          ),
          Text(
            targetAchieved,
            style: TextStyle(color: Colors.grey, fontSize: 16.0),
          ),
        ],
      ),
    );
  }
}
