import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quize_int/QuizeSubjectsScreen.dart';
import 'package:quize_int/student_provider.dart';
import 'package:quize_int/students.dart';
import 'package:quize_int/text_form_field.dart';

import 'database_helper.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() async {
    final username = _usernameController.text;
    final password = _passwordController.text;

    final List<Student> students = await DatabaseHelper.getStudents();

    final student = students.firstWhere(
      (student) => student.username == username && student.password == password,
      orElse: null,
    );

    if (student == null) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Invalid username or password'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } else {
      final studentId = await DatabaseHelper.getStudentByUsernameAndPassword(
          username, password);

      if (studentId != null) {
        final studentProvider =
            Provider.of<StudentProvider>(context, listen: false);
        studentProvider.setCurrentStudentId(studentId.id!);
      }

      print("Login Successfull");
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => QuizSubjectsScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Form'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFields(
                controller: _usernameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your username';
                  }
                  return null;
                },
                obscureText: false,
                labelText: 'Username',
              ),
              SizedBox(height: 16),
              TextFields(
                labelText: 'Password',
                controller: _passwordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
                obscureText: true,
              ),
              SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _login();
                    }
                  },
                  child: Text('Login'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
