import 'package:flutter/material.dart';
import 'package:tagl/pages/Sim.dart';
import 'package:tagl/utilities/AppColors.dart';
import 'package:tagl/utilities/FontStyles.dart';
import 'package:tagl/widgets/BlueButton.dart';
import 'package:tagl/widgets/NavigationBar.dart';
import 'package:tagl/widgets/SlideUpRoute.dart';

class Leaderboard extends StatefulWidget {
  @override
  LeaderboardState createState() => LeaderboardState();
}

Widget _buildEmployeeRow(int place, String name, String points) {
  return Container(
    padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
    height: 80,
    child: Row(
      children: <Widget>[
        Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        "https://www.woolha.com/media/2019/06/buneary.jpg")))),
        Expanded(
            child: Container(
                child: Text("$place. $name", style: FontStyles.paragraph))),
        Container(child: Text(points, style: FontStyles.paragraph))
      ],
    ),
  );
}

class LeaderboardState extends State<Leaderboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: DefaultTabController(
      length: 2,
      child: Scaffold(
          body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment(0, -1),
                end: Alignment(0, 1),
                colors: AppColors.dashBoardGradiant)),
        alignment: Alignment(0, 0),
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                    margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    alignment: Alignment(0, 0),
                    height: 120,
                    child: Text("Leaderboard", style: FontStyles.heading2)),
                _buildEmployeeRow(1, "Kylie J", "1200"),
                _buildEmployeeRow(2, "Michael E", "1100"),
                _buildEmployeeRow(3, "Claire W", "1000"),
                _buildEmployeeRow(4, "Elvis C", "750"),
                _buildEmployeeRow(5, "Brad C", "550"),
                _buildEmployeeRow(6, "John S", "350"),
              ],
            ),
            Positioned(
                left: 36,
                top: 48,
                child: Container(
                  height: 58,
                  width: 58,
                  decoration: BoxDecoration(
                      color: Color(0x40f8f8fc),
                      borderRadius: BorderRadius.circular(58)),
                )),
            Positioned(
                left: 6,
                bottom: 93,
                child: Container(
                  height: 146,
                  width: 146,
                  decoration: BoxDecoration(
                      color: Color(0x40f8f8fc),
                      borderRadius: BorderRadius.circular(146)),
                )),
            Positioned(
                bottom: 0, right: 0, left: 0, child: NavigationBar(page: 3))
          ],
        ),
      )),
    ));
  }
}
