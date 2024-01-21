import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../models/project.dart';

Future<void> showMyDialog(BuildContext context, Project project) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: true, // user must tap button!
    builder: (BuildContext context) {
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
        child: AlertDialog(
          backgroundColor: Colors.black.withOpacity(0.8),
          title: Column(
            children: [
              Text(project.title!),
              const Divider(),
            ],
          ),
          content: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 512),
              child: Text(
                project.description!,
                style: const TextStyle(height: 1.5),
              ),
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      );
    },
  );
}
