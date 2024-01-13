import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchMyUrl(String uri) async {
    if (!await launchUrl(Uri.parse(uri))) {
      debugPrint("Debug Print: " 'Could not launch $uri');
      throw Exception('Could not launch $uri');
    }
  }




