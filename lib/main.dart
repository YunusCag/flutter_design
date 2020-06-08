import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_design/day10/screens/onboarding_screen.dart';
import 'package:flutter_login_design/day11/custom_side_bar_menu.dart';
import 'package:flutter_login_design/day12/drawing_home_page.dart';
import 'package:flutter_login_design/day14/day14_login_design.dart';
import 'package:flutter_login_design/day15/radial_homepage.dart';
import 'package:flutter_login_design/day16/cirty_info.dart';
import 'package:flutter_login_design/day19/animated_list_home_page.dart';
import 'package:flutter_login_design/day20/swile_wallet_page.dart';
import 'package:flutter_login_design/day21/screen/landing_screen.dart';
import 'package:flutter_login_design/day22/elastic_side_bar_page.dart';
import 'package:flutter_login_design/day24/collapsing_side_bar_page.dart';
import 'package:flutter_login_design/day25/custom_matrix_page_view_screen.dart';
import 'package:flutter_login_design/day26/alarm_app_page.dart';
import 'package:flutter_login_design/day27/parallax_page_view.dart';
import 'package:flutter_login_design/day28/uevento_home_splash_screen.dart';
import 'package:flutter_login_design/day29/liquid_swipe_page.dart';
import 'package:flutter_login_design/day30/foldable_navigation_page.dart';
import 'package:flutter_login_design/day8/splash_screen.dart';
import 'package:flutter_login_design/day9/day9_home_page.dart';
import 'day10/themes/styles.dart';
import 'day13/data_visualization_homepage.dart';
import 'day23/ui/diet_home_page.dart';
import 'day7/day7_login_page.dart';


