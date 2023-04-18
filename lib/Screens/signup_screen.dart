import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quize_int/Screens/quize_screen.dart';

import '../Controllers/database_helper.dart';
import '../Controllers/student_provider.dart';
import '../Models/students.dart';
import '../constants.dart';
import '../widgets/text_form_field.dart';
import 'QuizeSubjectsScreen.dart';
import 'login_screen.dart';
class MyHomePage extends ConsumerWidget {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final DatabaseHelper _databaseHelper = DatabaseHelper();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: defaultPagePading,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hi, Welcome, \nCreate an account",
                    style: headerTextStyle,
                  ),
                  SizedBox(height: 25.h),
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Username',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        TextFields(
                          controller: _usernameController,
                          labelText: 'Username',
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter a username';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20.h),
                        Text(
                          'Password',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        TextFields(
                          controller: _passwordController,
                          obscureText: true,
                          labelText: 'Password',
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter a password';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20.h),
                        Text(
                          'Confirm Password',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        TextFields(
                          controller: _confirmPasswordController,
                          labelText: 'Password',
                          obscureText: true,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please confirm your password';
                            } else if (value != _passwordController.text) {
                              return 'Passwords do not match';
                            }
                            return null;
                          },
                        ),

                        TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (_) => LoginScreen()));
                            },
                            child: Text('Already have an account, Log in')),
                        // Expanded(child: SizedBox.shrink()),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                Student student = Student(
                                  username: _usernameController.text,
                                  password: _passwordController.text,
                                  score: 0,
                                );
                                // await DatabaseHelper.insertStudent(student);
                                ref.read(studentNotifier.notifier).addStudent(student);
                                var all = await ref.watch(studentNotifier.notifier).getAllStudent();
                                debugPrint(all.toString());
                                student.id;

                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => QuizSubjectsScreen()));
                              }
                            },
                            child: Text('Register'),
                          ),
                        ),


                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}