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

}