void main() => runApp(
  DevicePreview(
    enabled: kReleaseMode,
    builder:(context)=>MyApp()
  )
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    /*
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

     */
    return MaterialApp(
      locale: DevicePreview.of(context).locale,
      builder: DevicePreview.appBuilder,
      theme: appTheme().copyWith(
        primaryColor: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    /*
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

     */
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter UI Kit"),
      ),
      body: ListView(
        children: <Widget>[
          ///PageView and Bottom Nav Bar
          ExpansionTile(
            backgroundColor: Colors.amberAccent,
            title: Text(
              "PageView and Bottom Navigation Bar",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w900
              ),
            ),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top:8.0,left: 8,right: 8),
                child: Card(
                  elevation: 0,
                  child: ListTile(
                    trailing: Icon(Icons.arrow_forward_ios,size: 32,color: Colors.orange,),
                    leading: Icon(Icons.account_box,size: 32,color: Colors.blue.withOpacity(0.6),),
                    title:Text("City Info PageView ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),) ,
                    onTap: (){
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context)=>CityInfo()));
                    },
                  ),
                ),
              ),
              Divider(thickness: 1,color: Colors.grey,),
              Padding(
                padding: const EdgeInsets.only(top:8.0,left: 8,right: 8),
                child: Card(
                  elevation: 0,
                  child: ListTile(
                    trailing: Icon(Icons.arrow_forward_ios,size: 32,color: Colors.orange,),
                    leading: Icon(Icons.account_box,size: 32,color: Colors.blue.withOpacity(0.6),),
                    title:Text("Animated Scroll ListView ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),) ,
                    onTap: (){
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context)=>AnimatedListHomePage()));
                    },
                  ),
                ),
              ),
              Divider(thickness: 1,color: Colors.grey,),
              Padding(
                padding: const EdgeInsets.only(top:8.0,left: 8,right: 8),
                child: Card(
                  elevation: 0,
                  child: ListTile(
                    trailing: Icon(Icons.arrow_forward_ios,size: 32,color: Colors.orange,),
                    leading: Icon(Icons.account_box,size: 32,color: Colors.blue.withOpacity(0.6),),
                    title:Text("Parallax PageView ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),) ,
                    onTap: (){
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context)=>ParallaxPageView()));
                    },
                  ),
                ),
              ),
              Divider(thickness: 1,color: Colors.grey,),
              Padding(
                padding: const EdgeInsets.only(top:8.0,left: 8,right: 8),
                child: Card(
                  elevation: 0,
                  child: ListTile(
                    trailing: Icon(Icons.arrow_forward_ios,size: 32,color: Colors.orange,),
                    leading: Icon(Icons.account_box,size: 32,color: Colors.blue.withOpacity(0.6),),
                    title:Text("Curve Bottom Navigation Bar ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),) ,
                    onTap: (){
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context)=>DataVisualizationHomePage()));
                    },
                  ),
                ),
              ),
              Divider(thickness: 1,color: Colors.grey,),
              Padding(
                padding: const EdgeInsets.only(top:8.0,left: 8,right: 8),
                child: Card(
                  elevation: 0,
                  child: ListTile(
                    trailing: Icon(Icons.arrow_forward_ios,size: 32,color: Colors.orange,),
                    leading: Icon(Icons.account_box,size: 32,color: Colors.blue.withOpacity(0.6),),
                    title:Text("3D PageView ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),) ,
                    onTap: (){
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context)=>CustomMatrixPageViewScreen()));
                    },
                  ),
                ),
              ),
            ],

          ),
          Divider(thickness: 1,color: Colors.grey,),
          ///Drawing and Painting Pages
          ExpansionTile(
            backgroundColor: Colors.brown,
            title: Text(
              "Drawing and Painting Pages",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w900
              ),
            ),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top:8.0,left: 8,right: 8),
                child: Card(
                  elevation: 0,
                  child: ListTile(
                    trailing: Icon(Icons.arrow_forward_ios,size: 32,color: Colors.orange,),
                    leading: Icon(Icons.account_box,size: 32,color: Colors.blue.withOpacity(0.6),),
                    title:Text("Drawing the Page",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),) ,
                    onTap: (){
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context)=>DrawingHomePage()));
                    },
                  ),
                ),
              ),
            ],

          ),
          Divider(thickness: 1,color: Colors.grey,),
          ///OnBoarding Pages
          ExpansionTile(
            backgroundColor: Colors.pink,
            title: Text(
              "OnBoarding Pages ",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w900
              ),
            ),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top:8.0,left: 8,right: 8),
                child: Card(
                  elevation: 5,
                  child: ListTile(
                    trailing: Icon(Icons.arrow_forward_ios,size: 32,color: Colors.orange,),
                    leading: Icon(Icons.account_box,size: 32,color: Colors.blue.withOpacity(0.6),),
                    title:Text("Custom OnBoarding",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),) ,
                    onTap: (){
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context)=>OnBoardingScreen()));
                    },
                  ),
                ),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.only(top:8.0,left: 8,right: 8),
                child: Card(
                  elevation: 5,
                  child: ListTile(
                    trailing: Icon(Icons.arrow_forward_ios,size: 32,color: Colors.orange,),
                    leading: Icon(Icons.account_box,size: 32,color: Colors.blue.withOpacity(0.6),),
                    title:Text("Liquid Swipe OnBoarding Page",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),) ,
                    onTap: (){
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context)=>LiquidSwipePage()));
                    },
                  ),
                ),
              ),
            ],
          ),
          Divider(thickness: 1,color: Colors.grey,),
          ///Login Design
          ExpansionTile(
            backgroundColor: Colors.orange,
            title: Text(
              "Login Design",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w900
              ),
            ),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top:8.0,left: 8,right: 8),
                child: Card(
                  elevation: 0,
                  child: ListTile(
                    trailing: Icon(Icons.arrow_forward_ios,size: 32,color: Colors.orange,),
                    leading: Icon(Icons.account_box,size: 32,color: Colors.blue.withOpacity(0.6),),
                    title:Text("Day 7 Design Login Screen",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),) ,
                    onTap: (){
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context)=>Day7LoginPage()));
                    },
                  ),
                ),
              ),
              Divider(thickness: 1,color: Colors.grey,),
              Padding(
                padding: const EdgeInsets.only(top:8.0,left: 8,right: 8),
                child: Card(
                  elevation: 0,
                  child: ListTile(
                    trailing: Icon(Icons.arrow_forward_ios,size: 32,color: Colors.orange,),
                    leading: Icon(Icons.account_box,size: 32,color: Colors.blue.withOpacity(0.6),),
                    title:Text("Day 8 Design Splash and Login Screen",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),) ,
                    onTap: (){
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context)=>SplashScreen()));
                    },
                  ),
                ),
              ),
              Divider(thickness: 1,color: Colors.grey,),
              Padding(
                padding: const EdgeInsets.only(top:8.0,left: 8,right: 8),
                child: Card(
                  elevation: 0,
                  child: ListTile(
                    trailing: Icon(Icons.arrow_forward_ios,size: 32,color: Colors.orange,),
                    leading: Icon(Icons.account_box,size: 32,color: Colors.blue.withOpacity(0.6),),
                    title:Text("Login Design 14 ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),) ,
                    onTap: (){
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context)=>Day14LoginDesign()));
                    },
                  ),
                ),
              ),
            ],

          ),
          Divider(thickness: 1,color: Colors.grey,),
          ///Custom SideMenu
          ExpansionTile(
            backgroundColor: Colors.red.withOpacity(.8),
            title: Text(
              "Custom Side Menu",
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.w900
              ),
            ),
            children: <Widget>[
              Padding(
                padding:const EdgeInsets.only(top:8.0,right: 8,left: 8),
                child: Card(
                  elevation: 0,
                  child: ListTile(
                    trailing: Icon(Icons.arrow_forward_ios,size: 32,color: Colors.orange,),
                    leading: Icon(Icons.account_box,size: 32,color: Colors.blue.withOpacity(0.6),),
                    title:Text("Elastic Side Bar Page",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),) ,
                    onTap: (){
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context)=>ElasticSideBarPage()));
                    },
                  ),
                ),
              ),
              Divider(thickness: 1,color: Colors.grey,),
              Padding(
                padding: const EdgeInsets.only(top:8.0,right: 8,left: 8),
                child: Card(
                  elevation: 0,
                  child: ListTile(
                    trailing: Icon(Icons.arrow_forward_ios,size: 32,color: Colors.orange,),
                    leading: Icon(Icons.account_box,size: 32,color: Colors.blue.withOpacity(0.6),),
                    title:Text("Custom Navigation Drawer",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),) ,
                    onTap: (){
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context)=>CustomSideBarMenu()));
                    },
                  ),
                ),
              ),
              Divider(thickness: 1,color: Colors.grey,),
              Padding(
                padding: const EdgeInsets.only(top:8.0,right: 8,left: 8),
                child: Card(
                  elevation: 0,
                  child: ListTile(
                    trailing: Icon(Icons.arrow_forward_ios,size: 32,color: Colors.orange,),
                    leading: Icon(Icons.account_box,size: 32,color: Colors.blue.withOpacity(0.6),),
                    title:Text("Collapsing Side Menu",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),) ,
                    onTap: (){
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context)=>CollapsingSideBarPage()));
                    },
                  ),
                ),
              ),
              Divider(thickness: 1,color: Colors.grey,),
              Padding(
                padding: const EdgeInsets.only(top:8.0,right: 8,left: 8),
                child: Card(
                  elevation: 0,
                  child: ListTile(
                    trailing: Icon(Icons.arrow_forward_ios,size: 32,color: Colors.orange,),
                    leading: Icon(Icons.account_box,size: 32,color: Colors.blue.withOpacity(0.6),),
                    title:Text("Foldable Navigation SideBar",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),) ,
                    onTap: (){
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context)=>FoldableNavigationPage()));
                    },
                  ),
                ),
              ),
            ],
          ),
          Divider(thickness: 1,color: Colors.grey,),
          ///App Templates
          ExpansionTile(
            backgroundColor: Colors.blue,
            title: Text(
              "App Templates",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w900
              ),
            ),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top:8.0,right: 8,left: 8),
                child: Card(
                  elevation: 0,
                  child: ListTile(
                    trailing: Icon(Icons.arrow_forward_ios,size: 32,color: Colors.orange,),
                    leading: Icon(Icons.account_box,size: 32,color: Colors.blue.withOpacity(0.6),),
                    title:Text("Diet App",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),) ,
                    onTap: (){
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context)=>DietHomePage()));
                    },
                  ),
                ),
              ),
              Divider(thickness: 1,color: Colors.grey,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 0,
                  child: ListTile(
                    trailing: Icon(Icons.arrow_forward_ios,size: 32,color: Colors.orange,),
                    leading: Icon(Icons.account_box,size: 32,color: Colors.blue.withOpacity(0.6),),
                    title:Text("Animal Home App",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),) ,
                    onTap: (){
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context)=>LandingScreen()));
                    },
                  ),
                ),
              ),
              Divider(thickness: 1,color: Colors.grey,),
              Padding(
                padding: const EdgeInsets.only(top:8.0,right: 8,left: 8),
                child: Card(
                  elevation: 0,
                  child: ListTile(
                    trailing: Icon(Icons.arrow_forward_ios,size: 32,color: Colors.orange,),
                    leading: Icon(Icons.account_box,size: 32,color: Colors.blue.withOpacity(0.6),),
                    title:Text("Wallet App",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),) ,
                    onTap: (){
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context)=>SwileWalletPage()));
                    },
                  ),
                ),
              ),
              Divider(thickness: 1,color: Colors.grey,),
              Padding(
                padding: const EdgeInsets.only(top:8.0,left: 8,right: 8),
                child: Card(
                  elevation: 0,
                  child: ListTile(
                    trailing: Icon(Icons.arrow_forward_ios,size: 32,color: Colors.orange,),
                    leading: Icon(Icons.account_box,size: 32,color: Colors.blue.withOpacity(0.6),),
                    title:Text("Cakes Cup Cake",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),) ,
                    onTap: (){
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context)=>Day9HomePage()));
                    },
                  ),
                ),
              ),
              Divider(thickness: 1,color: Colors.grey,),
              Padding(
                padding: const EdgeInsets.only(top:8.0,left: 8,right: 8),
                child: Card(
                  elevation: 0,
                  child: ListTile(
                    trailing: Icon(Icons.arrow_forward_ios,size: 32,color: Colors.orange,),
                    leading: Icon(Icons.account_box,size: 32,color: Colors.blue.withOpacity(0.6),),
                    title:Text("Fitness App ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),) ,
                    onTap: (){
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context)=>RadialHomePage()));
                    },
                  ),
                ),
              ),
              Divider(thickness: 1,color: Colors.grey,),
              Padding(
                padding: const EdgeInsets.only(top:8.0,left: 8,right: 8),
                child: Card(
                  elevation: 0,
                  child: ListTile(
                    trailing: Icon(Icons.arrow_forward_ios,size: 32,color: Colors.orange,),
                    leading: Icon(Icons.account_box,size: 32,color: Colors.blue.withOpacity(0.6),),
                    title:Text("Clock App",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),) ,
                    onTap: (){
                      Navigator.of(context)
                          .pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>AlarmAppPage()),(route)=>true);
                    },
                  ),
                ),
              ),
              Divider(thickness: 1,color: Colors.grey,),
              Padding(
                padding: const EdgeInsets.only(top:8.0,left: 8,right: 8),
                child: Card(
                  elevation: 0,
                  child: ListTile(
                    trailing: Icon(Icons.arrow_forward_ios,size: 32,color: Colors.orange,),
                    leading: Icon(Icons.account_box,size: 32,color: Colors.blue.withOpacity(0.6),),
                    title:Text("Event App",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),) ,
                    onTap: (){
                      Navigator.of(context)
                          .pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>UEvenToSplashScreen()),(route)=>true);
                    },
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          )

        ],
      ),
    );
  }
}


