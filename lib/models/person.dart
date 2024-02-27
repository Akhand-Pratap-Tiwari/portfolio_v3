import 'dart:convert';
import 'dart:core';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class Person {
  final String name;
  final int age;
  final String gender;
  // _JsonMap sigma;
  final dynamic projects;
  final Map<String, dynamic> quickLinks;
  final List<dynamic> intro;
  final List<dynamic> hobbies;
  final List<dynamic> expertise;
  final List<dynamic> experiences;
  final List<dynamic> achievements;
  final Map<String, dynamic> education;
  final List<dynamic> technicalSkills;
  final Map<String, dynamic> certifications; //Jjojo

  Person({
    required this.name,
    required this.age,
    required this.gender,
    required this.projects,
    required this.quickLinks,
    required this.intro,
    required this.hobbies,
    required this.expertise,
    required this.experiences,
    required this.achievements,
    required this.education,
    required this.technicalSkills,
    required this.certifications,
  });

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
      name: json['name'],
      age: json['age'],
      gender: json['gender'],
      projects: json['projects'],
      quickLinks: json['quickLinks'],
      intro: json['intro'],
      hobbies: json['hobbies'],
      expertise: json['expertise'],
      experiences: json['experiences'],
      achievements: json['achievements'],
      education: json['education'],
      technicalSkills: json['technicalSkills'],
      certifications: json['certifications'],
    );
  }

  // void display() {
  //   debugPrint(
  //       "${name.runtimeType}\n${age.runtimeType}\n${gender.runtimeType}\n${projects.runtimeType}\n${quickLinks.runtimeType}\n${intro.runtimeType}\n${hobbies.runtimeType}\n${expertise.runtimeType}\n${experiences.runtimeType}\n${achievements.runtimeType}\n${education.runtimeType}\n${technicalSkills.runtimeType}\n${certifications.runtimeType}");
  // }
}

Person? person;

Future<void> loadPerson() async {
  final String response =
      await rootBundle.loadString('assets/json/myProfile.json');
  final data = await json.decode(response);
  person = Person.fromJson(data);
  // person!.display();
}
