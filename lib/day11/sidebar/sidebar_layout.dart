import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login_design/day11/bloc/navigation_bloc.dart';
import 'sidebar.dart';
class SideBarLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        BlocBuilder<NavigationBloc,NavigationStates>(
          bloc: BlocProvider.of<NavigationBloc>(context),
          builder: (context,NavigationStates states){
            return states as Widget;
          },
        ),
        SideBar(),
      ],
    );
  }
}
