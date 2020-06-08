import 'package:flutter/material.dart';
import 'package:flutter_login_design/day24/ui/theme.dart';

import 'common/collapsing_navigation_drawer.dart';
class CollapsingSideBarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: drawerBackgroundColor,
        title: Text("Collapsing Navigation Drawer/Sidebar"),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            color: Colors.white,
          ),
          CollapsingNavigationDrawer(),

        ],
      ),
    );
  }
}
