import 'package:auto_route/auto_route.dart';
import 'package:quiz_app/feature/question/view/question_screen.dart';

@MaterialAutoRouter(
  replaceInRouteName: "Page,Route,Screen",
  routes: <AutoRoute>[
    AutoRoute(page: QuestionScreen, initial: true),
  ]
)
class $AppRouter {}