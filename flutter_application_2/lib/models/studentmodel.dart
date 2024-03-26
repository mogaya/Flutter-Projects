class StudentModel {
  final String sname;
  final String admissionum;
  final String image;
  StudentModel({
    required this.sname,
    required this.admissionum,
    required this.image,
  });
  factory StudentModel.fromJson(Map<String, dynamic> json) {
    return StudentModel(
        sname: json['sname'] ?? '',
        admissionum: json['admissionum'] ?? '',
        image: json['image'] ?? '');
  }
}
