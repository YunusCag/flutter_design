import 'package:flutter/material.dart';
import 'package:flutter_login_design/day20/styleguide/text_styles.dart';
class SideBarItem extends StatelessWidget {
  final bool isSelected;
  final String text;
  final Function onTap;
  final Key key;
  SideBarItem({this.key,this.isSelected,this.text,this.onTap}):super(key:key);
  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -1.58,
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: <Widget>[
            Container(
              height: 6,
              width: 6,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected?Colors.white:Colors.transparent
              ),
            ),
            AnimatedDefaultTextStyle(
              duration: Duration(milliseconds: 200),
              child: Text(
                text,
              ),
              style: isSelected?selectedTabStyle:defaultTabStyle,
            )
          ],
        ),
      ),

    );
  }
}
