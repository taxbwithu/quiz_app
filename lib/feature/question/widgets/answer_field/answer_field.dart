import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/common/data_model/answer/answer.dart';

class AnswerField extends StatefulWidget {
  final Answer answer;
  final bool showAnswer;
  final String questionLetter;
  final Function(Answer) onQuestionTap;

  const AnswerField({
    required this.answer,
    this.showAnswer = false,
    required this.questionLetter,
    required this.onQuestionTap,
    Key? key,
  }) : super(key: key);

  @override
  _AnswerFieldState createState() => _AnswerFieldState();
}

class _AnswerFieldState extends State<AnswerField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: InkWell(
        onTap: () {
          if (widget.showAnswer == true) {
            return;
          } else {
            widget.onQuestionTap(widget.answer);
          }
        },
        child: Container(
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            border: Border.all(
              width: 1,
              color: Colors.black,
              style: BorderStyle.solid,
            ),
            color: widget.showAnswer
                ? (widget.answer.correct ? Colors.greenAccent : Colors.redAccent)
                : Colors.white,
          ),
          child: Center(
            child: Text("${widget.questionLetter}) ${widget.answer.value}"),
          ),
        ),
      ),
    );
  }
}
