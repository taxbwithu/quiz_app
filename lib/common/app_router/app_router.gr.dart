// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;

import '../../feature/question/view/question_screen.dart' as _i2;
import '../../feature/topic_picker/view/topic_picker_screen.dart' as _i1;
import '../data_model/question/question.dart' as _i5;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    TopicPickerScreenRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.TopicPickerScreen());
    },
    QuestionScreenRoute.name: (routeData) {
      final args = routeData.argsAs<QuestionScreenRouteArgs>();
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i2.QuestionScreen(questions: args.questions, key: args.key));
    }
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(TopicPickerScreenRoute.name, path: '/'),
        _i3.RouteConfig(QuestionScreenRoute.name, path: '/question-screen')
      ];
}

/// generated route for
/// [_i1.TopicPickerScreen]
class TopicPickerScreenRoute extends _i3.PageRouteInfo<void> {
  const TopicPickerScreenRoute()
      : super(TopicPickerScreenRoute.name, path: '/');

  static const String name = 'TopicPickerScreenRoute';
}

/// generated route for
/// [_i2.QuestionScreen]
class QuestionScreenRoute extends _i3.PageRouteInfo<QuestionScreenRouteArgs> {
  QuestionScreenRoute({required List<_i5.Question> questions, _i4.Key? key})
      : super(QuestionScreenRoute.name,
            path: '/question-screen',
            args: QuestionScreenRouteArgs(questions: questions, key: key));

  static const String name = 'QuestionScreenRoute';
}

class QuestionScreenRouteArgs {
  const QuestionScreenRouteArgs({required this.questions, this.key});

  final List<_i5.Question> questions;

  final _i4.Key? key;

  @override
  String toString() {
    return 'QuestionScreenRouteArgs{questions: $questions, key: $key}';
  }
}
