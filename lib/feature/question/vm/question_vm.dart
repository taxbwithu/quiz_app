import 'package:csv/csv.dart';
import 'package:flutter/services.dart';
import 'package:quiz_app/common/data_model/answer/answer.dart';
import 'package:quiz_app/common/data_model/question/question.dart';
import 'package:rxdart/rxdart.dart';

class QuestionVm {
  final loadedQuestions = BehaviorSubject<bool>.seeded(false);
  List<Question> questions = [];

  Future loadInitialData() async {
    final myData = await rootBundle.loadString('assets/questions/data.csv');
    List<List<dynamic>> rowsAsListOfValues =
        const CsvToListConverter().convert(myData, fieldDelimiter: ";");
    for (var i = 0; i < rowsAsListOfValues.length; i = i + 5) {
      final answerList = [
        Answer(
          value: rowsAsListOfValues[i + 1][0],
          correct: isCorrect(rowsAsListOfValues[i + 1][1]),
        ),
        Answer(
          value: rowsAsListOfValues[i + 2][0],
          correct: isCorrect(rowsAsListOfValues[i + 2][1]),
        ),
        Answer(
          value: rowsAsListOfValues[i + 3][0],
          correct: isCorrect(rowsAsListOfValues[i + 3][1]),
        ),
      ];
      answerList.shuffle();
      if (i + 4 == rowsAsListOfValues.length) {
        questions.add(
          Question(
            question: rowsAsListOfValues[i][0],
            answerList: answerList,
          ),
        );
        break;
      }
      questions.add(
        Question(
          question: rowsAsListOfValues[i][0],
          answerList: answerList,
          comment: rowsAsListOfValues[i + 4][0],
        ),
      );
    }
    questions.shuffle();
    loadedQuestions.add(true);
  }

  bool isCorrect(int value) => value == 1;
}
