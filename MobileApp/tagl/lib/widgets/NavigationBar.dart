import 'package:flutter/material.dart';
import 'package:tagl/utilities/AppColors.dart';

class NavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 76,
      decoration: BoxDecoration(
        color: AppColors.navigationBar
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          IconButton(
            onPressed: ()=>{},
            icon: Icon(Icons.home),
            color: AppColors.active,
            iconSize: 52,
          ),
          IconButton(
            onPressed: ()=>{},
            icon: Icon(Icons.format_list_bulleted),
            color: Colors.white,
            iconSize: 52,
          ),
          IconButton(
            onPressed: ()=>{},
            icon: Icon(Icons.assessment),
            color: Colors.white,
            iconSize: 52,
          ),
          IconButton(
            onPressed: ()=>{},
            icon: Icon(Icons.person),
            color: Colors.white,
            iconSize: 52,
          )
          
        ],
      ),
    );
  }
}