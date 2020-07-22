class Questions {
  String questionText;
  bool questionCorrect;

  Questions(String qText, bool qCorrect) {
    this.questionText = qText;
    this.questionCorrect = qCorrect;
  }
}

class QuestionBank {
  int questionNumber = 0;

  List<Questions> questionBank = [
    Questions(' There are one thousand years in a CENTURY', false),
    Questions('ANSWER can be used as a noun and a verb', true),
    Questions('The past tense of FIND is FOUND', true),
    Questions('You can use IMPROVE as a noun and as a verb', false),
    Questions('SCARLET is a brilliant red colour', true),
    Questions('The Capital of Canada is Ottawa', true),
    Questions('The Capital of Japan is Kyoto', false),
    Questions('4 * 2 + 3 * 2 = 22', false),
    Questions('The Hunger Game\'s Actress is Jannifer Lawrence', true),
    Questions('There is a burger made with Vegis only', true),
    Questions('Done', true),
  ];

  String getQuestionText() {
    return questionBank[questionNumber].questionText;
  } // getQuestionText()

  bool getQuestionCorrect() {
    return questionBank[questionNumber].questionCorrect;
  } // getQuestionCorrect()

  void nextQuestion() {
    if (questionNumber < questionBank.length - 1) {
      questionNumber++;
    }
  } // nextQuestion()

  bool isFinished() {
    if (questionNumber >= questionBank.length - 1) {
      return true;
    } else {
      return false;
    }
  } // isFinshed()

  void reset() {
    questionNumber = 0;
  }
}
