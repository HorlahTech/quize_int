import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quize_int/Controllers/database_helper.dart';
import 'package:quize_int/Models/students.dart';

class StudentProvider extends ChangeNotifier {
  int? _currentStudentId;
  int get currentStudentId => _currentStudentId!;
  void setCurrentStudentId(int studentId) {
    _currentStudentId = studentId;
    notifyListeners();
  }

//   Future<void> fetchStudentById(int id) async {
//     final studentData = await DatabaseHelper.getData('students', id);
//     Student.toJson();
//     Student.id = studentData['id'];
//     Student.usernam = studentData['username'];
//     Student.password = studentData['password'];
//     Student.score = studentData['score'];
//     notifyListeners();
// }

// ...
}

// class QuizProvider with ChangeNotifier {
//   int _currentQuestion = 0;
//   List<String> _selectedAnswers = List<String>.filled(
//     Question.questions.length,
//     '',
//     growable: true,
//   );
//
//   int get currentQuestion => _currentQuestion;
//   List<String> get selectedAnswers => _selectedAnswers;
//
//   void incrementQuestion() {
//     if (_currentQuestion < Questions.questions.length - 1) {
//       _currentQuestion++;
//       notifyListeners();
//     }
//   }
//
//   void decrementQuestion() {
//     if (_currentQuestion > 0) {
//       _currentQuestion--;
//       notifyListeners();
//     }
//   }
//
//   void setSelectedAnswer(String answer) {
//     _selectedAnswers[_currentQuestion] = answer;
//     notifyListeners();
//   }
//
//   void resetQuiz() {
//     _currentQuestion = 0;
//     _selectedAnswers = List<String>.filled(
//       Question.questions.length,
//       '',
//       growable: true,
//     );
//     notifyListeners();
//   }
// }
class StudentNotifierProvider extends StateNotifier<List<Student>>{
  StudentNotifierProvider():super([]);
void addStudent(Student student) async {
   await DatabaseHelper.insertStudent(student);
  state =  [...state, student];
  print( state);
}
  Future<List<Student>> getAllStudent()async {
  return state = await DatabaseHelper.getStudents() ;
}
}
final studentNotifier = StateNotifierProvider<StudentNotifierProvider, List<Student>>((ref) => StudentNotifierProvider());