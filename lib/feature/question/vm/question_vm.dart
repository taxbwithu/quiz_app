import 'package:csv/csv.dart';
import 'package:flutter/services.dart';
import 'package:quiz_app/common/data_model/answer/answer.dart';
import 'package:quiz_app/common/data_model/question/question.dart';
import 'package:rxdart/rxdart.dart';

class QuestionVm {
  final loadedQuestions = BehaviorSubject<bool>.seeded(false);
  List<Question> questions = [];

  QuestionVm({
    required List<Question> questionList,
}) {
    questions = questionList;
    loadedQuestions.add(true);
  }
}
