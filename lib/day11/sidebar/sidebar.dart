import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login_design/day11/bloc/navigation_bloc.dart';
import 'package:flutter_login_design/day11/sidebar/menu_item.dart';
import 'package:rxdart/rxdart.dart';

class SideBar extends StatefulWidget {
  //Color(0xFF262AAA)

  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  final _animationDuration = Duration(milliseconds: 300);
  StreamController<bool> _isSideBarOpenedSC;
  Stream<bool> _isSideBarOpenedStream;

  StreamSink<bool> _isSideBardOpenedSink;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: _animationDuration);

    _isSideBarOpenedSC = PublishSubject<bool>();
    _isSideBarOpenedStream = _isSideBarOpenedSC.stream;
    _isSideBardOpenedSink = _isSideBarOpenedSC.sink;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _animationController.dispose();
    _isSideBarOpenedSC.close();
    _isSideBardOpenedSink.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return StreamBuilder<bool>(
      initialData: false,
      stream: _isSideBarOpenedStream,
      builder: (context, isSideBarOpenedAsync) {
        return AnimatedPositioned(
          duration: _animationDuration,
          top: 0,
          bottom: 0,
          left: isSideBarOpenedAsync.data ? 0 : -screenWidth,
          right: isSideBarOpenedAsync.data ? 0 : screenWidth - 50,
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  height: screenHeight,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15),
                      bottomRight: Radius.circular(15)
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      stops: [0.1,0.6,0.8],
                      colors: [
                        Colors.blue.shade900,
                        Colors.blue.shade800,
                        Colors.blue.shade700
                      ]
                    )
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 100,
                        ),
                        ListTile(
                          contentPadding: EdgeInsets.all(5),
                          title: Text(
                            "Yunus Çağlıyan",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.w600),
                          ),
                          subtitle: Text(
                            "yunuscagliyan8@gmail.com",
                            style: TextStyle(
                                color: Color(0xFF1BB5FD),
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          ),
                          leading: CircleAvatar(
                            child: Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                            radius: 40,
                          ),
                        ),
                        Divider(
                          height: 64,
                          thickness: 0.5,
                          color: Colors.white,
                          indent: 32,
                          endIndent: 32,
                        ),
                        InkWell(
                          onTap: (){
                            BlocProvider.of<NavigationBloc>(context)
                                .add(NavigationEvents.HomePageClickedEvent);
                            _onMenuIconClicked();
                          },
                          child: MenuItem(
                              icon: Icons.home,
                              title: "Home Page"
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            BlocProvider.of<NavigationBloc>(context)
                                .add(NavigationEvents.MyAccountClickedEvent);
                            _onMenuIconClicked();
                          },
                          child: MenuItem(
                              icon: Icons.account_box,
                              title: "My Account"
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            BlocProvider.of<NavigationBloc>(context)
                                .add(NavigationEvents.MyOrdersClickedEvent);
                            _onMenuIconClicked();
                          },
                          child: MenuItem(
                            icon: Icons.shopping_cart,
                            title: "My Orders",
                          ),
                        ),
                        Divider(
                          height: 64,
                          thickness: 0.5,
                          color: Colors.white,
                          indent: 32,
                          endIndent: 32,
                        ),
                        MenuItem(
                          icon: Icons.settings,
                          title: "Settings",
                        ),
                        MenuItem(
                          icon: Icons.help,
                          title: "Help",
                        ),
                        MenuItem(
                          icon: Icons.exit_to_app,
                          title: "Log out",
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment(0, -0.97),
                child: InkWell(
                  onTap: _onMenuIconClicked,
                  child: ClipPath(
                    clipper: CustomMenuClipper(),
                    child: Container(
                      alignment: Alignment.center,
                      width: 35,
                      height: 110,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.bottomLeft,
                              end: Alignment.topRight,
                              stops: [0.1,0.6,0.8],
                              colors: [
                                Colors.blue.shade900,
                                Colors.blue.shade800,
                                Colors.blue.shade700
                              ]
                          )
                      ),
                      child: AnimatedIcon(
                        progress: _animationController.view,
                        icon: AnimatedIcons.menu_arrow,
                        size: 32,
                        color: Color(0xFF1BB5FD),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
  void _onMenuIconClicked() {
    final animationStatus = _animationController.status;
    final isAnimationCompleted = animationStatus == AnimationStatus.completed;

    if (isAnimationCompleted) {
      _isSideBardOpenedSink.add(false);
      _animationController.reverse();
    } else {
      _animationController.forward();
      _isSideBardOpenedSink.add(true);
    }
  }
}
class CustomMenuClipper extends CustomClipper<Path>{
  @override
  getClip(Size size) {
    Paint paint=Paint();
    paint.color=Colors.white;

    final width=size.width;
    final height=size.height;
    Path path=Path();
    path.moveTo(0, 0);
    path.quadraticBezierTo(0, 8, 10,16);
    path.quadraticBezierTo(width-1,height/2 - 20,width,height/2);
    path.quadraticBezierTo(width+1,height/2 + 20, 10, height-16);
    path.quadraticBezierTo(0,height-8,0,height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {

    return true;
  }

}
