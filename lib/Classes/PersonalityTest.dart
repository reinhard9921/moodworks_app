class PersonalityTest {

  int questionNum;
  String question;
  String letter;

  PersonalityTest({int questionNum, String question, String letter}){
    this.questionNum = questionNum;
    this.question = question;
    this.letter = letter;


  }

  factory PersonalityTest.fromJson(Map<String, dynamic> json) {
    return PersonalityTest(
      questionNum: json['QuestionNum'] as int,
      question: json['Question'] as String,
      letter: json['Question_Letter'] as String,
    );

  }
  Map<String, dynamic> toJson() =>
      {
        'QuestionNum': questionNum,
        'Question': question,
        'Question_Letter': letter,
      };
}