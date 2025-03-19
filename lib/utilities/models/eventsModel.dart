import 'dart:convert';

class EventsModel {
  final String id;
  final String title;
  final String date;
  final dynamic location; // Can be String or List<String>
  final String publisherName;
  final List<String> description;
  final String image;
  final String videoURL;
  final String pdfName;
  final int like;

  EventsModel(
      {required this.id,
      required this.title,
      required this.date,
      required this.location,
      required this.publisherName,
      required this.description,
      required this.image,
      required this.videoURL,
      required this.pdfName,
      required this.like});

  factory EventsModel.fromJson(Map<String, dynamic> json) {
    return EventsModel(
        id: json['id'] ?? '',
        title: json['title'] ?? '',
        date: json['date'] ?? '',
        location: json['location'] ?? '',
        publisherName: json['publiserName'] ?? '',
        description: (json['description'] is List)
            ? List<String>.from(json['description'])
            : [json['description'] ?? ''], // Convert to List<String>
        image: (json['image'] == null || json['image'].isEmpty)
            ? "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR2mJy1fJ1xQ2GT2q0k1s4TjGiHpy1nUuAO2w&s"
            : json['image'],
        pdfName: json['pdfName'] ?? '',
        videoURL: json['videoURL'],
        like: json['like'] ?? 0);
  }
}
