import 'package:flutter/material.dart';
import 'package:quize_int/summary_screen.dart';

class QuizScreen extends StatefulWidget {
  final List<Map<String, dynamic>> questions;

  QuizScreen({
    required this.questions,
  });

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentIndex = 0;
  List<String> _selectedAnswers = [];

  @override
  void initState() {
    super.initState();
    _selectedAnswers = List.filled(widget.questions.length, '');
  }

  void onQuizComplete(List<Map<String, dynamic>> questions,
      List<String> selectedAnswers) async {
    int score = 0;
    for (int i = 0; i < questions.length; i++) {
      if (questions[i]['correctAnswer'] == selectedAnswers[i]) {
        score++;
      }
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => QuizSummaryScreen(
          score: score,
          questions: widget.questions,
          answers: _selectedAnswers,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Question ${_currentIndex + 1} of ${widget.questions.length}',
              style: TextStyle(fontSize: 22.0),
            ),
            SizedBox(height: 16.0),
            Text(
              widget.questions[_currentIndex]['question'],
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: widget.questions[_currentIndex]['options'].length,
                itemBuilder: (context, index) {
                  return RadioListTile(
                    title:
                        Text(widget.questions[_currentIndex]['options'][index]),
                    value: widget.questions[_currentIndex]['options'][index],
                    groupValue: _selectedAnswers[_currentIndex],
                    onChanged: (value) {
                      setState(() {
                        _selectedAnswers[_currentIndex] = value;
                      });
                    },
                  );
                },
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              child: Text(_currentIndex == widget.questions.length - 1
                  ? 'Submit'
                  : 'Next'),
              onPressed: () {
                setState(() {
                  if (_currentIndex < widget.questions.length - 1) {
                    _currentIndex++;
                  } else {
                    onQuizComplete(widget.questions, _selectedAnswers);
                  }
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
