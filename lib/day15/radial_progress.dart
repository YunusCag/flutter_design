import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as math;
class RadialProgress extends StatefulWidget {
  double goalCompleted=0.7;
  @override
  _RadialProgressState createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress> with SingleTickerProviderStateMixin{
  AnimationController _radialProgressAC;
  Animation<double> _progressAnimation;
  double progressDegrees=0;
  final Duration fadeInDuration = Duration(milliseconds: 500);
  final Duration fillDuration = Duration(seconds: 2);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _radialProgressAC=AnimationController(
        vsync: this,
        duration: Duration(seconds: 3)
    );
    _progressAnimation=Tween(
      begin: 0.0,
      end: 360.0
    ).animate(CurvedAnimation(parent: _radialProgressAC,curve: Curves.easeIn))
    ..addListener(() {
      setState(() {
        progressDegrees=widget.goalCompleted*_progressAnimation.value;
      });
    });
    _radialProgressAC.forward();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _radialProgressAC.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      child: Container(
        width: 200,
        height: 200,
        padding: EdgeInsets.symmetric(vertical: 50.0),
        child: Center(
          child: AnimatedOpacity(
            opacity: progressDegrees > 30 ? 1.0 : 0.0,
            duration: fadeInDuration,
            child: Column(
              children: <Widget>[
                Text(
                  'RUNNING',
                  style: TextStyle(fontSize: 20.0, letterSpacing: 1.5),
                ),
                SizedBox(
                  height: 4.0,
                ),
                Container(
                  height: 5.0,
                  width: 50.0,
                  decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.all(Radius.circular(4.0))),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  '1.225',
                  style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                ),
                Text(
                  'CALORIES BURN',
                  style: TextStyle(
                      fontSize: 14.0, color: Colors.blue, letterSpacing: 1.5),
                ),
              ],
            ),
          ),
        ),
      ),
      painter:  RadialPainter(progressDegrees),

    );
  }
}

class RadialPainter extends CustomPainter {
  double progressInDegrees;


  RadialPainter(this.progressInDegrees);
  @override
  void paint(Canvas canvas, Size size) {

    Paint paint=Paint()..color=Colors.black12
      ..strokeCap=StrokeCap.round
      ..style=PaintingStyle.stroke
      ..strokeWidth=10.0;
    Offset center=Offset(size.width/2,size.height/2);
    canvas.drawCircle(center, size.width/2, paint);
    Paint progressPaint=Paint()
      ..color=Colors.blue
      ..shader=LinearGradient(
        colors: [
          Colors.red,
          Colors.purple,
          Colors.purpleAccent

        ]
      ).createShader(Rect.fromCircle(center: center,radius: size.width/2))
      ..strokeCap=StrokeCap.round
      ..style=PaintingStyle.stroke
      ..strokeWidth=10.0;
    canvas.drawArc(Rect.fromCircle(center:center,radius: size.width/2),
        math.radians(-90), math.radians(progressInDegrees), false, progressPaint);


  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
