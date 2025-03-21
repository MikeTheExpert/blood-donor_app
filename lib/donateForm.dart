import 'package:flutter/material.dart';
import 'package:work/utility/bottomNavBar.dart';
import 'package:work/utility/drop_Down_Lists.dart';
import 'package:work/utility/firebaseStorage.dart';

class DonateForm extends StatefulWidget {
  const DonateForm({super.key});

  @override
  State<StatefulWidget> createState() => _DonateForm();
}

class _DonateForm extends State<DonateForm> {
  FirestoreService firestoreService = FirestoreService();

  final TextEditingController _address = TextEditingController();
  BloodType? _bloodType;
  BloodQuantity? _quantity;
  Genotype? _genotype;
  RegistrationStatus? regStatus;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const MyBottomNav(),
      body: SafeArea(
          child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextField(
                controller: _address,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: "Address"),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Blood Type"),
                    DropdownButton(
                        items: bloodTypeList,
                        value: _bloodType,
                        onChanged: (newValue) {
                          setState(() {
                            _bloodType = newValue;
                          });
                        })
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Genotype"),
                    DropdownButton(items: genotypeList,
                        value: _genotype,
                        onChanged: (newValue){
                      setState(() {
                        _genotype = newValue;
                      });
                        })
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Blood Donation Quantity"),
                    DropdownButton(items: quantityList,
                        value:_quantity,
                        onChanged: (newValue){
                      setState(() {
                        _quantity = newValue;
                      });
                        })
                  ],
                ),
              ),
              OutlinedButton(onPressed: submit, child: const Text("Submit"))
            ],
          ),
        ),
      )),
    );
  }

  submit() {
    var bloodQty = _quantity?.name;
    var type = _bloodType?.name;
    var genotype = _genotype?.name;
    var location = _address.text;
    firestoreService.bloodDonation(bloodQty, type, genotype, location);
  }
}
