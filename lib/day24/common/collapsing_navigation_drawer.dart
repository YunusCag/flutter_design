import 'package:flutter/material.dart';
import 'package:flutter_login_design/day24/common/collapsing_header.dart';
import 'package:flutter_login_design/day24/model/navigation_model.dart';
import 'package:flutter_login_design/day24/ui/theme.dart';

import 'collapsing_list_tile.dart';
class CollapsingNavigationDrawer extends StatefulWidget {
  @override
  _CollapsingNavigationDrawerState createState() => _CollapsingNavigationDrawerState();
}

class _CollapsingNavigationDrawerState extends State<CollapsingNavigationDrawer>with SingleTickerProviderStateMixin {


  double width;
  double height;
  double maxDrawerWidth=250;
  double minDrawerWidth=80;
  bool isCollapsed=false;
  int currentSelectedIndex=0;

  AnimationController _animationController;
  Animation<double> widthAnimation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initAnimation();
  }

  void initAnimation() {
    _animationController=AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400)
    );
    widthAnimation=Tween<double>(
      begin: maxDrawerWidth,
      end: minDrawerWidth
    ).animate(CurvedAnimation(curve: Curves.easeIn,parent: _animationController));
  }
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context,child)=>getWidget(context,child),
    );
  }


  Widget getWidget(BuildContext context, Widget child) {
    return Material(
      elevation: 80,
      child: Container(
        width: widthAnimation.value,
        height: height,
        decoration: BoxDecoration(
            color: drawerBackgroundColor,
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              CollapsingHeader(
                imagePath: "assets/images/user.jpg",
                title: "David Link",
                animationController: _animationController,
              ),
              Divider(
                thickness: 0.2,
                color: Colors.white30,
              ),
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (context,index){
                    return Divider(height: 12,thickness: 0.0,);
                  },
                  itemBuilder: (context,index){
                  return CollapsingListTile(
                      onTap:(){
                        setState(() {
                          currentSelectedIndex=index;
                        });
                      },
                      isSelected:currentSelectedIndex==index,
                      title:navigationModelItems[index].title,
                      icon:navigationModelItems[index].icon,
                    animationController: _animationController,
                  );
                },itemCount: navigationModelItems.length,),
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  InkWell(
                    onTap: (){
                      setState(() {
                        isCollapsed=!isCollapsed;
                        if(isCollapsed){
                          _animationController.forward();
                        }else{
                          _animationController.reverse();
                        }
                      });
                    },
                    child: AnimatedIcon(
                      progress: _animationController,
                      icon: AnimatedIcons.close_menu,
                      color: Colors.white30,
                      size: 38,
                    ),
                  ),
                  SizedBox(width: 10,)
                ],
              ),
              SizedBox(
                height: 50,
              )
            ],
          ),
        ),
      ),
    );
  }
}
