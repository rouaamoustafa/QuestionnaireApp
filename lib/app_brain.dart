import 'ui/question.dart';
class AppBrain{

  var _quest_number =0;


  List<Question> _QuestionGroup = [
    Question(
      questionText:'Is it a Lion ?' ,
      questionImage:  'images/images.jpeg' ,
      questionAnswer:false,),

    Question(
      questionText:'Is it a full moon ?' ,
      questionImage: 'images/moon-photo.png' ,
      questionAnswer:true,),

    Question(
      questionText:'Is it sunny in this picture?',
      questionImage:  'images/download.jpeg',
      questionAnswer:false,),

    Question(
      questionText:'There are many trees in this picture ?' ,
      questionImage:  'images/download-2.jpeg' ,
      questionAnswer:false,),

  ];
  void nextQuestion(){
    if(_quest_number < _QuestionGroup.length -1){
      _quest_number ++;
    }
  }
  String getQuestionText(){

    return  _QuestionGroup[_quest_number].questionText;
  }

  String getQuestionImage( ){
    return _QuestionGroup[_quest_number].questionImage;
  }

  bool getQuestionAnswer(){
     return _QuestionGroup[_quest_number].questionAnswer;
  }
  bool isFinished (){
    if(_quest_number >= _QuestionGroup.length-1)
      {return true ;
      }
    else{
      return false;
    }

  }

  void reset(){
    _quest_number = 0;
  }

}