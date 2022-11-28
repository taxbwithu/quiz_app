import 'package:flutter/cupertino.dart';
import 'package:auto_route/auto_route.dart';

class AppCoordinator {
  popLast<T extends Object?>({
    required BuildContext context,
    T? result,
  }) {
    context.router.pop(result);
  }
}