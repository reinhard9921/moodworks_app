class PersonalityType {

  int perID;
  String heading;
  String description;

  PersonalityType({int perID, String heading, String description}){
    this.perID = perID;
    this.heading = heading;
    this.description = description;


  }

  factory PersonalityType.fromJson(Map<String, dynamic> json) {
    return PersonalityType(
      perID: json['Per_ID'] as int,
      heading: json['Per_Heading'] as String,
      description: json['Per_Description'] as String,
    );

  }
  Map<String, dynamic> toJson() =>
      {
        'Per_ID': perID,
        'Per_Heading': heading,
        'Per_Description': description,
      };
}