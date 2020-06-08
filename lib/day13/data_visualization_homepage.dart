import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';


class DataVisualizationHomePage extends StatefulWidget {
  @override
  _DataVisualizationHomePageState createState() => _DataVisualizationHomePageState();
}

class _DataVisualizationHomePageState extends State<DataVisualizationHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            color:Colors.deepOrange,
            height:MediaQuery.of(context).size.height,
            width:MediaQuery.of(context).size.width,
            child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "This is a just a demo app"
                ),

              ]
            )
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30)
              ),
              child: CurvedNavigationBar(
                color: Colors.white,
                height: 45,
                backgroundColor: Colors.deepOrange,
                buttonBackgroundColor: Colors.white,
                items: <Widget>[
                  Icon(Icons.verified_user,size: 20,color: Colors.black,),
                  Icon(Icons.add,size: 20,color: Colors.black,),
                  Icon(Icons.list,size: 20,color: Colors.black,),
                  Icon(Icons.favorite,size: 20,color: Colors.black,),
                  Icon(Icons.exit_to_app,size: 20,color: Colors.black,)
                ],
                index: 2,
                animationDuration: Duration(milliseconds: 200),
                animationCurve: Curves.bounceInOut,
                onTap: (index){
                  debugPrint("Current Index:$index");

                },

              ),
            ) ,
          )
        ],
      ),

    );
  }
}



