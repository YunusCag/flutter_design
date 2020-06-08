import 'package:flutter/material.dart';
import 'package:flutter_login_design/day25/page_view_holder.dart';
import 'package:provider/provider.dart';
class CustomMatrixPageViewScreen extends StatefulWidget {
  @override
  _CustomMatrixPageViewScreenState createState() => _CustomMatrixPageViewScreenState();
}

class _CustomMatrixPageViewScreenState extends State<CustomMatrixPageViewScreen> {
  PageController _pageController;
  double fraction=0.50;
  PageViewHolder holder;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    holder=PageViewHolder(value: 2.0);
    _pageController=PageController(initialPage: 2,viewportFraction: fraction);
    _pageController.addListener(() {
      holder.setValue(_pageController.page);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Perspective PageView"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        child: Center(
          child: AspectRatio(
            aspectRatio: 1,
            child: ChangeNotifierProvider<PageViewHolder>.value(
              value: holder,
              child: PageView.builder(
                controller: _pageController,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context,index){
                  return MyPage(
                    index: index.toDouble(),
                    fraction: fraction,
                  );
              },itemCount: 12,),
            ),
          ),
        ),
      ),

    );
  }
}
class MyPage extends StatelessWidget {
  final double index;
  final double fraction;


  MyPage({this.index,this.fraction});

  @override
  Widget build(BuildContext context) {
    double value=Provider.of<PageViewHolder>(context).value;
    double diff=(index-value);
    final Matrix4 pvMatrix=Matrix4.identity()
    ..setEntry(3, 3, 1/0.9)//Increasing Scale by90%
    ..setEntry(1,1, fraction)//Changing Scale Alon Y Axis
    ..setEntry(3,0,0.004*-diff);//Changing Perspective Along X Axis
    final Matrix4 shadowMatrix=Matrix4.identity()
      ..setEntry(3, 3, 1/1.6)//Increasing Scale by60%
      ..setEntry(3,1, -0.004)//Changing Scale Alon Y Axis
      ..setEntry(3,0,0.002*-diff)//Changing Perspective Along X Axis
      ..rotateX(1.309);
    return Stack(
      fit: StackFit.expand,
      alignment: Alignment.center,
      children: <Widget>[
        diff<=1.0&&diff>=-1.0 ?AnimatedOpacity(
          duration: Duration(milliseconds: 100),
          opacity: 1-diff.abs(),
          child: Transform(
            transform:shadowMatrix ,
            alignment: FractionalOffset.bottomCenter,
            child: Container(
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black12,blurRadius: 10.0,spreadRadius: 1.0
                    )
                  ]
              ),
            ),
          ),
        ):Container(),
        Transform(
          transform:pvMatrix ,
          alignment: FractionalOffset.center,
          child: Container(
            child: Image.asset("assets/images/image_${index.toInt()+1}.jpg",fit: BoxFit.fill,),
          ),
        )
      ],
    );
  }
}