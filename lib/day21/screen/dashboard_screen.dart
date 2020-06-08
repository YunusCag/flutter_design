import 'package:flutter/material.dart';
import 'package:flutter_login_design/day21/common/custom_app_bar.dart';
import 'package:flutter_login_design/day21/utils/strings.dart';
import 'package:flutter_login_design/day21/utils/text_styles.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xFFB98959),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          FractionallySizedBox(
            alignment: Alignment.topCenter,
            heightFactor: 0.4,
            child: Container(
              child: Stack(
                children: <Widget>[
                  Image.asset(
                    "assets/images/elephant.jpg",
                    fit: BoxFit.cover,
                    width: width,
                  ),
                  Column(
                    children: <Widget>[
                      CustomAppBar(
                        opacity: 1,
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment(0, -0.6),
                          child: Text(
                            Strings.welcomeToAPlanet,
                            textAlign: TextAlign.center,
                            style: TextStyles.bigHeadingTextStyle,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          FractionallySizedBox(
            alignment: Alignment.bottomCenter,
            heightFactor: 0.65,
            child: Container(
              decoration: BoxDecoration(
                  color: Color(0xFFB98959),
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(20))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Text(
                      Strings.relatedToYou,
                      style: TextStyles.buttonTextStyle,
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: <Widget>[
                        LayoutBuilder(
                          builder: (BuildContext context,
                                  BoxConstraints viewportConstraints) =>
                              SingleChildScrollView(
                            child: ConstrainedBox(
                              constraints: BoxConstraints(
                                  minHeight: viewportConstraints.maxHeight),
                              child: Container(
                                width: width,
                                height: height*0.5,
                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: <Widget>[
                                    Container(
                                      width: width * 0.5,
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      child: Column(
                                        children: <Widget>[
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Image.asset(
                                              "assets/images/tiger.jpg",
                                              width: width * 0.5,
                                              height: height * 0.25,
                                              fit: BoxFit.fitWidth,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 6,
                                          ),
                                          Text(
                                            Strings.lifeWithATiger,
                                            style: TextStyles.titleTextStyle,
                                          ),
                                          SizedBox(
                                            height: 6,
                                          ),
                                          Text(
                                            Strings.loremIpsum,
                                            overflow: TextOverflow.clip,
                                            style: TextStyles.body3TextStyle,
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: width * 0.5,
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      child: Column(
                                        children: <Widget>[
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Image.asset(
                                              "assets/images/wild_animals.jpeg",
                                              width: width * 0.5,
                                              height: height * 0.25,
                                              fit: BoxFit.fitWidth,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 6,
                                          ),
                                          Text(
                                            Strings.wildAnimals,
                                            style: TextStyles.titleTextStyle,
                                          ),
                                          SizedBox(
                                            height: 6,
                                          ),
                                          Text(
                                            Strings.loremIpsum,
                                            overflow: TextOverflow.clip,
                                            style: TextStyles.body3TextStyle,
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Text(
                      Strings.quickCategories,
                      style: TextStyles.titleTextStyle,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Color(0xFF8C5835)),
                              child: Image.asset(
                                "assets/images/bear.png",
                                height: 40,
                                width: 40,
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              Strings.bear,
                              style: TextStyles.body2TextStyle,
                            )
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Color(0xFF8C5835)),
                              child: Image.asset(
                                "assets/images/lion.png",
                                height: 40,
                                width: 40,
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              Strings.lion,
                              style: TextStyles.body2TextStyle,
                            )
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Color(0xFF8C5835)),
                              child: Image.asset(
                                "assets/images/reptiles.png",
                                height: 40,
                                width: 40,
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              Strings.reptiles,
                              style: TextStyles.body2TextStyle,
                            )
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Color(0xFF8C5835)),
                              child: Image.asset(
                                "assets/images/pets.png",
                                height: 40,
                                width: 40,
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              Strings.pets,
                              style: TextStyles.body2TextStyle,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 32,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
/*
LayoutBuilder(
builder: (BuildContext context, BoxConstraints viewportConstraints) =>
SingleChildScrollView(
child: ConstrainedBox(
constraints: BoxConstraints(
minHeight: viewportConstraints.maxHeight
)
 */
