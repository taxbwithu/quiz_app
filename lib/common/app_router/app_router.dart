import 'package:auto_route/auto_route.dart';
import 'package:quiz_app/feature/question/view/question_screen.dart';
import 'package:quiz_app/feature/topic_picker/view/topic_picker_screen.dart';

@MaterialAutoRouter(
  replaceInRouteName: "Page,Route,Screen",
  routes: <AutoRoute>[
    AutoRoute(page: TopicPickerScreen, initial: true),
    AutoRoute(page: QuestionScreen),
  ]
)
class $AppRouter {}