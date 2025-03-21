import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:work/utility/bottomNavBar.dart';
import 'package:work/utility/donor_List_Card.dart';
import 'package:work/utility/firebaseStorage.dart';

//see the pending blood parcel deliveries made by donors DISPLAY
class HostPage extends StatelessWidget {
  HostPage({super.key});

  final FirestoreService firestoreService = FirestoreService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const MyBottomNav(),
      body: SafeArea(
        child: StreamBuilder(
            stream: firestoreService.bldDonorInfo(),
            builder: (context, snapshot) {
              if(snapshot.hasData){
                //gets all docs in a collection
                List donorList =snapshot.data!.docs;
                return Center(child: ListView.builder(itemBuilder: (context, index){
                  //get individual document
                }),);
              }else{
                return Text("No data");
              }
            }),
      ),
    );
    //   body: StreamBuilder(
    //       stream: firestoreService.bldDonorInfo(),
    //       builder: (context, snapshot) {
    //         if (snapshot.hasData) {
    //           //get all the docs in the collection
    //           List donorList = snapshot.data!.docs;
    //
    //           return Center(
    //             child: ListView.builder(
    //               itemCount: donorList.length,
    //               itemBuilder: (context, index) {
    //                 // get individual doc
    //                 DocumentSnapshot document = donorList[index];
    //                 String docID = document.id;
    //
    //                 // get data from document
    //                 Map<String, dynamic> data =
    //                     document.data() as Map<String, dynamic>;
    //
    //                 String bloodInfo = data['bloodQty'];
    //                 String typeInfo = data['bloodType'];
    //                 String genotypeInfo = data['genotype'];
    //                 String locationInfo = data['location'];
    //                 String acceptedInfo = data['accepted'];
    //
    //                 return DonorListCard(
    //                   bloodInfo: bloodInfo,
    //                   genotypeInfo: genotypeInfo,
    //                   typeInfo: typeInfo,
    //                   locationInfo: locationInfo,
    //                   acceptedInfo: acceptedInfo,
    //                 ); //collects parameters
    //               },
    //             ),
    //           );
    //         }
    //         else{
    //           return const Text("Wow... No Activity yet!");
    //         }
    //       }),
    // );
  }
}
