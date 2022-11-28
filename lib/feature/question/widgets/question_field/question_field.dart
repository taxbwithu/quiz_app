import 'package:flutter/material.dart';

class QuestionField extends StatelessWidget {
  final int questionNumber;
  final String question;

  const QuestionField({
    required this.questionNumber,
    required this.question,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(8.0)
          ),
          border: Border.all(
            width: 1,
            color: Colors.black,
            style: BorderStyle.solid,
          ),
        ),
        child: Center(
          child: Text("$questionNumber. $question"),
        ),
      ),
    );
  }
}
