import 'package:flutter/material.dart';
import 'package:flutter_login_design/day10/provider/color_provider.dart';
import 'package:flutter_login_design/day10/screens/onboarding/models/onboard_page_model.dart';
import 'package:provider/provider.dart';

import 'drawer_paint.dart';
class OnBoardingPage extends StatefulWidget {
  final PageController pageController;
  final OnboardPageModel pageModel;
  OnBoardingPage({Key key,
    @required this.pageModel,
    @required this.pageController});

  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> with SingleTickerProviderStateMixin {

  AnimationController animationController;
  Animation<double> heroAnimation;
  Animation<double> borderAnimation;

  @override
  void initState() {
    // TODO: implement initState
    animationController=AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 750)
    );
    heroAnimation=Tween<double>(begin: -40,end: 0).animate(
      CurvedAnimation(parent: animationController,curve: Curves.bounceOut)
    );
    borderAnimation=Tween<double>(begin: 75,end: 50).animate(
        CurvedAnimation(parent: animationController,curve: Curves.bounceOut)
    );
    animationController.forward(from: 0);
    super.initState();

  }
  @override
  void dispose() {
    // TODO: implement dispose
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          color:widget.pageModel.primeColor ,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              AnimatedBuilder(
                animation: heroAnimation,
                builder: (context,child){
                  return Transform.translate(
                      offset: Offset(heroAnimation.value,0),
                      child: Padding(
                           padding: const EdgeInsets.all(32.0),
                           child: Image.asset(widget.pageModel.imagePath),
                  ),
                  );
                },

              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Container(
                  height: 250,
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 8.0),
                        child: Text(
                          widget.pageModel.caption,
                          style: TextStyle(
                            fontSize: 24,
                            color: widget.pageModel.accentColor.withOpacity(0.8),
                            letterSpacing: 1,
                            fontStyle: FontStyle.normal
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 8.0),
                        child: Text(
                          widget.pageModel.subhead,
                          style: TextStyle(
                              fontSize: 34,
                              color: widget.pageModel.accentColor.withOpacity(0.8),
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1,
                              fontStyle: FontStyle.normal
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 8.0),
                          child: Text(
                            widget.pageModel.description,
                            style: TextStyle(
                                fontSize: 20,
                                color: widget.pageModel.accentColor.withOpacity(0.8),
                                letterSpacing: 1,
                                fontStyle: FontStyle.normal
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: AnimatedBuilder(
            animation: borderAnimation,
            builder: (context,child){
              return CustomPaint(
                painter: DrawerPaint(
                    curveColor:widget.pageModel.accentColor
                ),
                child: Container(
                  width: borderAnimation.value,
                  height: double.infinity,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 24.0),
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          color: widget.pageModel.primeColor,
                          size: 32,
                        ),
                        onPressed: _nextButtonPage,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }

  void _nextButtonPage() {
    Provider.of<ColorProvider>(context,listen: false).color=
        widget.pageModel.nextAccentColor;

    widget.pageController.nextPage(
        duration:Duration(milliseconds: 100),
        curve: Curves.fastLinearToSlowEaseIn
    );
  }
}
