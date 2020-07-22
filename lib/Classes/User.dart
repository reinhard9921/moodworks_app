class User {

  int userID;
  String firstname;
  String lastname;
  String email;
  String password;
  int age;

  User({int userID, String firstname, String lastname, String email, String password, int age}){
    this.userID = userID;
    this.firstname = firstname;
    this.lastname = lastname;
    this.email = email;
    this.password = password;
    this.age = age;

  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userID: json['User_ID'] as int,
      firstname: json['First_Name'] as String,
      lastname: json['Last_Name'] as String,
      email: json['Email_Address'] as String,
      password: json['Password'] as String,
      age: json['User_Age'] as int,

    );

  }
  Map<String, dynamic> toJson() =>
      {
        'First_Name': firstname,
        'Last_Name': lastname,
        'Email_Address': email,
        'Password': password,
        'User_Age': age,
        'User_ID': userID,
      };



}