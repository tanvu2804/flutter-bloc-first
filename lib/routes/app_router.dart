import 'package:flutter/material.dart';
import 'package:flutter_bloc_first/pages/count_screen.dart';
import 'package:flutter_bloc_first/pages/home_screen.dart';
import 'package:flutter_bloc_first/pages/news_screen.dart';
import 'package:flutter_bloc_first/routes/app_routes.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case "/":
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case AppRoutes.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case AppRoutes.count:
        return MaterialPageRoute(builder: (_) => const CountScreen());
      case AppRoutes.news:
        return MaterialPageRoute(builder: (_) => const NewsScreen());
      default:
        return null;
    }
  }
}
