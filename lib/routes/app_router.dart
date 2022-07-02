import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_first/blocs/news_detail_bloc/news_detail.dart';
import 'package:flutter_bloc_first/models/index.dart';
import 'package:flutter_bloc_first/pages/count_screen.dart';
import 'package:flutter_bloc_first/pages/home_screen.dart';
import 'package:flutter_bloc_first/pages/news_detail_screen.dart';
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
      case AppRoutes.news_detail:
        final NewsModel newsModel = routeSettings.arguments as NewsModel;
        return MaterialPageRoute(
          builder: (_) => BlocProvider<NewsDetailBloc>(
            create: (context) =>
                NewsDetailBloc(newsModel)..add(LoadNewsDetailEvent()),
            child: NewsDetailScreen(),
          ),
        );
      default:
        return null;
    }
  }
}
