import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_first/blocs/nav_bar_bloc/nav_bar_bloc.dart';
import 'package:flutter_bloc_first/blocs/nav_bar_bloc/nav_bar_event.dart';
import 'package:flutter_bloc_first/blocs/nav_bar_bloc/nav_bar_state.dart';
import 'package:flutter_bloc_first/pages/count_screen.dart';
import 'package:flutter_bloc_first/pages/home_screen.dart';
import 'package:flutter_bloc_first/pages/news_screen.dart';
import 'package:flutter_bloc_first/pages/youtube_screen.dart';

class NavBarScreen extends StatefulWidget {
  const NavBarScreen({Key? key}) : super(key: key);

  @override
  State<NavBarScreen> createState() => _NavBarScreenState();
}

class _NavBarScreenState extends State<NavBarScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<NavBarBloc>(
      create: (context) => NavBarBloc(),
      child: BlocBuilder<NavBarBloc, NavBarState>(
        builder: (context, state) {
          final NavBarBloc navBarBloc = BlocProvider.of<NavBarBloc>(context);
          return Scaffold(
            body: navScreen(context, state),
            bottomNavigationBar: BottomNavigationBar(
              iconSize: 30,
              // backgroundColor: Colors.blue,
              currentIndex: state.index,
              onTap: (index) {
                // on tap method here
                // NavBarBloc
                navBarBloc.add(SelectTabEvent(index));
              },
              selectedItemColor: Colors.blue,
              // fixedColor: Colors.black,
              unselectedItemColor: Colors.grey,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.access_alarm),
                  label: "Bấm giờ",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.exposure_sharp),
                  label: "Đếm số",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.newspaper),
                  label: "Tin Tức",
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.youtube_searched_for,
                  ),
                  label: "video",
                )
              ],
            ),
          );
        },
      ),
    );
  }

  navScreen(context, state) {
    if (state is NavBarState) {
      if (state.index == 0) {
        return HomeScreen();
      }
      if (state.index == 1) {
        return CountScreen();
      }
      if (state.index == 2) {
        return NewsScreen();
      }
      if (state.index == 3) {
        return YoutubeScreen();
      }
    }
  }
}
