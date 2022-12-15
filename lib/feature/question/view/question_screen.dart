import 'package:flutter/material.dart';
import 'package:quiz_app/common/data_model/answer/answer.dart';
import 'package:quiz_app/common/data_model/question/question.dart';
import 'package:quiz_app/feature/question/vm/question_vm.dart';
import 'package:quiz_app/feature/question/widgets/answer_field/answer_field.dart';
import 'package:quiz_app/feature/question/widgets/question_field/question_field.dart';

class QuestionScreen extends StatefulWidget {
  final List<Question> questions;

  const QuestionScreen({
    required this.questions,
    Key? key,
  }) : super(key: key);

  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  late QuestionVm _viewModel;
  int questionNumber = 0;
  int correctAnswers = 0;
  bool revealAnswers = false;
  bool hasMoreQuestions = true;

  @override
  void initState() {
    _viewModel = QuestionVm(questionList: widget.questions);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: _buildQuestionForm(),
        ),
      ),
    );
  }

  Widget _buildQuestionForm() {
    return StreamBuilder<bool>(
      stream: _viewModel.loadedQuestions,
      initialData: false,
      builder: (context, snapshot) {
        final data = snapshot.data;
        if (data == null) {
          return const SizedBox();
        }

        if (data && _viewModel.questions.isEmpty) {
          return const Center(
            child: Text("No Questions left"),
          );
        }

        if (_viewModel.questions.isNotEmpty) {
          return Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 16.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    Text(
                        "Pytania: ${questionNumber + 1}/${_viewModel.questions.length}"),
                    const Spacer(),
                    Text("Poprawne: $correctAnswers")
                  ],
                ),
              ),
              QuestionField(
                questionNumber: questionNumber + 1,
                question: _viewModel.questions[questionNumber].question,
              ),
              Row(
                children: [
                  Expanded(
                    child: AnswerField(
                      answer:
                          _viewModel.questions[questionNumber].answerList[0],
                      questionLetter: "a",
                      showAnswer: revealAnswers,
                      onQuestionTap: (answer) {
                        _handleAnswer(answer);
                      },
                    ),
                  ),
                  Expanded(
                    child: AnswerField(
                      answer:
                          _viewModel.questions[questionNumber].answerList[1],
                      questionLetter: "b",
                      showAnswer: revealAnswers,
                      onQuestionTap: (answer) {
                        _handleAnswer(answer);
                      },
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const Spacer(
                    flex: 1,
                  ),
                  Expanded(
                    flex: 2,
                    child: AnswerField(
                      answer:
                          _viewModel.questions[questionNumber].answerList[2],
                      questionLetter: "c",
                      showAnswer: revealAnswers,
                      onQuestionTap: (answer) {
                        _handleAnswer(answer);
                      },
                    ),
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                ],
              ),
              revealAnswers
                  ? (hasMoreQuestions
                      ? ElevatedButton(
                          onPressed: () {
                            setState(() {
                              revealAnswers = false;
                              questionNumber = questionNumber + 1;
                            });
                          },
                          child: Text("Następne pytanie"))
                      : Text("Brak dalszych pytań"))
                  : const SizedBox(),
              const Spacer(),
              Row(
                children: [
                  TextButton(
                      onPressed: () {
                        setState(() {
                          _viewModel.questions.shuffle();
                          revealAnswers = false;
                          hasMoreQuestions = true;
                          questionNumber = 0;
                          correctAnswers = 0;
                        });
                      },
                      child: Text("Resetuj")),
                  const Spacer(),
                ],
              ),
            ],
          );
        }
        return SizedBox();
      },
    );
  }

  void _handleAnswer(Answer answer) {
    setState(() {
      if (answer.correct) {
        correctAnswers = correctAnswers + 1;
      }
      hasMoreQuestions = questionNumber + 1 < _viewModel.questions.length;
      revealAnswers = true;
    });
  }
}
