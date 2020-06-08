import 'package:flutter/material.dart';
import 'package:foldable_sidebar/foldable_sidebar.dart';
import 'package:swipedetector/swipedetector.dart';
class FoldableNavigationPage extends StatefulWidget {

  @override
  _FoldableNavigationPageState createState() => _FoldableNavigationPageState();
}

class _FoldableNavigationPageState extends State<FoldableNavigationPage> {
  FSBStatus status;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;
    return Scaffold(
      body:SwipeDetector(
        onSwipeRight: (){
          setState(() {
            status=FSBStatus.FSB_OPEN;
          });
        },
        onSwipeLeft: (){
          setState(() {
            status=FSBStatus.FSB_CLOSE;
          });

        },
        child: FoldableSidebarBuilder(
          drawerBackgroundColor: Colors.orange.withOpacity(.6),
          screenContents: Container(
            color: Colors.red,
            child: Center(
              child: Text(
                "Home Page",
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.black,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),

          status: status,
          drawer: CustomDrawer(height: height,width: width*0.6,),
        ),
      ) ,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          setState(() {
            status=status==FSBStatus.FSB_OPEN?FSBStatus.FSB_CLOSE:FSBStatus.FSB_OPEN;
          });
        },
        child: Icon(
          Icons.menu,color: Colors.black,
        ),

      ),
    );
  }
}

class CustomDrawer extends StatelessWidget {

  final double height;
  final double width;
  const CustomDrawer({
    Key key,
    @required this.height, @required this.width,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return Container(
      height: height,
      width: width,
      color: Colors.white,
      child: ListView(
        children: <Widget>[
          Container(
            color: Colors.grey.withOpacity(0.2),
            padding: EdgeInsets.symmetric(vertical: 20,horizontal: 20),
            child: Center(
              child: CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage(
                    "assets/images/switzerland.jpg",
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ListTile(
            onTap: (){},
            leading: Icon(
              Icons.account_circle,
              size: 32,
              color: Colors.grey,
            ),
            title: Text(
              "Your Profile",
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
                fontWeight: FontWeight.w500
              ),
            ),
          ),
          Divider(thickness: 1,),
          ListTile(
            onTap: (){},
            leading: Icon(
              Icons.settings,
              size: 32,
              color: Colors.grey,
            ),
            title: Text(
              "Settings",
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500
              ),
            ),
          ),
          Divider(thickness: 1,),
          ListTile(
            onTap: (){},
            leading: Icon(
              Icons.payment,
              size: 32,
              color: Colors.grey,
            ),
            title: Text(
              "Payments",
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500
              ),
            ),
          ),
          Divider(thickness: 1,),
          ListTile(
            onTap: (){},
            leading: Icon(
              Icons.notifications,
              size: 32,
              color: Colors.grey,
            ),
            title: Text(
              "Notifications",
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500
              ),
            ),
          ),
          Divider(thickness: 1,),
          ListTile(
            onTap: (){},
            leading: Icon(
              Icons.exit_to_app,
              size: 32,
              color: Colors.grey,
            ),
            title: Text(
              "Log Out",
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500
              ),
            ),
          ),
          Divider(thickness: 1,)
        ],
      ),
    );
  }
}