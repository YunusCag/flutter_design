import 'package:flutter/material.dart';
import 'dart:math';
class Chart extends StatelessWidget {
  final List<double> data;
  Key key;
  Chart({this.key,this.data}):super(key:key);
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: ChartClipper(
        data:data,
        maxValue:data.reduce(max)
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(16),

          ),
            gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
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
    );
  }
}
class ChartClipper extends CustomClipper<Path>{
  final List<double> data;
  final double maxValue;
  ChartClipper({this.data,this.maxValue});
  
  @override
  Path getClip(Size size) {
    double sectionWidth=size.width/(data.length-1);

    Path path=Path();
    path.moveTo(0,size.height);
    for(int i=0;i<data.length;i++){
      path.lineTo(sectionWidth*i,size.height-(data[i]/maxValue)*size.height);
    }

    path.lineTo(size.width,size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }

}