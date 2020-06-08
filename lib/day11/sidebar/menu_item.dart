import 'package:flutter/material.dart';
class MenuItem extends StatelessWidget {

  final IconData icon;
  final String title;
  MenuItem({
    Key key,
    @required this.icon,
    @required this.title}):super(key:key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Row(
        children: <Widget>[
          Icon(
              this.icon,
            color: Colors.cyan,
            size: 30,
          ),
          SizedBox(width: 20,),
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 26,
              color: Colors.white
            ),
          )
        ],
      ),

    );
  }
}
