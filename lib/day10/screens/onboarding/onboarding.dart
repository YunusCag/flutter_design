import 'package:flutter/material.dart';
import 'package:flutter_login_design/day10/provider/color_provider.dart';
import 'package:flutter_login_design/day10/screens/onboarding/data/onboard_page_data.dart';
import 'package:provider/provider.dart';
import 'components/onboarding_page.dart';
import 'components/page_view_indicator.dart';
class OnBoarding extends StatelessWidget {
  final PageController pageController=PageController();
  @override
  Widget build(BuildContext context) {
    ColorProvider colorProvider=Provider.of<ColorProvider>(context);
    return Stack(
      children: <Widget>[
        PageView.builder(
          controller: pageController,
          //physics: NeverScrollableScrollPhysics(),

          itemBuilder: (context,index){
          return OnBoardingPage(
            pageModel: onboardData[index],
            pageController: pageController,

          );
        },
          itemCount: onboardData.length,
        ),
        Container(
          width: double.infinity,
          height: (MediaQuery.of(context).size.height)*0.1,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 32),
                  child: Text(
                    "fun with",
                    style: Theme.of(context).textTheme.title.copyWith(
                      color: colorProvider.color
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 32),
                  child: Text(
                    "Skip",
                    style: TextStyle(
                      color: colorProvider.color
                    ),
                  ),
                )

              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20,left: 30),
            child: PageViewIndicator(
              controller:pageController,
              itemCount:onboardData.length,
              color:colorProvider.color
            ),
          ),
        )
      ],
    );
  }
}
