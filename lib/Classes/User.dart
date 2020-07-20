class User {

  int userID;
  String firstname;
  String lastname;
  String email;
  String password;
  String age;

  User({int userID, String firstname, String lastname, String email, String password, String age}){
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
      age: json['User_Age'] as String,
    );
  }
  Map<String, dynamic> toJson() =>
      {
        'firstname': firstname,
        'lastname': lastname,
        'email': email,
        'password': password,
        'age': age,
        'userid': userID,
      };



}