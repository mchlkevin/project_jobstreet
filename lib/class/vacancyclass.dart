class classvacancy {
  final String uid, companyName, gaji, jenisPekerjaan, namaPekerjaan, lokasi, minimumEdukasi;
  final List jobDescription, kualifikasi, skills;
  classvacancy(
      {required this.uid,
      required this.companyName,
      required this.jobDescription,
      required this.gaji,
      required this.jenisPekerjaan,
      required this.namaPekerjaan,
      required this.kualifikasi,
      required this.lokasi,
      required this.minimumEdukasi,
      required this.skills
      });
  Map<String, dynamic> toJson() {
    return {
      "uid": uid,
      "company-name": companyName,
      "deskripsi-pekerjaan": jobDescription,
      "gaji": gaji,
      "jenis-pekerjaan": jenisPekerjaan,
      "job-name": namaPekerjaan,
      "kualifikasi": kualifikasi,
      "lokasi": lokasi,
      "minimum-education": minimumEdukasi,
      "skills": skills

    };
  }

  factory classvacancy.fromJson(Map<String, dynamic> json) {
    return classvacancy(
        uid: json["uid"],
        companyName: json["company-name"],
        jobDescription: json["jenis-pekerjaan"],
        gaji: json["gaji"],
        jenisPekerjaan: json["jenis-pekerjaan"],
        namaPekerjaan: json["job-name"],
        kualifikasi: json["kualifikasi"],
        lokasi: json["lokasi"],
        minimumEdukasi: json["minimum-education"],
        skills: json["skills"]);
  }
}
