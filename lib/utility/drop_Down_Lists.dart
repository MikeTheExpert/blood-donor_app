import 'package:flutter/material.dart';

enum RegistrationStatus { donor, recipient }

enum Accept { True, False }

enum BloodQuantity { low, medium, high }

Map<BloodQuantity, String> bloodQuantityList = {
  BloodQuantity.low: "500ml",
  BloodQuantity.medium: "700ml",
  BloodQuantity.high: "1000ml",
};

List<DropdownMenuItem<BloodQuantity>> quantityList = [
  DropdownMenuItem(
    value: BloodQuantity.low,
    child: Text(bloodQuantityList[BloodQuantity.low]!),
  ),
  DropdownMenuItem(
    value: BloodQuantity.medium,
    child: Text(bloodQuantityList[BloodQuantity.medium]!),
  ),
  DropdownMenuItem(
    value: BloodQuantity.high,
    child: Text(bloodQuantityList[BloodQuantity.high]!),
  )
];

enum BloodType {
  aPlus,
  aNegative,
  bPlus,
  bNegative,
  abPlus,
  abNegative,
  oPlus,
  oNegative
}

Map bloodType = {
  BloodType.aPlus: "A+",
  BloodType.aNegative: "A-",
  BloodType.abPlus: "AB+",
  BloodType.abNegative: "AB-",
  BloodType.bPlus: "B+",
  BloodType.bNegative: "B-",
  BloodType.oPlus: "O+",
  BloodType.oNegative: "O-",
};
List<DropdownMenuItem<BloodType>> bloodTypeList = [
  DropdownMenuItem(
      value: BloodType.aPlus, child: Text(bloodType[BloodType.aPlus])),
  DropdownMenuItem(
      value: BloodType.aNegative, child: Text(bloodType[BloodType.aNegative])),
  DropdownMenuItem(
      value: BloodType.abPlus, child: Text(bloodType[BloodType.abPlus])),
  DropdownMenuItem(
      value: BloodType.abNegative,
      child: Text(bloodType[BloodType.abNegative])),
  DropdownMenuItem(
      value: BloodType.bPlus, child: Text(bloodType[BloodType.bPlus])),
  DropdownMenuItem(
      value: BloodType.bNegative, child: Text(bloodType[BloodType.bNegative])),
  DropdownMenuItem(
      value: BloodType.oPlus, child: Text(bloodType[BloodType.oPlus])),
  DropdownMenuItem(
      value: BloodType.oNegative, child: Text(bloodType[BloodType.oNegative])),
];

enum Genotype { aA, aS, sS, aB }

Map genotype = {
  Genotype.aA: "AA",
  Genotype.aB: "AB",
  Genotype.aS: "AS",
  Genotype.sS: "SS",
};

List <DropdownMenuItem<Genotype>> genotypeList = [
  DropdownMenuItem(value: Genotype.aA, child: Text(genotype[Genotype.aA])),
  DropdownMenuItem(value: Genotype.aB, child: Text(genotype[Genotype.aB])),
  DropdownMenuItem(value: Genotype.aS, child: Text(genotype[Genotype.aS])),
  DropdownMenuItem(value: Genotype.sS, child: Text(genotype[Genotype.sS])),
];
