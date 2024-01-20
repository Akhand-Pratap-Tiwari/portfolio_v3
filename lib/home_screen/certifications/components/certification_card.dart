import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

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
    return ClipRRect(
      borderRadius: BorderRadius.circular(defaultRadius),
      child: Stack(
        // fit: StackFit.expand,
        alignment: Alignment.center,
        children: [
          Opacity(
            //TODO: Add credly
            opacity: 0.5,
            child: LottieBuilder.asset(
              "assets/anims/certBg.json",
              height: 450,
              width: 400,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: 450,
            width: 400,
            padding: const EdgeInsets.all(defaultPadding),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(defaultRadius),
              // color: secondaryColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  certification.field!,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                // const SizedBox(height: defaultPadding),
                ...List.generate(
                  certification.agency_certs!.length,
                  (index) => AgencyAndCertificateList(
                    agency: certification.agency_certs!.keys.toList()[index],
                    certificateList:
                        certification.agency_certs!.values.toList()[index],
                  ),
                )
              ],
            ),
          ),
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
        padding: EdgeInsets.all(defaultPadding / 2),
        margin: EdgeInsets.only(top: defaultPadding),
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
              style: TextStyle(color: Colors.cyanAccent),
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
