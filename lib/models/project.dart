import 'person.dart';

class Project {
  final String? title, description, gitHubLink;

  Project(
      {required this.title,
      required this.description,
      required this.gitHubLink});
}

List<Project> projects = List.generate(
  person!.projects.length,
  (index) => Project(
    title: person!.projects[index]["name"],
    description: person!.projects[index]["description"],
    gitHubLink: person!.projects[index]["gitHubLink"],
  ),
);