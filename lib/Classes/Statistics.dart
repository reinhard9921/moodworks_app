class Statistics {

  int angry;
  int anxious;
  int energetic;
  int sad;
  int happy;
  int tired;

  Statistics({int angry, int anxious, int energetic, int sad, int happy, int tired}){
    this.angry = angry;
    this.anxious = anxious;
    this.energetic = energetic;
    this.sad = sad;
    this.happy = happy;
    this.tired = tired;
  }

  factory Statistics.fromJson(Map<String, dynamic> json) {
    return Statistics(
      angry: json['Angry'] as int,
      anxious: json['Anxious'] as int,
      energetic: json['Energetic'] as int,
      sad: json['Sad'] as int,
      happy: json['Happy'] as int,
      tired: json['Tired'] as int,


    );

  }

}

