import 'package:flutter/material.dart';
import 'package:flutter_login_design/day24/ui/theme.dart';
class CollapsingListTile extends StatefulWidget {
  final String  title;
  final IconData icon;
  final bool isSelected;
  final Function onTap;
  final AnimationController animationController;


  CollapsingListTile({this.title, this.icon,this.animationController,this.onTap,this.isSelected=false});

  @override
  _CollapsingListTileState createState() => _CollapsingListTileState();
}

class _CollapsingListTileState extends State<CollapsingListTile> {
  Animation<double> _widthAnimation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initAnimation();
  }

  void initAnimation() {
     _widthAnimation=Tween<double>(
      begin: 250,
      end: 80
    ).animate(CurvedAnimation(curve: Curves.easeIn,parent: widget.animationController));
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        width: _widthAnimation.value,
        margin: EdgeInsets.symmetric(horizontal: 8),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: widget.isSelected?Colors.transparent.withOpacity(0.3):drawerBackgroundColor,
          borderRadius: BorderRadius.circular(5)
        ),
        child: Row(
          children: <Widget>[
            Icon(
              this.widget.icon,
              size: 38,
              color: widget.isSelected?selectedColor:Colors.white30,
            ),
            _widthAnimation.value>=220?Padding(
              padding: const EdgeInsets.only(left:8.0),
              child: Text(
                this.widget.title,
                style: widget.isSelected?listTileSelectedTextStyle:listTileDefaultTextStyle,
              ),
            ):Container()
          ],
        ),
      ),
    );
  }
}
