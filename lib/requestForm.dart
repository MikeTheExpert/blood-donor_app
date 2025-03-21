import 'package:flutter/material.dart';
import 'package:work/utility/bottomNavBar.dart';
import 'package:work/utility/drop_Down_Lists.dart';
import 'package:work/utility/firebaseStorage.dart';
//WRITE
class RequestPage extends StatefulWidget{
  const RequestPage({super.key});

  @override
  State<StatefulWidget> createState() => _RequestPage();
}

class _RequestPage extends State<RequestPage>{
  final FirestoreService firestoreService = FirestoreService();
  final TextEditingController _address = TextEditingController();
  BloodType? _bloodType;
  BloodQuantity? _quantity;
  Genotype? _genotype;

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     bottomNavigationBar:  const MyBottomNav(),
       body: SafeArea(
         child: Center(
           child: SingleChildScrollView(
             child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 SizedBox(
                   height: 70,
                   child: Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: TextField(
                       controller: _address,
                       decoration: const InputDecoration(
                         hintText: "Home address",
                         border: OutlineInputBorder(),
                       ),
                     ),
                   ),
                 ),
                 Padding(
                   padding: const EdgeInsets.all(9.0),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     children: [
                       const Text("Blood Quantity for Donation"),
             
                       DropdownButton(
                           items: quantityList,
                           value: _quantity,
                           onChanged: (newValue) {
                             setState(() {
                               _quantity = newValue!;});
                           }),
                     ],
                   ),
                 ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   children: [
                     const Text("Blood Type"),
                     DropdownButton(items: bloodTypeList,
                         value: _bloodType,
                         onChanged: (newValue){
                       setState(() {
                         _bloodType = newValue;
                       });
                         })
                   ],
                 ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                      height: 50,
                      width: 120,
                      child: ElevatedButton(onPressed: submit, child: const Text("Make Request"))
                  ),
                ),
               ],
             ),
           ),
         ),
       ));
  }
  String short(Accept accepted) => accepted.toString().replaceAll("Accept", "");

  submit() {
    var bloodQty =_quantity?.name;
    var type = _bloodType?.name;
    var genotype = _genotype?.name;
    var location = _address.text;
    //var user = ;
    firestoreService.donationRequest(bloodQty, type, genotype, location);
  }
}