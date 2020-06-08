import 'package:flutter/material.dart';
import 'package:flutter_login_design/day10/provider/color_provider.dart';
import 'package:flutter_login_design/day10/screens/onboarding/onboarding.dart';
import 'package:provider/provider.dart';
class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ColorProvider>(
      create: (context)=>ColorProvider(),
      child: Scaffold(
        body: OnBoarding(),
      ),
    );
  }
}
