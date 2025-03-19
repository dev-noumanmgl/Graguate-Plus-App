class CoursesModel {
  final String id;
  final String title;
  final List<String> description; // Change from String to List<String>
  final String image;
  final String video;
  final String publiserName;
  final int like;

  CoursesModel({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.video,
    required this.publiserName,
    required this.like,
  });

  factory CoursesModel.fromJson(Map<String, dynamic> json) {
    return CoursesModel(
      id: json['id'] ?? '',
      title: json['title'] ?? 'No Title',
      description: List<String>.from(
          json['description'] ?? []), // Convert List<dynamic> to List<String>
      image: (json['image'] == null || json['image'].isEmpty)
          ? "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSCc_wSpbqcroxF8yMcJbCkyaCmUrBVAwXlYQ1MA303_W6teiB2IoPFGRYO5DbKeVD-W3Y&usqp=CAU"
          : json['image'],
      video: json['video'] ?? '',
      publiserName: json['publiserName'] ?? 'Unknown',
      like: json['like'] ?? 0,
    );
  }
}
