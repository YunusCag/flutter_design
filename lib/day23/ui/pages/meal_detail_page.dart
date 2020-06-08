import 'package:flutter/material.dart';
import 'package:flutter_login_design/day23/model/meal.dart';

class MealDetailScreen extends StatelessWidget {
  final Meal meal;

  const MealDetailScreen({Key key, this.meal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE9E9E9),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            floating: true,
            snap: true,
            backgroundColor: Color(0xFF200087),
            expandedHeight: 300,
            shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(40))),
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: meal.imagePath,
                child: ClipRRect(
                  borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(40)
                  ),
                  child: Image.asset(
                    meal.imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SizedBox(height: 20,),
                ListTile(
                  title: Text(
                    meal.mealTime.toUpperCase(),
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.w800
                    ),
                  ),
                  subtitle: Text(
                    meal.name,
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                        fontWeight: FontWeight.w800
                    ),
                  ),
                  trailing: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                     Row(
                       mainAxisSize: MainAxisSize.min,
                       children: <Widget>[
                         SizedBox(width: 20,),
                         Text(
                           "${meal.kiloCaloriesBurnt} kcal",
                           style: TextStyle(
                             color: Colors.grey,
                             fontWeight: FontWeight.w600,
                             fontSize: 16
                           ),
                         ),
                       ],
                     ),
                      SizedBox(
                        height: 4,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Icon(
                            Icons.access_time,
                            color: Colors.grey,
                            size: 20,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "${meal.timeTaken} mins",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    "INGRADIENTS",
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.w800
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: createMealTexts(),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    "Preparation".toUpperCase(),
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.w800
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16,right: 16,bottom: 32),
                  child: Text(
                    "${meal.preparation}",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                ),
              ]
            ),
          )
        ],
      ),
    );
  }
  List<Widget> createMealTexts(){
    List<Widget> allMealTexts=[];
    for (int i=0;i<meal.ingredients.length;i++){
      allMealTexts.add(
          Padding(
            padding: EdgeInsets.only(bottom: 4),
            child: Text(
              "${meal.ingredients[i]}",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.w500
              ),
            ),
          )
      );
    }
    return allMealTexts;
  }
}
