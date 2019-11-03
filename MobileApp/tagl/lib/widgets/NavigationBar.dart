import 'package:flutter/material.dart';
import 'package:tagl/pages/Dashboard.dart';
import 'package:tagl/pages/Evaluation.dart';
import 'package:tagl/pages/Leaderboard.dart';
import 'package:tagl/utilities/AppColors.dart';
import 'package:tagl/widgets/FadeInRoute.dart';

class NavigationBar extends StatelessWidget {
  final int page;

  NavigationBar({this.page});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 76,
      decoration: BoxDecoration(color: AppColors.navigationBar),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.of(context)
                  .pushReplacement(FadeInRoute(widget: Dashboard()));
            },
            icon: Icon(Icons.home),
            color: page == 1 ? AppColors.active : Colors.white,
            iconSize: 52,
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).push(FadeInRoute(widget: Evaluation()));
            },
            icon: Icon(Icons.format_list_bulleted),
            color: page == 2 ? AppColors.active : Colors.white,
            iconSize: 52,
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).push(FadeInRoute(widget: Leaderboard()));
            },
            icon: Icon(Icons.assessment),
            color: page == 3 ? AppColors.active : Colors.white,
            iconSize: 52,
          ),
          IconButton(
            onPressed: () => {},
            icon: Icon(Icons.person),
            color: page == 4 ? AppColors.active : Colors.white,
            iconSize: 52,
          )
        ],
      ),
    );
  }
}
