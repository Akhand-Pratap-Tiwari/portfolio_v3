// import 'package:flutter/material.dart';
import 'package:portfolio_v3/models/person.dart';

class Certification {
  final String? field;
  final Map<String, List<String>>? agencyCerts;

  Certification({this.field, this.agencyCerts});
}

List<Certification> _getCertifications() {
  List<Certification> certList = [];

  person!.certifications.forEach((field, agencies) {
    Map<String, List<String>> agencyCerts = {};
    agencies.forEach((agencyName, certificateList) {
      List<String> cList = [];
      certificateList.forEach((certificate) => cList.add(certificate));
      agencyCerts[agencyName] = cList;
    });
    // debugPrint("Debug: " + field.toString());
    certList.add(
      Certification(field: field, agencyCerts: agencyCerts),
    );
  });
  return certList;
}

final List<Certification> certifications = _getCertifications();
