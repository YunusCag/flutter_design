import 'package:flutter/material.dart';
import 'package:flutter_login_design/day19/model/Detail.dart';

final imageList=[
  "assets/images/newyork.jpg",
  "assets/images/capetown.jpg",
  "assets/images/switzerland.jpg"
];
final colorList=[
  Colors.redAccent.shade100,
  Colors.blueAccent.shade100,
  Colors.amber.shade50
];
class CityExplorerPage extends StatefulWidget {
  @override
  _CityExplorerPageState createState() => _CityExplorerPageState();
}

class _CityExplorerPageState extends State<CityExplorerPage> {

  PageController _pageController;
  int currentPage=0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController=PageController(
      initialPage: currentPage,
      viewportFraction: 0.8
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pageController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AnimatedContainer(
          duration: Duration(milliseconds: 500),
          color: colorList[currentPage],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height*3/4,
              child: PageView.builder(itemBuilder: (context,index){
                return _itemBuilder(index);
              },
                itemCount: 3,
                controller: _pageController,
                pageSnapping: true,
                onPageChanged:_onPageChanged,
                physics: ClampingScrollPhysics(),
              ),
            ),
            _detailsBuilder(currentPage)

          ],
        ),
      ],
    );
  }
  Widget _itemBuilder(int index) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (context,child){
        double value=1;
        if(_pageController.position.haveDimensions){
          value=_pageController.page-index;
          value=(1-(value.abs()*0.5)).clamp(0.0,1.0);

          return Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: EdgeInsets.only(left: 25,right: 25,bottom: 10.0),
              height: Curves.easeIn.transform(value)*MediaQuery.of(context).size.height*3/4,
              child: child,
            ),
          );
        }else{
          return Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: EdgeInsets.only(left: 25,right: 25,bottom: 10.0),
              height: Curves.easeIn.transform(index==0?value:value*0.5)*MediaQuery.of(context).size.height*3/4,
              child: child,
            ),
          );
        }
      },
      child:  Material(
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10.0),
              bottomRight: Radius.circular(10.0)
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 10,right: 10,bottom: 10),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(15),
                bottomLeft: Radius.circular(15)
            ),
            child: Image.asset(
              imageList[index],
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
      ),
    );
  }

  void _onPageChanged(int index) {
    setState(() {
      currentPage=index;
    });
  }

  Widget _detailsBuilder(index) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (context,child){
        double value=1;
      if(_pageController.position.haveDimensions){
        value=_pageController.page-index;
        value=(1-(value.abs()*0.5)).clamp(0.0,1.0);
      }
        return Expanded(
          child: Transform.translate(
            offset: Offset(0,100+(-value*100)),
            child: Opacity(
              opacity: value,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: <Widget>[
                    Text(
                      detailsList[index].title,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        color: Colors.black
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      detailsList[index].description,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 80.0,
                      height: 5.0,
                      color: Colors.black54,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Read More",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w900
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ),
        );
      },
    );

  }
}
