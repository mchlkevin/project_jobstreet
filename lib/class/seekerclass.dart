class classSeeker {
  final String uid, major, fullName, interestOn, domicile;

  classSeeker(
      {required this.uid,
      required this.major,
      required this.fullName,
      required this.interestOn,
      required this.domicile});
  Map<String, dynamic> toJson() {
    return {
      "uid": uid,
      "major-in": major,
      "full-name": fullName,
      "interest-on": interestOn,
      "domicile": domicile
    };
  }

  factory classSeeker.fromJson(Map<String, dynamic> json) {
    return classSeeker(
        uid: json['uid'],
        major: json['major-in'],
        fullName: json['full-name'],
        interestOn: json['interest-on'],
        domicile: json['domicile']);
  }
}
