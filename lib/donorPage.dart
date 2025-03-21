import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:work/utility/bottomNavBar.dart';
import 'package:work/utility/donor_List_Card.dart';
import 'package:work/utility/firebaseStorage.dart';

//see pending blood transfusion requests DISPLAY
class DonorPage extends StatelessWidget{
  DonorPage({super.key});
  final FirestoreService firestoreService = FirestoreService();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      bottomNavigationBar: const MyBottomNav(),
      body: StreamBuilder(stream: firestoreService.requestInfo(), builder: (context, snapshot){
        if( snapshot.hasData){
          List requestList = snapshot.data!.docs;
          return ListView.builder(
              itemCount: requestList.length,
              itemBuilder: (context, index){
                DocumentSnapshot document = requestList[index];
                // get data from document
                Map<String, dynamic> data = document.data() as Map<String, dynamic>;
                String bloodInfo = data["bloodQty"];
                String typeInfo = data["bloodType"];
                String genotypeInfo = data["genotype"];
                String locationInfo = data["location"];
                String acceptedInfo = data["accepted"].toString();

                return DonorListCard(bloodInfo: bloodInfo, genotypeInfo: genotypeInfo, typeInfo: typeInfo, locationInfo: locationInfo, acceptedInfo: acceptedInfo);

              });
        }else{
          return const Text("No request available... yet");
        }
      }),
    );
  }
}