import 'package:flutter/material.dart';

class FadeInRoute extends PageRouteBuilder {
  final Widget widget;

  FadeInRoute({this.widget})
      : super(
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return widget;
          },
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child) {
            Animation curve =
                CurvedAnimation(parent: animation, curve: Curves.easeInOut);

            return new FadeTransition(
              opacity: curve,
              child: child,
            );
          },
        );
}
