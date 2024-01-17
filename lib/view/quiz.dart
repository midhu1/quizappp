import 'package:flutter/material.dart';
import 'package:quizappp/utils/color_constant.dart';
import 'package:quizappp/view/resultscrn.dart';

import '../utils/database/database.dart';

class MyHome extends StatefulWidget {
  MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  int questionNo = 0;
  int checkValue = 0;
  int score = 0;

  void onTap() {
    if (questionNo == Database.questions.length - 1) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultScreen(score: score),
        ),
      );
    } else {
      questionNo = questionNo + 1;
      print("score = $score");

      
    }

    setState(() {});
  }
  void onprevius (){
    if(questionNo > 0){
      questionNo --;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(top: 100, right: 30, left: 30),
        child: Container(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [Text("${questionNo + 1}/10")],
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                Database.questions[questionNo]["question"],
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 70,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      checkValue = index;
                      if (index == Database.questions[questionNo]["answer"]) {
                        score = score + 1;
                      }
                      setState(() {});
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: checkValue == index
                            ? checkValue ==
                                    Database.questions[questionNo]["answer"]
                                ? colorconstant.correct
                                : colorconstant.wrong
                            : colorconstant.options,
                      ),
                      height: 50,
                      width: 350,
                      child: Center(
                          child: Text(
                        Database.questions[questionNo]["options"][index],
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      )),
                    ),
                  ),
                ),
                itemCount: 4,
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(onPressed: onprevius, child: Text("Previus")),
                  ElevatedButton(onPressed: onTap, child: Text("Next ->")),
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}