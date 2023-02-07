import 'package:flutter/material.dart';
import 'questionPool.dart';

QuestionPool questionPool = QuestionPool();

void main() => runApp(const Quizzler());

class Quizzler extends StatelessWidget {
  const Quizzler({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[800],
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 15,
            ),
            child: QuizBody(),
          ),
        ),
      ),
    );
  }
}

class QuizBody extends StatefulWidget {
  const QuizBody({Key? key}) : super(key: key);

  @override
  State<QuizBody> createState() => _QuizBodyState();
}

class _QuizBodyState extends State<QuizBody> {
  List<Icon> iconRow = [];

  void btnPress({required bool userAnswer}) {
    setState(() {
      if (questionPool.getQuestionAnswer() == userAnswer) {
        iconRow.add(const Icon(
          Icons.check,
          color: Colors.green,
        ));
      } else {
        iconRow.add(const Icon(
          Icons.close,
          color: Colors.red,
        ));
      }

      if (!questionPool.nextQ()) {
        iconRow = [];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Center(
            child: Text(
              questionPool.getQuestionText(),
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 24),
              textAlign: TextAlign.center,
            ),
          ),
        ), //Question
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Container(
              color: Colors.green,
              child: TextButton(
                onPressed: () => btnPress(userAnswer: true),
                child: const Text(
                  'True',
                  style: TextStyle(color: Colors.white, fontSize: 32),
                ),
              ),
            ),
          ),
        ), //True button
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Container(
              color: Colors.red,
              child: TextButton(
                onPressed: () => btnPress(userAnswer: false),
                child: const Text(
                  'False',
                  style: TextStyle(color: Colors.white, fontSize: 32),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20,
          child: Row(children: iconRow),
        ) //False button
      ],
    );
  }
}
