
import 'package:flutter/material.dart';

import '../../../models/certification.dart';
import '../../../../univ_constants.dart';

class CertificationCard extends StatelessWidget {
  const CertificationCard({
    Key? key,
    required this.certification,
  }) : super(key: key);

  final Certification certification;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      width: 400,
      padding: const EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        boxShadow: defaultBoxShadow,
        borderRadius: BorderRadius.circular(defaultRadius),
        gradient: LinearGradient(
          colors: [Colors.deepPurpleAccent.withOpacity(0.3), Colors.teal.withOpacity(0.7)],
          stops: const [0.35, 0.75],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            certification.field!,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          ...List.generate(
            certification.agencyCerts!.length,
            (index) => AgencyAndCertificateList(
              agency: certification.agencyCerts!.keys.toList()[index],
              certificateList:
                  certification.agencyCerts!.values.toList()[index],
            ),
          )
        ],
      ),
    );
  }
}

class AgencyAndCertificateList extends StatelessWidget {
  final String agency;
  final List<String> certificateList;

  const AgencyAndCertificateList({
    super.key,
    required this.agency,
    required this.certificateList,
  });

  @override
  Widget build(BuildContext context) {
    final List<Widget> certWidList = List.generate(
      certificateList.length,
      (index) => Text(
        certificateList[index],
        // maxLines: 4,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(height: 1.5, color: Colors.white70),
      ),
    );
    return LayoutBuilder(
      builder: (context, constraints) => Container(
        width: constraints.maxWidth,
        padding: const EdgeInsets.all(defaultPadding / 2),
        margin: const EdgeInsets.only(top: defaultPadding),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(defaultRadius / 2),
          color: Colors.black,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // const SizedBox(height: defaultPadding),
            Text(
              agency,
              style: const TextStyle(color: Colors.cyanAccent),
            ),
            const SizedBox(height: 5),
            // Divider(color: Colors.white54,),
            ...certWidList,
          ],
        ),
      ),
    );
  }
}
