import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login_design/day11/pages/my_account_page.dart';
import 'package:flutter_login_design/day11/pages/my_orders_page.dart';
import 'package:flutter_login_design/day11/pages/sidebar_home_page.dart';
import 'package:flutter_login_design/main.dart';
enum NavigationEvents{
  HomePageClickedEvent,
  MyAccountClickedEvent,
  MyOrdersClickedEvent
}
abstract class NavigationStates{}
class NavigationBloc extends Bloc<NavigationEvents,NavigationStates>{
  @override
  // TODO: implement initialState
  NavigationStates get initialState => SideBarHomePage();

  @override
  Stream<NavigationStates> mapEventToState(NavigationEvents event) async*{

    switch(event){
      case NavigationEvents.HomePageClickedEvent:
        yield SideBarHomePage();
        break;
      case NavigationEvents.MyAccountClickedEvent:
        yield MyAccountPage();
        break;
      case NavigationEvents.MyOrdersClickedEvent:
        yield MyOrdersPage();
        break;
    }


  }

}