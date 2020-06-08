import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
class LiquidSwipePage extends StatelessWidget {

  // Temporibus autem aut\n
// officiis debitis aut rerum\n
// necessitatibus

// Excepteur sint occaecat cupidatat\n
// non proident, sunt in\n
// culpa qui officia


  static const TextStyle goldCoinGreyStyle=TextStyle(
    color: Colors.grey,
    fontSize: 20,
    fontFamily: "Product Sans",
    fontWeight: FontWeight.bold,
  );
  static const TextStyle goldCoinWhiteStyle=TextStyle(
    color: Colors.white,
    fontSize: 20,
    fontFamily: "Product Sans",
    fontWeight: FontWeight.bold,
  );
  static const TextStyle greyStyle=TextStyle(
    fontSize:40,
    color: Colors.grey,
    fontFamily: "Product Sans"
  );
  static const TextStyle whiteStyle=TextStyle(
      fontSize:40,
      color: Colors.white,
      fontFamily: "Product Sans"
  );
  static const TextStyle boldStyle=TextStyle(
      fontSize:40,
      color: Colors.black,
      fontFamily: "Product Sans",
      fontWeight: FontWeight.bold,
  );
  static const TextStyle descriptionGreyStyle=TextStyle(
    fontSize:20,
    color: Colors.grey,
    fontFamily: "Product Sans",
    fontWeight: FontWeight.normal,
  );
  static const TextStyle descriptionWhiteStyle=TextStyle(
    fontSize:20,
    color: Colors.white,
    fontFamily: "Product Sans",
    fontWeight: FontWeight.normal,
  );
  final pages=[
    Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Gold Coin",
                  style: goldCoinGreyStyle,
                ),
                Text(
                  "Skip",
                  style: goldCoinGreyStyle,
                )
              ],
            ),
          ),
          Image.asset("assets/images/firstImage.png"),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Online",
                  style: greyStyle,
                ),
                Text(
                  "Gambling",
                  style: boldStyle,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Temporibus autem aut\n"
                    +"officiis debitis aut rerum\n"
                      +"necessitatibus",
                  style: descriptionGreyStyle,
                )
              ],
            ),
          )
        ],
      ),
    ),
    Container(
      color: Colors.purple,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Gold Coin",
                  style: goldCoinWhiteStyle,
                ),
                Text(
                  "Skip",
                  style: goldCoinWhiteStyle,
                )
              ],
            ),
          ),
          Image.asset("assets/images/secondImage.png"),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Online",
                  style: whiteStyle,
                ),
                Text(
                  "Gambling",
                  style: boldStyle,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Temporibus autem aut\n"
                      +"officiis debitis aut rerum\n"
                      +"necessitatibus",
                  style: descriptionWhiteStyle,
                )
              ],
            ),
          )
        ],
      ),
    ),
    Container(
      color: Colors.orange,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Gold Coin",
                  style: goldCoinWhiteStyle,
                ),
                Text(
                  "Skip",
                  style: goldCoinWhiteStyle,
                )
              ],
            ),
          ),
          Image.asset("assets/images/firstImage.png"),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Online",
                  style: whiteStyle,
                ),
                Text(
                  "Gambling",
                  style: boldStyle,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Temporibus autem aut\n"
                      +"officiis debitis aut rerum\n"
                      +"necessitatibus",
                  style: descriptionWhiteStyle,
                )
              ],
            ),
          )
        ],
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LiquidSwipe(
        pages: pages,
        enableLoop: true,
        fullTransitionValue: 300,
        enableSlideIcon: true,
        waveType: WaveType.liquidReveal,
        positionSlideIcon: 0.5,
        initialPage: 0,


      ),

    );
  }

}
