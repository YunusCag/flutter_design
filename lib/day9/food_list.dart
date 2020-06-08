import 'package:flutter/material.dart';

class FoodList extends StatefulWidget {
  @override
  _FoodListState createState() => _FoodListState();
}

class _FoodListState extends State<FoodList> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        _buildFoodCard(
            "assets/images/steak.png", "Strawberry Waffles", 7.0, 273, false),
        _buildFoodCard('assets/images/steak.png', 'Strawberry Cream Waffles', 18.0, 1546, true),
        _buildFoodCard('assets/images/steak.png', 'Strawberry Cream Waffles', 18.0, 1546, true)
      ],
    );
  }

  _buildFoodCard(String imgPath, String foodName, double price, int calCount,
      bool hasMilk) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0, left: 10, right: 10),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(7.0),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 3.0,
                  spreadRadius: 3.0),
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 15, right: 25, top: 10),
                  child: Image.asset(
                    imgPath,
                    fit: BoxFit.cover,
                    height: 100,
                    width: 100,
                  ),
                ),
                Positioned(
                  top: 92,
                  left: 60,
                  child: hasMilk
                      ? Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                                color: Color(0xFFF75A4C),
                                style: BorderStyle.solid,
                                width: 0.25),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              "with milk",
                              style: TextStyle(
                                  fontFamily: "Montserrat",
                                  fontSize: 10,
                                  color: Color(0xFFF75A4C),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        )
                      : Container(),
                ),
              ],
            ),
            Container(
              width: 125.0,
              padding: EdgeInsets.only(left: 4.0),
              child: Text(
                foodName,
                style: TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 15,
                    color: Color(0xFFF440206),
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 5.0),
            Padding(
              padding: EdgeInsets.only(left: 4.0),
              child: Text('\$' + price.toString(),
                style: TextStyle(

                    fontFamily: 'Montserrat',
                    color: Color(0xFFF75A4C)
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Padding(
                padding: EdgeInsets.only(left: 4.0),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.account_box, color: Color(0xFFF75A4C), size: 15.0),
                    SizedBox(width: 5.0),
                    Text(calCount.toString() + 'cal',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 12.0,
                          color: Colors.grey
                      ),
                    )
                  ],
                )
            )
          ],
        ),
      ),
    );
  }
}
