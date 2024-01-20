// import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_v3/models/person.dart';

class Certification {
  final String? field;
  final Map<String, List<String>>? agency_certs;

  Certification({this.field, this.agency_certs});
}

List<Certification> _getCertifications() {
  List<Certification> certList = [];

  person!.certifications.forEach((field, agencies) {
    Map<String, List<String>> agency_certs = {};
    agencies.forEach((agencyName, certificateList) {
      List<String> cList = [];
      certificateList.forEach((certificate) => cList.add(certificate));
      agency_certs[agencyName] = cList;
    });
    // debugPrint("Debug: " + field.toString());
    certList.add(
      Certification(field: field, agency_certs: agency_certs),
    );
  });
  return certList;
}

final List<Certification> certifications = _getCertifications();
