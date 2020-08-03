class MoodInfo {

  int moodInfoid;
  String mood;
  String moodDescription;
  String moodColour;

  MoodInfo({int moodInfoid, String mood, String moodDescription, String moodColour}){
    this.moodInfoid = moodInfoid;
    this.mood = mood;
    this.moodDescription = moodDescription;
    this.moodColour = moodColour;
  }

  factory MoodInfo.fromJson(Map<String, dynamic> json) {
    return MoodInfo(
      moodInfoid: json['Mood_Info_ID'] as int,
      mood: json['Mood'] as String,
      moodDescription: json['Mood_Description'] as String,
      moodColour: json['Mood_Colour'] as String,

    );

  }
  Map<String, dynamic> toJson() =>
      {
        'Mood_Info_ID': moodInfoid,
        'Mood': mood,
        'Mood_Description': moodDescription,
        'Mood_Colour': moodColour,
      };
}