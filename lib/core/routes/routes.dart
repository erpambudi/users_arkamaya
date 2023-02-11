import 'package:flutter/material.dart';
import 'package:users_arkamaya/presentation/pages/main_page.dart';
import 'package:users_arkamaya/presentation/pages/user_detail_page.dart';

class AppRoutes {
  static MaterialPageRoute<dynamic> routes(RouteSettings settings) {
    switch (settings.name) {
      case MainPage.routeName:
        return MaterialPageRoute(builder: (context) => const MainPage());

      case UserDetailPage.routeName:
        final idUser = settings.arguments as int;

        return MaterialPageRoute(builder: (context) => UserDetailPage(idUser));

      //Unknown page
      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text('Page not found :('),
            ),
          );
        });
    }
  }
}
