import 'package:flutter/material.dart';
import 'package:flutter_login_design/day11/bloc/navigation_bloc.dart';
class MyOrdersPage extends StatelessWidget with NavigationStates {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          "My Orders Page",
          style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.black
          ),
        ),
      ),

    );
  }
}
