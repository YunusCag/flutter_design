import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_design/day23/model/meal.dart';
import 'package:flutter_login_design/day23/ui/pages/meal_detail_page.dart';
import 'package:flutter_login_design/day23/ui/pages/workout_page.dart';
import 'package:intl/intl.dart';
import 'package:vector_math/vector_math_64.dart' as math;
class DietHomePage extends StatefulWidget {
  @override
  _DietHomePageState createState() => _DietHomePageState();
}

class _DietHomePageState extends State<DietHomePage> {

  int currentBar=0;
  @override
  Widget build(BuildContext context) {
    final double height=MediaQuery.of(context).size.height;
    final double width=MediaQuery.of(context).size.width;
    final today=DateTime.now();
    return Scaffold(
      backgroundColor: const Color(0xFFE9E9E9),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(40)
        ),
        child: BottomNavigationBar(
          showSelectedLabels: true,
          showUnselectedLabels: false,
          selectedLabelStyle: TextStyle(
            color: Colors.black
          ),
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          iconSize: width*0.07,
          selectedIconTheme: IconThemeData(
            color: const Color(0xFF200087),
            size: 32
          ),
          unselectedIconTheme: IconThemeData(
            color:Colors.black12
          ),
          type: BottomNavigationBarType.fixed,
          currentIndex: currentBar,
          onTap: (index){
            print("Current:$index");
            setState(() {
              currentBar=index;
            });
          },
          items: [
            BottomNavigationBarItem(
              title: Text(
                  "Home",
                style: const TextStyle(color: Colors.black),
              ),
              icon: Icon(
                Icons.home
              ),
            ),
            BottomNavigationBarItem(
              title: Text(
                "Search",
                style: const TextStyle(color: Colors.black),
              ),
              icon: Icon(
                  Icons.search
              ),
            ),
            BottomNavigationBarItem(
              title: Text(
                "Profile",
                style: const TextStyle(color: Colors.black),
              ),
              icon: Icon(
                  Icons.person
              ),
            )
          ],
        ),
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            height: height*0.361,
            left: 0,
            right: 0,
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                bottom: const Radius.circular(40)
              ),
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.only(
                  top: 35,left: 32,right: 16,bottom: 10
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ListTile(
                      title: Text(
                        DateFormat("EEEE").format(today)+","+DateFormat("dd MMMM").format(today),
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.w400
                        ),
                      ),
                      subtitle: Text(
                        "Hello ,David",
                        style: TextStyle(
                            fontSize: 24,
                            color: Colors.black,
                            fontWeight: FontWeight.w800
                        ),
                      ),
                      trailing: ClipOval(
                          child: Image.asset("assets/images/user.jpg")
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: <Widget>[
                        _RadialProgress(
                          width:width*0.28,
                          height:width*0.28,
                          progress:7 ,
                        ),
                        SizedBox(
                          width: 10,
                        ),

                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                _IngredientProgress(
                                  ingredient:"Protein",
                                  progress:0.3,
                                  progressColor: Colors.green,
                                  leftAmount: 72,
                                  width: width*0.25,
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                _IngredientProgress(
                                  ingredient:"Carbs",
                                  progress:0.2,
                                  progressColor: Colors.red,
                                  leftAmount: 252,
                                  width: width*0.25,
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                _IngredientProgress(
                                  ingredient:"Fat",
                                  progress:0.1,
                                  progressColor: Colors.yellow,
                                  leftAmount: 61,
                                  width: width*0.25,
                                ),

                              ],
                            ),
                          ),

                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: height*0.37,
            left: 0,
            right: 0,
            child: Container(
              height: height*0.50,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: 8,
                      left: 32,
                      right: 16
                    ),
                    child: Text(
                      "MEALS FOR TODAY",
                      style:const TextStyle(
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.w700,
                        fontSize: 16
                      ),
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 32,
                          right: 20
                        ),
                        child: Row(
                          children:createMealList()
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: OpenContainer(
                      closedElevation: 0,
                      transitionType: ContainerTransitionType.fadeThrough,
                      transitionDuration: const Duration(milliseconds: 400),
                      closedColor: const Color(0xFFE9E9E9),
                      openBuilder: (context,_){
                        return WorkoutPage();
                      },
                      closedBuilder: (context,VoidCallback openContainer){

                        return GestureDetector(
                          onTap: openContainer,
                          child: Container(
                            margin: const EdgeInsets.only(
                                bottom: 10,
                                left: 32,
                                right: 32
                            ),
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(30)
                                ),
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      const Color(0xFF512DA8),
                                      const Color(0xFF4527A0),
                                      const Color(0xFF311B92)
                                    ]
                                )
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 8,
                                      left: 16
                                  ),
                                  child: Text(
                                    "YOUR NEXT WORKOUT",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white70,
                                        fontWeight: FontWeight.w600
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 2,
                                      left: 16
                                  ),
                                  child: Text(
                                    "UPPER BODY",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white70,
                                        fontWeight: FontWeight.w800
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 4),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Container(
                                        padding:const EdgeInsets.all(4),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(25),
                                          color:Color(0xFF5B4D9D),
                                        ),
                                        child: IconButton(

                                          icon: Image.asset("assets/images/chest.png",color: Colors.white,),
                                          onPressed: (){},
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        padding:const EdgeInsets.all(4),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(25),
                                          color:Color(0xFF5B4D9D),
                                        ),
                                        child: IconButton(
                                          icon: Image.asset("assets/images/back.png",color: Colors.white,),
                                          onPressed: (){},
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        padding:const EdgeInsets.all(4),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(25),
                                          color:Color(0xFF5B4D9D),
                                        ),
                                        child: IconButton(

                                          icon: Image.asset("assets/images/biceps.png",color: Colors.white,),
                                          onPressed: (){},
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        padding:const EdgeInsets.all(4),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(25),
                                          color:Color(0xFF5B4D9D),
                                        ),
                                        child: IconButton(

                                          icon: Image.asset("assets/images/chest.png",color: Colors.white,),
                                          onPressed: (){},
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),

                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            )
          )
        ],
      ),

    );
  }

  List<_MealCard> createMealList(){
    List<_MealCard> allMealCard=[];
    for (int i=0;i<meals.length;i++){
      allMealCard.add(_MealCard(meal:meals[i]));
    }
    return allMealCard;
  }
}

