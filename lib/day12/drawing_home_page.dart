import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
class DrawingHomePage extends StatefulWidget {
  @override
  _DrawingHomePageState createState() => _DrawingHomePageState();
}

class DrawingArea{
  Offset point;
  Paint areaPaint;
  DrawingArea({this.point,this.areaPaint});
}
class _DrawingHomePageState extends State<DrawingHomePage> {


  List<DrawingArea> points=[];
  Color selectedColor;
  double strokeWidth;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedColor=Colors.black;
    strokeWidth=2.0;
  }

  void selectColor(){
    showDialog(
      context: context,
      child: AlertDialog(
        title: const Text('Pick a color!'),
        content: SingleChildScrollView(
          child: BlockPicker(
            pickerColor: selectedColor,
            onColorChanged: (color){
              this.setState(() {
                selectedColor=color;
              });
            },
          ),
        ),
        actions: <Widget>[
          FlatButton(
            child: const Text('Close'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    final width=MediaQuery.of(context).size.width;
    final height=MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient:LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromRGBO(130,35, 135,1.0),
                  Color.fromRGBO(233,64, 87,1.0),
                  Color.fromRGBO(242,133, 33,1.0)
                ]
              )
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width:width*0.80,
                  height: height*0.80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.4),
                        blurRadius: 5.0,
                        spreadRadius: 1.0
                      )
                    ]
                  ),
                  child: GestureDetector(
                    onPanDown:(details){
                      this.setState((){
                        this.points.add(
                          DrawingArea(
                            point: details.localPosition,
                            areaPaint: Paint()
                              ..strokeCap=StrokeCap.round
                              ..isAntiAlias=true
                              ..color=selectedColor
                              ..strokeWidth=strokeWidth
                          )
                        );
                      });

                    } ,
                    onPanUpdate: (details){
                      this.setState((){
                        this.points.add(
                            DrawingArea(
                                point: details.localPosition,
                                areaPaint: Paint()
                                  ..strokeCap=StrokeCap.round
                                  ..isAntiAlias=true
                                  ..color=selectedColor
                                  ..strokeWidth=strokeWidth
                            )
                        );
                      });

                    },
                    onPanEnd:(details){
                      this.setState((){
                        this.points.add(null);
                      });

                    } ,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: CustomPaint(
                        painter: MyCustomPainter(this.points),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: width*0.80,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0)
                  ),
                  child: Row(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.color_lens,color: selectedColor,),
                        onPressed: (){
                          selectColor();
                        },
                      ),
                      Expanded(
                        child: Slider(
                          min: 1.0,
                          max: 7.0,
                          activeColor: selectedColor,
                          value: strokeWidth,
                          onChanged: (value){
                            this.setState((){
                              strokeWidth=value;
                            });

                          },
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.layers_clear),
                        onPressed: (){
                          debugPrint("Points Length:"+points.length.toString());
                          this.setState((){
                            points.clear();
                          });

                        },
                      )

                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),

    );
  }
}
class MyCustomPainter extends CustomPainter{
  List<DrawingArea> points;
  MyCustomPainter(this.points);
  @override
  void paint(Canvas canvas, Size size) {
    Paint background=Paint()..color=Colors.white;
    Rect rect=Rect.fromLTWH(0,0,size.width,size.height);
    canvas.drawRect(rect, background);

    for(int x=0;x<points.length-1;x++){

      if(points[x]!=null&&points[x+1]!=null){
        Paint paint=points[x].areaPaint;

        canvas.drawLine(points[x].point,
            points[x+1].point,paint);
      }else if(points[x]!=null&&points[x+1]==null){
        Paint paint=points[x].areaPaint;
        canvas.drawPoints(PointMode.points, [points[x].point],
            paint);
      }
    }


  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {

    return true;
  }

}