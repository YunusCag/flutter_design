import 'package:flutter/material.dart';
import 'package:flutter_login_design/day23/model/upper_body_workout.dart';
import 'package:intl/intl.dart';
class WorkoutPage extends StatelessWidget {
  final today=DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color(0xFF200087),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top:16.0),
                child: IconButton(
                  icon: Icon(Icons.close,size: 40,color: Colors.white,),
                  onPressed: (){
                    Navigator.of(context).pop();
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ListTile(
                title: Text(
                  DateFormat("EEEE").format(today)+","+DateFormat("d MMMM").format(today),
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w400
                  ),
                ),
                subtitle: Text(
                  "Upper Body",
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.w800
                  ),
                ),
                trailing: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Icon(
                          Icons.access_time,
                          size: 20,
                          color: Colors.white30,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "60 mins",
                          style: TextStyle(
                            color: Colors.white30,
                            fontSize: 16
                          ),
                        )
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
                          Icons.new_releases,
                          color: Colors.white30,
                          size: 20,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "60 mins",
                          style: TextStyle(
                              color: Colors.white30,
                              fontSize: 16
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                children: createUpperBodyList(),

              )

            ],
          ),
        ),
      ),
    );
  }
  List<Widget> createUpperBodyList(){
    List<Widget> allUpperBody=[];
    for (int i=0;i<upperBody.length;i++){
      allUpperBody.add(
        Column(
          children: <Widget>[
            Column(
              children: createListTile(i),
            ),
            SizedBox(
              height: 30,
            )
          ],

        )
      );
    }
    return allUpperBody;
  }
  List<Widget> createListTile(int i){
    List<Widget> allListTile=[];
    for(int j=0;j<upperBody[i].length;j++){
      allListTile.add(
        ListTile(
          leading: Container(
            margin: EdgeInsets.only(bottom: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color(0xFF5B4D9D)
            ),
            padding: const EdgeInsets.all(6),
            child: Image.asset(
              upperBody[i][j].imagePath,
              width: 40,
              height: 40,
              color: Colors.white,
            ),
          ),
          title:Text(
            upperBody[i][j].name,
            style: TextStyle(
              fontSize: 22,
              color: Colors.white,
              fontWeight: FontWeight.w600
            ),
          ),
          subtitle:Text(
              upperBody[i][j].instruction,
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.white70,
                fontWeight: FontWeight.w400
              ),
            ),

        )
      );
    }
    return allListTile;

  }
}
