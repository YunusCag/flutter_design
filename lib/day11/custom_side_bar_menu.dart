import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login_design/day11/bloc/navigation_bloc.dart';
import 'package:flutter_login_design/day11/sidebar/sidebar_layout.dart';
class CustomSideBarMenu extends StatefulWidget {
  @override
  _CustomSideBarMenuState createState() => _CustomSideBarMenuState();
}

class _CustomSideBarMenuState extends State<CustomSideBarMenu> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<NavigationBloc>(
      create: (context)=>NavigationBloc(),
      child: Scaffold(
        body: SideBarLayout(),

      ),
    );
  }
}
