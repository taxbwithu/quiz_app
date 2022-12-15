import 'package:flutter/cupertino.dart';
import 'package:auto_route/auto_route.dart';
import 'package:quiz_app/common/app_router/app_router.gr.dart';
import 'package:quiz_app/common/data_model/question/question.dart';

class AppCoordinator {
  popLast<T extends Object?>({
    required BuildContext context,
    T? result,
  }) {
    context.router.pop(result);
  }
  
  navigateToTopicPicker({
    required BuildContext context,
}) {
    context.router.replaceAll([const TopicPickerScreenRoute()]);
  }

  navigateToQuestion({
    required BuildContext context,
    required List<Question> questionList,
}) {
    context.router.push(QuestionScreenRoute(questions: questionList));
  }
}