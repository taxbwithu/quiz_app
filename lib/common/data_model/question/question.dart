import 'package:quiz_app/common/data_model/answer/answer.dart';

class Question {
  final String question;
  final List<Answer> answerList;
  String? comment;

  Question({
    required this.question,
    required this.answerList,
    this.comment,
  });
}
