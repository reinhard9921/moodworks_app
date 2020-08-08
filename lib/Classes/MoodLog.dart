class MoodLog {

  int moodID;
  int userID;
  int moodInfoID;
  String physicalMood;
  String date;
  String notes;
  String moodDescription;

  MoodLog({int moodID, int userID, int moodInfoID, String physicalMood, String date, String notes, String moodDescription}){
    this.moodID = moodID;
    this.userID = userID;
    this.moodInfoID = moodInfoID;
    this.physicalMood = physicalMood;
    this.date = date;
    this.notes = notes;
    this.moodDescription = moodDescription;

  }

  factory MoodLog.fromJson(Map<String, dynamic> json) {
    return MoodLog(
      moodID: json['Mood_ID'] as int,
      userID: json['User_ID'] as int,
      moodInfoID: json['Mood_Info_ID'] as int,
      physicalMood: json['Physical_Mood'] as String,
      date: json['Date'] as String,
      notes: json['Notes'] as String,
      moodDescription: json['Mood_Descryption'] as String,

    );

  }
  Map<String, dynamic> toJson() =>
      {
        'Mood_ID': moodID,
        'User_ID': userID,
        'Mood_Info_ID': moodInfoID,
        'Physical_Mood': physicalMood,
        'Date': date,
        'Notes': notes,
        'Mood_Descryption': moodDescription,
      };
}