import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:work/donorPage.dart';
import 'package:work/recipients.dart';
import 'package:work/utility/bottomNavBar.dart';
import 'package:work/utility/firebaseStorage.dart';

class Home extends StatelessWidget{
  Home({super.key});
  final FirestoreService firestoreService = FirestoreService();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: MyBottomNav(),
      body: Center(
          child: Text("Home Page")),
      // body: StreamBuilder(stream: firestoreService.profileInfo(), builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
      //   // get data from document
      //   DocumentSnapshot document = snapshot.data.docs;
      //   Map<String, dynamic> data =
      //   document.data() as Map<String, dynamic>;
      //   String regStatus = data['regStatus'];        //if user is a donor
      //   if (regStatus == 'donor'){
      //     return DonorPage();
      //   }else{
      //     return HostPage();
      //   }
      // },),
    );
  }

}