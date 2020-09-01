class PersonalityTestResult {

  int n;
  int a;
  int e;
  int o;
  int c;

  PersonalityTestResult({int n, int a, int e, int o, int c}){
    this.n = n;
    this.a = a;
    this.e = e;
    this.o = o;
    this.c = c;
  }

  factory PersonalityTestResult.fromJson(Map<String, dynamic> json) {
    return PersonalityTestResult(
      n: json['Total_N'] as int,
      a: json['Total_A'] as int,
      e: json['Total_E'] as int,
      o: json['Total_O'] as int,
      c: json['Total_C'] as int,


    );

  }

}

