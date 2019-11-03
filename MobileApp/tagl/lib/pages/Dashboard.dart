import 'package:flutter/material.dart';
import 'package:tagl/utilities/AppColors.dart';
import 'package:tagl/widgets/Gallery.dart';
import 'package:tagl/widgets/NavigationBar.dart';
import 'package:tagl/widgets/SearchBox.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  TextEditingController query = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: AppColors.dashBoardGradiant,
          begin: FractionalOffset.topCenter,
          end: FractionalOffset.bottomCenter,
          stops: [0.0, 1.0],
          tileMode: TileMode.repeated,
        )),
        child: SafeArea(
            child: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 76),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Gallery(),
                  Padding(
                    padding: const EdgeInsets.only(left: 8, top: 42, bottom: 28),
                    child: Text(
                      "Modules",
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      //physics: const NeverScrollableScrollPhysics(),
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Container(
                          width: 1.0 / 0.0,
                          height: 198,
                          margin: EdgeInsets.fromLTRB(8, 0, 8, 14),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: AppColors.gray),
                          child: Center(child: Text("module")),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: SearchBox(
                  query: this.query,
                ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: NavigationBar(),
            )
          ],
        )),
      ),
    );
  }
}
