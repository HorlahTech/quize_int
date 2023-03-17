import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quize_int/database_helper.dart';
import 'package:quize_int/student_provider.dart';

class QuizSummaryScreen extends StatelessWidget {
  final List<Map<String, dynamic>> questions;
  final answers;
  final int score;

  QuizSummaryScreen({
    required this.questions,
    required this.answers,
    required this.score,
  });

  @override
  Widget build(BuildContext context) {
    final studentProvider = Provider.of<StudentProvider>(context);
    final student =
        DatabaseHelper.getDataById(studentProvider.currentStudentId);

    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz Summary'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Student: /////////////{student[\'username\']}',
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(height: 16),
            Text(
              'Score: $score',
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(height: 32),
            Text(
              'Questions and Correct Answers:',
              style: Theme.of(context).textTheme.headline6,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: questions.length,
                itemBuilder: (context, index) {
                  final question = questions[index];
                  final correctAnswer = question[index];
                  final studentAnswer = answers[index];

                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${index + 1}. ${question['question']}',
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(color: Colors.white),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Correct Answer: $correctAnswer',
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(color: Colors.white),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Your Answer: $studentAnswer',
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
