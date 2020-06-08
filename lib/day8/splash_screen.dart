
import 'package:flutter/material.dart';
import 'package:flutter_login_design/animation/fade_animation.dart';
import 'package:flutter_login_design/day7/day7_login_page.dart';
import 'package:flutter_login_design/day8/day8_login_page.dart';
import 'package:page_transition/page_transition.dart';
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  AnimationController _scaleController;
  AnimationController _scale2Controller;
  AnimationController _widthController;
  AnimationController _positionController;

  Animation<double> _scaleAnimation;
  Animation<double> _scale2Animation;
  Animation<double> _widthAnimation;
  Animation<double> _positionAnimation;
  AnimationController _positonController;

  bool hideIcon=false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _widthController=AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 600)
    )..addStatusListener((status){
      if(status==AnimationStatus.completed){
        _positionController.forward();
      }
    });
    _widthAnimation=Tween<double>(
        begin: 80,
        end: 300
    ).animate(_widthController);


    _scaleController=AnimationController(
        vsync: this,
      duration: Duration(milliseconds: 300)
    );

    _scaleAnimation=Tween<double>(begin:1.0 ,end: 0.8)
        .animate(_scaleController)
    ..addStatusListener((status){
      if(status==AnimationStatus.completed){
        _widthController.forward();

      }
    });
    _positionController=AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000)
    );
    _positionAnimation=Tween<double>(
      begin: 0,
      end: 215
    ).animate(_positionController)..addStatusListener((status){
      if(status==AnimationStatus.completed){
        _scale2Controller.forward();
        setState(() {
          hideIcon=true;
        });

      }
    });

    _scale2Controller=AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000)
    );
    _scale2Animation=Tween<double>(
        begin: 1.0,
        end: 32.0
    ).animate(_scale2Controller)..addStatusListener((status){
      if(status==AnimationStatus.completed){
        Navigator.of(context)
            .push(PageTransition(
          child: Day8LoginPage(),
          type: PageTransitionType.fade
        ));


      }
    });



  }

  @override
  Widget build(BuildContext context) {
    final double width=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color.fromRGBO(3, 9, 23,1),
      body: Container(
        width: double.infinity,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: -50,
              left: 0,
              child: FadeAnimation(1,Container(
                width: width,
                height: 400,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/one.png"),
                    fit:BoxFit.cover
                  ),
                ),
              )
              ),
            ),
            Positioned(
              top: -100,
              left: 0,
              child: FadeAnimation(1.3,Container(
                width: width,
                height: 400,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/one.png"),
                      fit:BoxFit.cover
                  ),
                ),
              )
              ),
            ),
            Positioned(
              top: -150,
              left: 0,
              child: FadeAnimation(1.6,Container(
                width: width,
                height: 400,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/one.png"),
                      fit:BoxFit.cover
                  ),
                ),
              )
              ),
            ),
            Container(
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FadeAnimation(1,Text(
                   "Welcome",
                   style: TextStyle(
                     color: Colors.white,
                     fontSize: 40
                   ),
                  )
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  FadeAnimation(1.3,Text(
                    "We promis that you'll have the most \nfuss-free time with us ever.",
                    style: TextStyle(
                      color: Colors.white.withOpacity(.7),
                      height: 1.4

                    ),
                  )
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  FadeAnimation(1.6,
                      AnimatedBuilder(
                        animation: _scaleController,
                    builder:(context,child)=>Transform.scale(
                        scale: _scaleAnimation.value,
                    child: Center(
                      child:AnimatedBuilder(
                        animation: _widthController,
                        builder: (context,child)=>Container(
                          width: _widthAnimation.value,
                          height: 80,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.blue.withOpacity(.4)
                          ),
                          child: InkWell(
                            onTap: (){
                              _scaleController.forward();
                            },
                            child: Stack(
                              children: <Widget>[
                                AnimatedBuilder(
                                  animation: _positionController,
                                  builder: (context,child)=> Positioned(
                                    left: _positionAnimation.value,
                                    child: AnimatedBuilder(
                                      animation: _scale2Controller,
                                      builder:(context,child)=>Transform.scale(
                                        scale: _scale2Animation.value,
                                      child: Container(
                                        width: 60,
                                        height: 60,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.blue,
                                        ),
                                        child: !hideIcon?Icon(
                                          Icons.arrow_forward,
                                          size: 32,
                                          color: Colors.white,
                                        ):Container(),
                                      ),
                                    )
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ) ,

                    ),
                  )
                      )
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
