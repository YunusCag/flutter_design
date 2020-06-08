import 'package:flutter/material.dart';
import 'package:flutter_login_design/animation/fade_animation.dart';
class Day8LoginPage extends StatefulWidget {
  @override
  _Day8LoginPageState createState() => _Day8LoginPageState();
}

class _Day8LoginPageState extends State<Day8LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Color.fromRGBO(3, 9, 23, 1),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    FadeAnimation(1.2,Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold
                      ),
                    )
                    ),
                    SizedBox(height: 30,),
                    FadeAnimation(1.5,Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: Colors.grey[100]
                                    )
                                )
                            ),
                            child: TextField(
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Email or Phone number",
                                  hintStyle: TextStyle(
                                      color: Colors.grey[400]
                                  )
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(8.0),
                            child: TextField(
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Password",
                                  hintStyle: TextStyle(
                                      color: Colors.grey[400]
                                  )
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    FadeAnimation(1.8,Center(
                      child: Container(
                        width:120,
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.blue[800]
                        ),
                        child: Center(
                          child: Text(
                              "Login",
                            style: TextStyle(
                              fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white.withOpacity(.7)
                            ),
                          ),
                        ),
                      ),
                    )
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
