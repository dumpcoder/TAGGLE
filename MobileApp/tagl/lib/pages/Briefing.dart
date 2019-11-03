import 'package:flutter/material.dart';
import 'package:tagl/pages/Sim.dart';
import 'package:tagl/utilities/AppColors.dart';
import 'package:tagl/utilities/FontStyles.dart';
import 'package:tagl/widgets/BlueButton.dart';
import 'package:tagl/widgets/SlideUpRoute.dart';

class Briefing extends StatefulWidget {
  @override
  _BriefingState createState() => _BriefingState();
}

class _BriefingState extends State<Briefing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment(0, 0),
        child: Container(
          child: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                backgroundColor: AppColors.gray,
                leading: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Icon(
                      Icons.keyboard_arrow_down,
                      size: 74,
                    )),
                expandedHeight: 283,
                flexibleSpace: Center(
                  child: Icon(
                    Icons.play_circle_filled,
                    size: 94,
                    color: Colors.white,
                  ),
                ),
                floating: true,
              ),
              SliverToBoxAdapter(
                  child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Container(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 100),
                      constraints: BoxConstraints(minHeight: 490),
                      alignment: Alignment(0, 1),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: AppColors.dashBoardGradiant,
                              begin: FractionalOffset.topCenter,
                              end: FractionalOffset.bottomCenter)),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Container(
                              padding: EdgeInsets.fromLTRB(18, 20, 18, 30),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Center(
                                      child: Text("1A. Samsung Galaxy S10",
                                          style: FontStyles.heading1)),
                                  Padding(
                                    padding: EdgeInsets.all(15),
                                  ),
                                  Text(
                                    "The newly released Samsung Galaxy S10 has a known issue with malfunctioning fingerprint recognition. A customer calls in saying they are having this known issue with the product.",
                                    style: FontStyles.paragraph,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(15),
                                  ),
                                  Text(
                                      "You are to apologize politely to the customer for this issue and thank them for their patience. Then, tell them with confidence that Samsung aims to provide excellent customer service and is working to fix the issue. Lastly, advise the customer to use Samsung authorized accessories only in the meantime.",
                                      style: FontStyles.paragraph),
                                  Padding(
                                    padding: EdgeInsets.all(15),
                                  ),
                                  Text(
                                    "Click here for a transcript of video.",
                                    style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        color: Colors.white),
                                  )
                                ],
                              )),
                          BlueButton(
                              text: "Record Answer",
                              callback: () {
                                Navigator.of(context)
                                    .push(SlideUpRoute(widget: Sim()));
                              }),
                        ],
                      ))
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
