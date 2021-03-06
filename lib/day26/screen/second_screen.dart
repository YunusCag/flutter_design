import 'package:flutter/material.dart';
class SecondScreen extends StatelessWidget {
  final double _smallFontSize = 12;
  final double _valFontSize = 30;
  final FontWeight _smallFontWeight = FontWeight.w500;
  final FontWeight _valFontWeight = FontWeight.w700;
  final Color _fontColor = Color(0xff5b6990);
  final double _smallFontSpacing = 1.3;

  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.of(context).size.height;
    final width=MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30,vertical: 25),
      alignment: Alignment.topCenter,
      child: ListView(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("AVERAGE SLEEP",
                      style: TextStyle(
                        fontWeight: _smallFontWeight,
                        fontSize: _smallFontSize,
                        letterSpacing: _smallFontSpacing,
                        color: _fontColor,
                      )),
                  SizedBox(height: 10),
                  Text("6.45h",
                      style: TextStyle(
                        fontWeight: _valFontWeight,
                        fontSize: _valFontSize,
                        color: _fontColor,
                      )),
                  SizedBox(height: 30),
                  Text("AVERAGE SLEEP",
                      style: TextStyle(
                        fontWeight: _smallFontWeight,
                        fontSize: _smallFontSize,
                        letterSpacing: _smallFontSpacing,
                        color: _fontColor,
                      )),
                  SizedBox(height: 10),
                  Text("6.45h",
                      style: TextStyle(
                        fontWeight: _valFontWeight,
                        fontSize: _valFontSize,
                        color: _fontColor,
                      )),
                ],
              ),
              Container(
                height: width*0.5,
                width: width*0.5,
                decoration: BoxDecoration(
                  color: Color(0xFFF0F5FB),
                  border: Border.all(
                    width: 8,
                    color: Color(0xFFD3E1ED)
                  ),
                  borderRadius: BorderRadius.circular(3)
                ),
                padding: EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "THIS WEEK",
                      style: TextStyle(
                        fontSize: _smallFontSize,
                        letterSpacing: _smallFontSpacing,
                        color: _fontColor
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: width*0.5*0.6,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      width: double.infinity,
                      child: CustomPaint(
                        foregroundPainter: GraphPainter(),
                      ),
                    )

                  ],
                ),
              )

            ],
          ),
          SizedBox(
            height: 25,
          ),
          RecordItem(fontColor: _fontColor, smallFontSpacing: _smallFontSpacing,day:"THURSDAY"),
          RecordItem(fontColor: _fontColor, smallFontSpacing: _smallFontSpacing,day:"WEDNESDAY"),
          RecordItem(fontColor: _fontColor, smallFontSpacing: _smallFontSpacing,day:"THUESDAY"),
          RecordItem(fontColor: _fontColor, smallFontSpacing: _smallFontSpacing,day:"FRIDAY"),
          RecordItem(fontColor: _fontColor, smallFontSpacing: _smallFontSpacing,day:"SATURDAY"),
          RecordItem(fontColor: _fontColor, smallFontSpacing: _smallFontSpacing,day:"SUNDAY")
        ],
      ),
    );
  }
}

class GraphPainter extends CustomPainter {
  Paint trackBarPaint=Paint()
  ..color=Color(0xFF818AAB)
  ..style=PaintingStyle.stroke
  ..strokeCap=StrokeCap.round
  ..strokeWidth=12;
  Paint trackPaint=Paint()
  ..color=Color(0xFFDEE6F1)
  ..style=PaintingStyle.stroke
  ..strokeWidth=12
  ..strokeCap=StrokeCap.round;
  @override
  void paint(Canvas canvas, Size size) {
    Path trackPath=Path();
    Path trackBarPath=Path();

    List val =[
      size.height*0.8,
      size.height*0.5,
      size.height*0.9,
      size.height*0.8,
      size.height*0.5

    ];


    double origin=8;
    for(double i in val){
      trackPath.moveTo(origin,size.height);
      trackPath.lineTo(origin,0);

      trackBarPath.moveTo(origin,size.height);
      trackBarPath.lineTo(origin,i);

      canvas.drawPath(trackPath,trackPaint);
      canvas.drawPath(trackBarPath,trackBarPaint);

      origin=origin+size.width*0.22;
    }


    

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {

    return false;
  }
}

class RecordItem extends StatelessWidget {
  const RecordItem({
    Key key,
    @required Color fontColor,
    @required double smallFontSpacing,
    @required this.day
  }) : _fontColor = fontColor, _smallFontSpacing = smallFontSpacing, super(key: key);

  final Color _fontColor;
  final double _smallFontSpacing;
  final String day;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color(0xFFDDE9F7),
            width: 1.5
          )
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
              day,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: _fontColor
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            children: <Widget>[
              Text(
                "01/21/2019",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  letterSpacing: _smallFontSpacing,
                  color: _fontColor
                ),
              ),
              SizedBox(
                width: 25,
              ),
              Expanded(
                child: Text(
                  "45.3 MINUTES",
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    letterSpacing: _smallFontSpacing,
                    color: _fontColor
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
