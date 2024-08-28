import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mobile_monitor_client/pages/others/routemaster.dart';

class CustomPage extends TransitionBuilderPage<void> {
  const CustomPage({required Widget child}) : super(child: child);

  @override
  PageTransition buildPushTransition(BuildContext context) {
    if (kIsWeb) {
      // No push transition on web
      return PageTransition.none;
    }

    // Default Android fade upwards transition on push
    return PageTransition.fadeUpwards;
  }

  @override
  PageTransition buildPopTransition(BuildContext context) {
    if (kIsWeb) {
      // No pop transition on web
      return PageTransition.none;
    }

    // Cupertino transition on pop
    return PageTransition.cupertino;
  }
}
