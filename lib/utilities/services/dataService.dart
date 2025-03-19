import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:graduate_plus/utilities/models/courseModel.dart';
import 'package:graduate_plus/utilities/models/eventsModel.dart';

class DataService {
  static Future<List<CoursesModel>> fetchCourses() async {
    final String response =
        await rootBundle.loadString('assets/data/courses.json');
    List<dynamic> data = jsonDecode(response);
    return data
        .map((json) => CoursesModel.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  static Future<List<EventsModel>> fetchGraduateEvents() async {
    final String response =
        await rootBundle.loadString('assets/data/graduateEvents.json');
    List<dynamic> data = jsonDecode(response);
    return data
        .map((json) => EventsModel.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  static Future<List<EventsModel>> fetchArtEvents() async {
    final String response =
        await rootBundle.loadString('assets/data/artEvents.json');
    List<dynamic> data = jsonDecode(response);
    return data
        .map((json) => EventsModel.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  static Future<List<EventsModel>> fetchBusinessEvents() async {
    final String response =
        await rootBundle.loadString('assets/data/businessEvents.json');
    List<dynamic> data = jsonDecode(response);
    return data
        .map((json) => EventsModel.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  static Future<List<EventsModel>> fetchWeekEvents() async {
    final String response =
        await rootBundle.loadString('assets/data/weekEvents.json');
    List<dynamic> data = jsonDecode(response);
    return data
        .map((json) => EventsModel.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  static Future<List<EventsModel>> fetchSingleIntroEvent() async {
    final String response =
        await rootBundle.loadString('assets/data/singleIntroEvent.json');
    List<dynamic> data = jsonDecode(response);
    return data
        .map((json) => EventsModel.fromJson(json as Map<String, dynamic>))
        .toList();
  }
}
