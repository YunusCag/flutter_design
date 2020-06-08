import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_design/day20/sidebar/side_bar_item.dart';
class SideBarLayout extends StatefulWidget {
  @override
  _SideBarLayoutState createState() => _SideBarLayoutState();
}


class _SideBarLayoutState extends State<SideBarLayout> with AfterLayoutMixin{
  int selectedIndex=0;
  LabeledGlobalKey _walletKey=LabeledGlobalKey("walletKey");
  LabeledGlobalKey _restaurantKey=LabeledGlobalKey("restaurantKey");
  LabeledGlobalKey _myCartKey=LabeledGlobalKey("myCartKey");
  LabeledGlobalKey _myProfileKey=LabeledGlobalKey("myProfileKey");
  RenderBox renderBox;
  double startYPosition;

  @override
  void afterFirstLayout(BuildContext context) {
    setState(() {
      renderBox=_walletKey.currentContext.findRenderObject();
      startYPosition=renderBox.localToGlobal(Offset.zero).dy;
    });

  }
  void onTab(int index){
    setState(() {
      selectedIndex=index;
      switch(selectedIndex){
        case 0:
          renderBox=_walletKey.currentContext.findRenderObject();
          break;
        case 1:
          renderBox=_restaurantKey.currentContext.findRenderObject();
          break;
        case 2:
          renderBox=_myCartKey.currentContext.findRenderObject();
          break;
        case 3:
          renderBox=_myProfileKey.currentContext.findRenderObject();
          break;
      }
    });
    startYPosition=renderBox.localToGlobal(Offset.zero).dy;
  }
  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    return Stack(
      children: <Widget>[
        Positioned(
          width: width/5,
          top: 0,
          bottom: 0,
          right: 0,
          child: ClipPath(
            clipper: SideBarClipper(
                (startYPosition==null)?0:startYPosition-50,
                (startYPosition==null)?0:startYPosition+70
            ),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Color(0xFFFF559F),
                    Color(0xFFCF5CCF),
                    Color(0xFFFF57AC),
                    Color(0xFFFF6D91),
                    Color(0xFFFF8D7E),
                    Color(0xFF86BAA6)
                  ],
                  stops: [
                    0.05,0.3,0.5,0.55,0.8,1
                  ]
                )
              ),
            ),
          ),
        ),
        Positioned(
          right: -30,
          top: 0,
          bottom: 0,
          child: Center(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: height/10,
                ),
                Icon(Icons.dashboard,color: Colors.white,),
                SizedBox(
                  height: 30,
                ),
                Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                SizedBox(
                  height: height/20+20,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      SideBarItem(
                        key: _walletKey,
                        text: "Wallet",
                        onTap: (){
                          onTab(0);
                        },
                        isSelected: selectedIndex==0,
                      ),
                      SideBarItem(
                        key: _restaurantKey,
                        text: "Restaurants",
                        onTap: (){
                          onTab(1);
                        },
                        isSelected: selectedIndex==1,
                      ),
                      SideBarItem(
                        key: _myCartKey,
                        text: "My cart",
                        onTap: (){
                          onTab(2);
                        },
                        isSelected: selectedIndex==2,
                      ),
                      SideBarItem(
                        key: _myProfileKey,
                        text: "My profile",
                        onTap: (){
                          onTab(3);
                        },
                        isSelected: selectedIndex==3,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: height/7+20,
                )
              ],

            ),
          ),
        )
      ],

    );
  }


}

class SideBarClipper extends CustomClipper<Path> {
  final double startYPosition,endYPosition;
  SideBarClipper(this.startYPosition,this.endYPosition);

  @override
  Path getClip(Size size) {
    Path path=Path();
    double width=size.width;
    double height=size.height;

    //up curve
    path.moveTo(width,0);
    path.quadraticBezierTo(width/3,5,width/3,70);
    //selected curve
    path.lineTo(width/3, startYPosition);
    path.quadraticBezierTo(width/3-2,startYPosition+15, width/3,startYPosition+25);
    path.quadraticBezierTo(0,startYPosition+45,0,startYPosition+60);
    path.quadraticBezierTo(0,endYPosition-45,width/3-10,endYPosition-25);
    path.quadraticBezierTo(width/3-2,endYPosition-15,width/3, endYPosition);
    //down curve
    path.lineTo(width/3,height-70);
    path.quadraticBezierTo(width/3,height-5,width,height);
    path.close();


    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
