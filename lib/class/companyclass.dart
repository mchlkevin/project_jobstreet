class classCompany {
  final String uid, name, adress, field, description;

  classCompany(
      {required this.uid,
      required this.name,
      required this.adress,
      required this.field,
      required this.description});

  Map<String, dynamic> toJson() {
    return {
      "uid": uid,
      "company-name": name,
      "company-adress": adress,
      "company-field": field,
      "description": description
    };
  }

  factory classCompany.fromJson(Map<String, dynamic> json) {
    return classCompany(
        uid: json['uid'],
        name: json['company-name'],
        adress: json['company-adress'],
        field: json['company-field'],
        description: json['description']);
  }
}
