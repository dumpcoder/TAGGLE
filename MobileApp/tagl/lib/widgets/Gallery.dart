import 'package:flutter/material.dart';
import 'package:tagl/utilities/AppColors.dart';

class Gallery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            width: 64,
            height: 64,
            decoration: new BoxDecoration(
              color: AppColors.gray,
              shape: BoxShape.circle,
            ),
          ),
          Container(
            width: 64,
            height: 64,
            decoration: new BoxDecoration(
              color: AppColors.gray,
              shape: BoxShape.circle,
            ),
          ),
          Container(
            width: 64,
            height: 64,
            decoration: new BoxDecoration(
              color: AppColors.gray,
              shape: BoxShape.circle,
            ),
          ),
          Container(
            width: 64,
            height: 64,
            decoration: new BoxDecoration(
              color: AppColors.gray,
              shape: BoxShape.circle,
            ),
          )
        ],
      ),
    );
  }
}
