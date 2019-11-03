import 'package:flutter/material.dart';

class SlideUpRoute extends PageRouteBuilder {
  final Widget widget;

  SlideUpRoute({this.widget})
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

            return new SlideTransition(
              position: new Tween<Offset>(
                begin: const Offset(0.0, 1.0),
                end: Offset.zero,
              ).animate(curve),
              child: child,
            );
          },
        );
}
