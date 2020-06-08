import 'package:flutter/material.dart';
import 'package:flutter_login_design/day9/food_list.dart';

class Day9HomePage extends StatefulWidget {
  @override
  _Day9HomePageState createState() => _Day9HomePageState();
}

class _Day9HomePageState extends State<Day9HomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(vsync: this, length: 4);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9EFEB),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: (MediaQuery.of(context).size.height) / 3,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(75.0),
                      ),
                      color: Color(0XFFFD7465)),
                ),
                Container(
                  height: (MediaQuery.of(context).size.height) / 3 - 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(75.0),
                      ),
                      color: Color(0xFFFE8A7E)),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 35, left: 20),
                  child: Text(
                    "Good Afternoon!",
                    style: TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 75, left: 20),
                  child: Text(
                    "Choose your favourite!",
                    style: TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 160, left: 15, right: 15),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(25.0),
                          bottomLeft: Radius.circular(5.0),
                          topLeft: Radius.circular(5.0)),
                    ),
                    child: TextField(
                      autofocus: false,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(top: 14.0),
                          hintText: "Search for your favourite",
                          hintStyle: TextStyle(
                              fontFamily: "Montserrat",
                              fontSize: 18,
                              color: Colors.grey,
                              fontWeight: FontWeight.normal),
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.grey,
                            size: 28,
                          )),
                    ),
                  ),
                )
              ],
            ),
            TabBar(
              controller: _tabController,
              indicatorColor: Color(0xFFFE8A7E),
              indicatorSize: TabBarIndicatorSize.label,
              indicatorWeight: 4.0,
              isScrollable: true,
              labelColor: Color(0xFF440206),
              unselectedLabelColor: Color(0xFF440206),
              tabs: <Widget>[
                Tab(
                  child: Text(
                    "DESSERT",
                    style: TextStyle(fontFamily: "Montserrat", fontSize: 18.0),
                  ),
                ),
                Tab(
                  child: Text(
                    "PIZZA",
                    style: TextStyle(fontFamily: "Montserrat", fontSize: 18.0),
                  ),
                ),
                Tab(
                  child: Text(
                    "BARBECUE",
                    style: TextStyle(fontFamily: "Montserrat", fontSize: 18.0),
                  ),
                ),
                Tab(
                  child: Text(
                    "DRINKS",
                    style: TextStyle(fontFamily: "Montserrat", fontSize: 18.0),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              height: (MediaQuery.of(context).size.height)/3,
              child: TabBarView(
                controller: _tabController,
                children: <Widget>[
                  FoodList(),
                  FoodList(),
                  FoodList(),
                  FoodList(),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: EdgeInsets.only(left: 15),
              child: Text(
                "RECOMMEND",
                style: TextStyle(fontFamily: "Montserrat", fontSize: 15.0),
              ),
            ),
            _listItem("assets/images/steak.png","Chocolate lemon cup cake",
                "The sour and swetness of the lemon neutralizes the sweetness of the cream",
                "\$18.0",134,2412,"2-3per"),
            SizedBox(height: 10.0),
            _listItem("assets/images/steak.png","Chocolate lemon cup cake",
                "The sour and swetness of the lemon neutralizes the sweetness of the cream",
                "\$18.0",134,2412,"2-3per"),
          ],
        ),
      ),
    );
  }

  _listItem(String imgPath, String foodName, String desc, String price, int likes, int calCount, String serving) {
    return Padding(
      padding: EdgeInsets.only(left: 15.0, top: 15.0),
      child: Stack(
        children: <Widget>[
          Container(
            height: 170.0,
            width: MediaQuery.of(context).size.width,
          ),
          Positioned(
            left: 15.0,
            top: 30.0,
            child: Container(
              height: 125.0,
              width: MediaQuery.of(context).size.width - 15.0,
              decoration: BoxDecoration(
                  color: Color(0xFFF9EFEB),
                  borderRadius: BorderRadius.circular(5.0),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 3.0,
                        blurRadius: 3.0
                    )
                  ]
              ),
              child: Text('Helloworld'),
            ),
          ),
          Positioned(
              left: 95.0,
              top: 64.0,
              child:Container(
                height: 105.0,
                width: MediaQuery.of(context).size.width - 15.0,
                decoration: BoxDecoration(
                    color: Color(0xFFF9EFEB),
                    borderRadius: BorderRadius.circular(5.0),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 3.0,
                          blurRadius: 3.0
                      )
                    ]
                ),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 10.0, left: 10.0),
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.favorite, color: Color(0xFFF75A4C), size: 15.0),
                        SizedBox(width: 5.0),
                        Text(likes.toString(),
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 12.0,
                              color: Colors.grey
                          ),
                        ),
                        SizedBox(width: 25.0),
                        Icon(Icons.account_box, color: Color(0xFFF75A4C), size: 15.0),
                        SizedBox(width: 5.0),
                        Text(calCount.toString() + 'cal',
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 12.0,
                              color: Colors.grey
                          ),
                        ),
                        SizedBox(width: 25.0),
                        Icon(Icons.play_circle_outline, color: Color(0xFFF75A4C), size: 15.0),
                        SizedBox(width: 5.0),
                        Text(serving,
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 12.0,
                              color: Colors.grey
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
          ),
          Container(
            height: 125.0,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.white,
            ),
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Image.asset(imgPath, fit: BoxFit.cover),
                  SizedBox(width: 10.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 10.0),
                      Text(foodName,
                        style: TextStyle(
                            color: Color(0xFF563734),
                            fontFamily: 'Montserrat',
                            fontSize: 15.0
                        ),
                      ),
                      SizedBox(height: 5.0),
                      Container(
                        width: 175.0,
                        child: Text(desc,
                          style: TextStyle(
                              color: Color(0xFFB2A9A9),
                              fontFamily: 'Montserrat',
                              fontSize: 11.0
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Text(price.toString(),
                        style: TextStyle(
                            color: Color(0xFFF76053),
                            fontFamily: 'Montserrat',
                            fontSize: 15.0
                        ),
                      )
                    ],
                  )
                ],

              ),
            ),
          )
        ],
      ),
    );
  }
}
