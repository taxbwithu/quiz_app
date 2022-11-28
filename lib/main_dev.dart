import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quiz_app/app/app.dart';
import 'package:quiz_app/app/environment.dart';

void main() {
  final app = MyApp(
    environment: Environment.dev
  );

  runZonedGuarded(() async {
    runApp(app);
  }, (error,stack) {print(error);});
}