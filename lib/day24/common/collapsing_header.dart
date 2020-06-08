import 'package:flutter/material.dart';
import 'package:flutter_login_design/day24/ui/theme.dart';
class CollapsingHeader extends StatefulWidget {
  final String title;
  final String imagePath;
  final AnimationController animationController;

  const CollapsingHeader({Key key, this.title, this.imagePath,this.animationController}) : super(key: key);
  @override
  _CollapsingHeaderState createState() => _CollapsingHeaderState();
}

class _CollapsingHeaderState extends State<CollapsingHeader> {
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
    return Container(
      width: _widthAnimation.value,
      padding: EdgeInsets.only(top: 16,left: 4,right: 8,bottom: 8),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                SizedBox(width: 10,),
                ClipOval(
                  child: Image.asset(
                      widget.imagePath,
                    fit: BoxFit.cover,
                    height: 40,
                    width: 40,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                _widthAnimation.value>=220?Text(
                  widget.title,
                  style: listTileDefaultTextStyle,
                ):Container()
              ],
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
