class CalandarClass {

  String id;
  String printd;

  CalandarClass({String id, String printd,}){
    this.id = id;
    this.printd = printd;


  }

  factory CalandarClass.fromJson(Map<String, dynamic> json) {
    return CalandarClass(
      id: json['id'] as String,
      printd: json['printd'] as String,
    );

  }
  Map<String, dynamic> toJson() =>
      {
        'id': id,
        'printd': printd,
      };
}