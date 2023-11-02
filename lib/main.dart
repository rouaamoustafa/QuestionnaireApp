import 'package:flutter/material.dart';
import 'ui/question.dart';
import 'app_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

AppBrain appBrain =AppBrain();
void main() {
  runApp(QuestionnaireApp());
}
class QuestionnaireApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Scaffold(//293462
        backgroundColor: Color(0xffF2E3DB),
        appBar: AppBar(
          backgroundColor: Color(0xffF2E3DB),
          title: Text('',
              style: TextStyle(color:Color(0xff263A29))),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Questionnaire(),
        ),

      ),
    );
  }
}

class Questionnaire extends StatefulWidget {
  @override
  State<Questionnaire> createState() => _QuestionnaireState();
}

class _QuestionnaireState extends State<Questionnaire> {
    List<Widget> answerResult = [];
    int rightAnswer = 0;
    void checkAnswer(bool  whatUserPicket){
      bool correctAnswer = appBrain.getQuestionAnswer();

      if(whatUserPicket == correctAnswer)
      {
        rightAnswer++;
        print(appBrain.getQuestionText());//99A98F
        answerResult.add(Padding(
          padding: const EdgeInsets.all(3.0),
          child: Icon(Icons.thumb_up , color:Color(0xff263A29)),
        ));
        print('Write Answer !');

      }else{
        print(appBrain.getQuestionText());
        answerResult.add(Padding(
          padding: const EdgeInsets.all(3.0),
          child: Icon(Icons.thumb_down , color:Colors.red),
        ));
        print('Wrong Answer !') ;}

      setState(() {


        if(appBrain.isFinished()==true){
          Alert(
            context: context,
            type: AlertType.error,
            title: "The Game is finished ",
            desc: "$rightAnswer / 4" ,
            buttons: [
              DialogButton(
                child: Text(
                  "Start Again",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onPressed: () => Navigator.pop(context),
                width: 120,
              )
            ],
          ).show();
         appBrain.reset();
         answerResult =[];
         rightAnswer = 0;
        }else{
          appBrain.nextQuestion();
        }

      });

    }


   // List<String> questions = [
   //   'Is it a Lion ?' ,
   //   'Is it a full moon ?',
   //   'Is it sunny in this picture?',
   //   'There are many trees in this picture ?' ,
   // ];
   // List<String> questionImage = [
   //   'images/images.jpeg',
   //   'images/moon-photo.png',
   //   'images/download.jpeg',
   //   'images/download-2.jpeg',
   // ];
   // List<bool> answers = [
   //   false,
   //   true,
   //   false,
   //   false,
   // ];


   //var quest_number =0;
   //var image_number =0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
           children: answerResult,
        ),
        Expanded  (
          flex: 5,
          child: Column(
          children: [
            Image.asset(
              appBrain.getQuestionImage(),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              appBrain.getQuestionText(),
            textAlign: TextAlign.center,
            style: TextStyle(
                color:Color(0xff263A29),
              fontSize: 24.0,
             ),
            ),
          ],
        ),
       ),
        Expanded(
          flex: 1,
            child:
             Padding(
               padding: const EdgeInsets.symmetric(vertical :10.0),
               child: TextButton (

                 onPressed: () {
                   checkAnswer(true);

                 },
                 child: Text ('yes',
                 style: TextStyle(color:Color(0xff263A29) ,
                   fontSize: 22.0,
                 ),
                 ),
                 style: TextButton.styleFrom(
                   //primary: Colors.purpleAccent,

                   backgroundColor: Color(0xff9CA777), // Background Color
                 ),
               ),
             ),
        ),
        Expanded(
          flex: 1,
          child:
          Padding(
            padding: const EdgeInsets.symmetric(vertical :10.0),
            child: TextButton (
              onPressed: () {
                checkAnswer(false);

              },
              child: Text ('No',
                  style: TextStyle(color:Color(0xff263A29) ,
                  fontSize: 22.0,
                ),
              ),
              style: TextButton.styleFrom(
                //primary: Colors.purpleAccent,
                backgroundColor: Color(0xff9CA777), // Background Color
              ),
            ),
          ),
        ),
      ],
    );
  }
}