class _IngredientProgress extends StatefulWidget{
  final String ingredient;
  final double leftAmount;
  final double progress;
  final double width;
  final Color progressColor;

  const _IngredientProgress({Key key, this.ingredient, this.width,this.leftAmount, this.progress, this.progressColor}) : super(key: key);

  @override
  __IngredientProgressState createState() => __IngredientProgressState();
}

class __IngredientProgressState extends State<_IngredientProgress> with SingleTickerProviderStateMixin{

  AnimationController _animationController;
  Animation<double> _progressAnimation;
  double progressWidth=0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController=AnimationController(
      vsync: this,duration: Duration(milliseconds: 1000)
    );
    _progressAnimation=Tween<double>(
      begin: 0,
      end: widget.progress
    ).animate(CurvedAnimation(
      curve: Curves.easeIn,
      parent: _animationController
    ))..addListener(() {
      setState(() {
        progressWidth=_progressAnimation.value*widget.width;
      });
    });
    _animationController.forward();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
            this.widget.ingredient.toUpperCase(),
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: 10,
                  width: widget.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.black12,
                  ),
                ),
                Container(
                  height: 10,
                  width: progressWidth,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: widget.progressColor,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 10,
            ),
            Flexible(
              fit: FlexFit.tight,
              child: Text(
                "${widget.leftAmount} g left",
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 14,
                  fontWeight: FontWeight.w500
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}

class _RadialProgress extends StatefulWidget {
  final double height,width;
  final double progress;
  const _RadialProgress({Key key,this.height,this.width,this.progress}):super(key:key);

  @override
  __RadialProgressState createState() => __RadialProgressState();
}

class __RadialProgressState extends State<_RadialProgress> with SingleTickerProviderStateMixin {

  AnimationController _animationController;
  Animation<double> progressAnimation;
  double progressDegrees=0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController=AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000)
    );
    progressAnimation=Tween<double>(
      begin: 0,
      end: 360,
    ).animate(CurvedAnimation(
      parent: _animationController,curve: Curves.easeIn
    ))..addListener(() {
      setState(() {
        progressDegrees=(widget.progress/10)*progressAnimation.value;
      });
    });
    _animationController.forward();
  }
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _RadialPainter(degrees:progressDegrees),
      child: Container(
        height: widget.height,
        width: widget.width,
        child: Center(
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: "1731",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF200087)
                  ),
                ),
                TextSpan(
                  text: "\n",
                ),
                TextSpan(
                  text: "kcal left",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color:const Color(0xFF200087)
                  )
                )
              ]
            ),
          ),
        ),
      ),
    );
  }
}

class _RadialPainter extends CustomPainter {
  final double degrees;
  _RadialPainter({this.degrees});
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint=Paint()..strokeWidth=10
    ..color=Color(0xFF200087)
    ..strokeCap=StrokeCap.round
    ..style=PaintingStyle.stroke;
    Offset offset=Offset(size.width/2,size.height/2);
    //canvas.drawCircle(offset,size.width/2, paint);
    canvas.drawArc(
        Rect.fromCircle(center:offset,radius:size.width/2),
        math.radians(0), math.radians(degrees), false, paint);

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {

    return true;
  }
}

class _MealCard extends StatelessWidget {
  final Meal meal;
  const _MealCard({
   Key key,
   this.meal
}):super(key:key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        right: 20,
        bottom: 10
      ),
      child: Material(
        elevation: 4,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Flexible(
              fit: FlexFit.loose,
              child: OpenContainer(
                transitionDuration: Duration(milliseconds: 500),
                closedShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20)
                  )
                ),
                openBuilder: (context,_){
                  return MealDetailScreen(meal: meal,);
                },
                closedBuilder: (context,openContainer){
                  return  GestureDetector(
                    onTap: openContainer,
                    child: ClipRRect(
                      borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20)
                      ),
                      child: Hero(
                        tag: meal.imagePath,
                        child: Image.asset(
                          meal.imagePath,
                          width: 150,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 12
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      meal.mealTime,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.blueGrey
                      ),
                    ),
                    Text(
                        meal.name,
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Colors.black
                        )
                    ),
                    Text(
                        meal.kiloCaloriesBurnt+" kcal",
                        style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.blueGrey
                        )
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.access_time,
                          size: 10,
                          color: Colors.black12,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          meal.timeTaken+" min",
                            style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                                color: Colors.blueGrey
                            )
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 3,
                    )

                  ],
                ),
              ),
            )
          ],

        ),
      ),
    );
  }
}
