import 'package:flutter/material.dart';
import 'package:tagl/utilities/AppColors.dart';

class SearchBox extends StatelessWidget {
  final TextEditingController query;
  SearchBox({@required this.query});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      height: 68,
      decoration: BoxDecoration(
        color: AppColors.searchBox,
      ),
      child: Center(
        child: TextField(
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.mic),
              suffixIcon: Icon(
                Icons.search,
              ),
              hintText: "Search for topics and courses",
              hintStyle: TextStyle(color: AppColors.hintText),
              border: InputBorder.none),
        ),
      ),
    );
  }
}
