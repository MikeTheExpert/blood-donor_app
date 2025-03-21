import 'package:flutter/material.dart';

class DonorListCard extends StatelessWidget{
  final String bloodInfo;
  final String genotypeInfo;
  final String typeInfo;
  final String locationInfo;
  final String acceptedInfo;
  const DonorListCard( {super.key, required this.bloodInfo, required this.genotypeInfo, required this.typeInfo, required this.locationInfo, required this.acceptedInfo,});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Column(
        children: [
          Text(bloodInfo),
          Text(genotypeInfo),
          Text(typeInfo),
          Text(locationInfo),
          Text(acceptedInfo),
        ],
      ),
    );
  }
}