import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quize_int/questions.dart';
import 'package:quize_int/quize_screen.dart';
import 'package:quize_int/subject_card.dart';

class QuizSubjectsScreen extends StatelessWidget {
  Questions _questions = Questions();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Select Quiz Subjects',
        ),
        elevation: 1,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SubjectCard(
                subject: 'English',
                description: 'Long Text',
                ontap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => QuizScreen(
                                questions: _questions.generalKnowledgeQuestions,
                              )));
                }),
            SizedBox(height: 16.h),
            SubjectCard(
                subject: 'Mathematics',
                description: 'Long Text',
                ontap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => QuizScreen(
                                questions: _questions.mathematicsQuestions,
                              )));
                }),
            SizedBox(height: 16.h),
            SubjectCard(
                subject: 'Flutter',
                description: 'Long Text',
                ontap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => QuizScreen(
                                questions: _questions.generalKnowledgeQuestions,
                              )));
                }),
          ],
        ),
      ),
    );
  }
}
