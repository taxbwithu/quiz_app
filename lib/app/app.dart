import 'package:flutter/material.dart';
import 'package:quiz_app/app/environment.dart';
import 'package:quiz_app/common/app_router/app_router.gr.dart';

class MyApp extends StatelessWidget {
  final Environment environment;
  final _appRouter = AppRouter();

  MyApp({
    required this.environment,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildMaterialApp();
  }

  Widget _buildMaterialApp() {
    return MaterialApp.router(
      title: "Quiz app",
      routeInformationProvider: _appRouter.routeInfoProvider(),
      routeInformationParser: _appRouter.defaultRouteParser(),
      routerDelegate: _appRouter.delegate(),
    );
  }
}
