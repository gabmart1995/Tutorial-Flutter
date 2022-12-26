import 'package:flutter/material.dart';
import 'package:fl_components/models/models.dart';
import 'package:fl_components/screens/screens.dart';

class AppRoutes {

  static final menuOptions = <MenuOption>[
    /*MenuOption(
      route: 'home', 
      name: 'Home Screen', 
      screen: const HomeScreen(),
      icon: Icons.home, 
    ),*/

    MenuOption(
      route: 'listview1', 
      name: 'List view type 1',
      screen: const ListView1Screen(),
      icon: Icons.list, 
    ),
    
    MenuOption(
      route: 'listview2', 
      name: 'List view type 2',
      screen: const ListView2Screen(),
      icon: Icons.list_alt, 
    ),
    
    MenuOption(
      route: 'card', 
      name: 'Card Screen', 
      screen: const CardScreen(),
      icon: Icons.card_giftcard, 
    ),
    
    MenuOption(
      route: 'alert', 
      name: 'Alert Screen', 
      screen: const AlertScreen(),
      icon: Icons.add_alert_outlined, 
    ),

    MenuOption(
      route: 'avatar',
      name: 'Avatar Screen',
      screen: const AvatarScreen(),
      icon: Icons.supervised_user_circle_outlined,
    ),
    
    MenuOption(
        route: 'animated',
        icon: Icons.play_circle_outline,
        name: 'Animated Screen',
        screen: const AnimatedScreen()
    ),

    MenuOption(
      route: 'inputs',
      name: 'Inputs Screen',
      screen: const InputScreen(),
      icon: Icons.ice_skating_sharp
    )
  ];

  static const initialRoute = 'home';
  
  /*static Map<String, Widget Function(BuildContext)> routes = {
    'home': (BuildContext context) => const HomeScreen(),
    'listview1': (BuildContext context) => const ListView1Screen(),
    'listview2': (BuildContext context) => const ListView2Screen(),
    'card': (BuildContext context) => const CardScreen(),
    'alert': (BuildContext context) => const AlertScreen(),
  };*/

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    
    Map<String, Widget Function(BuildContext)> appRoutes = {};

    appRoutes.addAll({
      'home': ( BuildContext context ) => const HomeScreen(),
    });

    for (final option in menuOptions) {
      appRoutes.addAll({
        option.route: ( BuildContext context ) => option.screen  
      });
    }
    
    return appRoutes;
  }

  static Route<dynamic> onGenerateRoute( RouteSettings config ) {
    return MaterialPageRoute(builder: (BuildContext context) => const AlertScreen());
  }
}