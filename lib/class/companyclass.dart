class classCompany {
  final String uid, adress, field, description;

  classCompany(
      {required this.uid,
      required this.adress,
      required this.field,
      required this.description});

  Map<String, dynamic> toJson() {
    return {
      "uid": uid,
      "company-adress": adress,
      "company-field": field,
      "description": description
    };
  }

  factory classCompany.fromJson(Map<String, dynamic> json) {
    return classCompany(
        uid: json['uid'],
        adress: json['company-adress'],
        field: json['company-field'],
        description: json['description']);
  }
}
