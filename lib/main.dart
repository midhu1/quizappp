import 'package:flutter/material.dart';
import 'package:quizappp/view/quiz.dart';

void main(){
  runApp(Quizapp());
}
class Quizapp extends StatelessWidget {
  const Quizapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHome(),
    );
  }
}