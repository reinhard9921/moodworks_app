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


    );

  }
  Map<String, dynamic> toJson() =>
      {

      };
}