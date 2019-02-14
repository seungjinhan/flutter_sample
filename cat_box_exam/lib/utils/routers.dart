import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Routers<T> extends MaterialPageRoute<T> {
  Routers({
    @required WidgetBuilder builder,
    @required RouteSettings settings,
  }) : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    if (settings.isInitialRoute) {
      return child;
    }
    return super.buildTransitions(context, animation, secondaryAnimation, child);
  }
}
