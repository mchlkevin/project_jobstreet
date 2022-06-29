class appliedclass {
  final String uidPerson, uidJobVacancy, Status;
  appliedclass(
      {required this.uidPerson,
      required this.uidJobVacancy,
      required this.Status,
      });
  Map<String, dynamic> toJson() {
    return {
      "job-seeker": uidPerson,
      "job-vacancy": uidJobVacancy,
      "status": Status,
      

    };
  }

  factory appliedclass.fromJson(Map<String, dynamic> json) {
    return appliedclass(
        uidPerson: json["job-seeker"],
        uidJobVacancy: json["job-vacancy"],
        Status: json["status"],
        );
  }
}
