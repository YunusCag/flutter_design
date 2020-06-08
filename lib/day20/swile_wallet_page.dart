import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_design/day20/sidebar/side_bar_layout.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'chart.dart';

final List<double> data = [55.0, 90.0, 40, 35, 55, 70, 100];

class SwileWalletPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Swile Wallet App"),
      ),
      backgroundColor: Colors.white.withOpacity(0.9),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: SafeArea(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Hello",
                    style: TextStyle(fontSize: 22, color: Colors.black),
                  ),
                  Text(
                    "Yunus Çağlıyan",
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                        fontWeight: FontWeight.w800),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Center(
                    child: ClayContainer(
                      height: 300,
                      width: width * 0.8,
                      spread: 12,
                      depth: 12,
                      borderRadius: 16,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 16, top: 16, right: 16),
                            child: Text("Total Balance",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black)),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              "425,04€",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.black),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Expanded(
                            child: Chart(data: data),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      ClayContainer(
                        height: 180,
                        width: width * 0.35,
                        emboss: true,
                        borderRadius: 16,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 16, top: 16, right: 16),
                              child: Text("Balance for Today",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.black)),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Text(
                                "19,00€",
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.black),
                              ),
                            ),
                            Spacer(),
                            Container(
                              margin: EdgeInsets.only(
                                  bottom: 16, right: 16, left: 16),
                              height: 10,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.black45),
                            ),
                          ],
                        ),
                      ),
                      ClayContainer(
                        height: 180,
                        width: width * 0.35,
                        borderRadius: 16,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 16, top: 16, right: 16),
                              child: Text("Unlock the Limit of 19€",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.black)),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Text(
                                "By linking your bank card",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black),
                              ),
                            ),
                            Spacer(),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Container(
                                margin: EdgeInsets.only(bottom: 16, right: 16),
                                height: 40,
                                width: 40,
                                child: Center(
                                  child: Icon(
                                    Icons.arrow_forward,
                                    size: 24,
                                    color: Colors.white,
                                  ),
                                ),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    gradient: LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        colors: [
                                          Color(0xFFFF559F),
                                          Color(0xFFCF5CCF),
                                          Color(0xFFFF57AC),
                                          Color(0xFFFF6D91),
                                          Color(0xFFFF8D7E),
                                          Color(0xFF86BAA6)
                                        ],
                                        stops: [
                                          0.05,
                                          0.3,
                                          0.5,
                                          0.55,
                                          0.8,
                                          1
                                        ])),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "March 2020",
                          style: TextStyle(
                              color: Colors.black45,
                              fontWeight: FontWeight.w900),
                        ),
                        Text(
                          "-52,30€",
                          style: TextStyle(
                              color: Colors.black45,
                              fontWeight: FontWeight.w900),
                        )
                      ],
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      ListTile(
                        leading: ClayContainer(
                          width: 40,
                          height: 40,
                          borderRadius: 16,
                          child: Center(
                            child: ShaderMask(
                                shaderCallback: (Rect bounds) {
                                  return LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Color(0xFFFF559F),
                                        Color(0xFFCF5CCF),
                                        Color(0xFFFF57AC),
                                        Color(0xFFFF6D91),
                                        Color(0xFFFF8D7E),
                                        Color(0xFF86BAA6)
                                      ],
                                      stops: [
                                        0.05,
                                        0.3,
                                        0.5,
                                        0.55,
                                        0.8,
                                        1
                                      ]).createShader(bounds);
                                },
                                blendMode: BlendMode.srcATop,
                                child: Icon(
                                  FontAwesomeIcons.pizzaSlice,
                                  color: Colors.red,
                                  size: 30,
                                )),
                          ),
                        ),
                        title: Text(
                          "Sc Boul Andre",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                            color: Colors.black
                          ),
                        ),
                        subtitle: Text(
                          "12 March 13:43",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black45,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        trailing: Text(
                          "-9.20€",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                      ListTile(
                        leading: ClayContainer(
                          width: 40,
                          height: 40,
                          borderRadius: 16,
                          child: Center(
                            child: ShaderMask(
                                shaderCallback: (Rect bounds) {
                                  return LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Color(0xFFFF559F),
                                        Color(0xFFCF5CCF),
                                        Color(0xFFFF57AC),
                                        Color(0xFFFF6D91),
                                        Color(0xFFFF8D7E),
                                        Color(0xFF86BAA6)
                                      ],
                                      stops: [
                                        0.05,
                                        0.3,
                                        0.5,
                                        0.55,
                                        0.8,
                                        1
                                      ]).createShader(bounds);
                                },
                                blendMode: BlendMode.srcATop,
                                child: Icon(
                                  FontAwesomeIcons.pizzaSlice,
                                  color: Colors.red,
                                  size: 30,
                                )),
                          ),
                        ),
                        title: Text(
                          "Sc Boul Andre",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                              color: Colors.black
                          ),
                        ),
                        subtitle: Text(
                          "12 March 13:43",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black45,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        trailing: Text(
                          "-9.20€",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                      ListTile(
                        leading: ClayContainer(
                          width: 40,
                          height: 40,
                          borderRadius: 16,
                          child: Center(
                            child: ShaderMask(
                                shaderCallback: (Rect bounds) {
                                  return LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Color(0xFFFF559F),
                                        Color(0xFFCF5CCF),
                                        Color(0xFFFF57AC),
                                        Color(0xFFFF6D91),
                                        Color(0xFFFF8D7E),
                                        Color(0xFF86BAA6)
                                      ],
                                      stops: [
                                        0.05,
                                        0.3,
                                        0.5,
                                        0.55,
                                        0.8,
                                        1
                                      ]).createShader(bounds);
                                },
                                blendMode: BlendMode.srcATop,
                                child: Icon(
                                  FontAwesomeIcons.pizzaSlice,
                                  color: Colors.red,
                                  size: 30,
                                )),
                          ),
                        ),
                        title: Text(
                          "Sc Boul Andre",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                              color: Colors.black
                          ),
                        ),
                        subtitle: Text(
                          "12 March 13:43",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black45,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        trailing: Text(
                          "-9.20€",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      endDrawer: SideBarLayout(),
    );
  }
}
