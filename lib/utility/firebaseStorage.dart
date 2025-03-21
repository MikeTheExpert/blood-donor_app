import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final CollectionReference userDb = FirebaseFirestore.instance.collection('users');
  final CollectionReference bldDonor = FirebaseFirestore.instance.collection('donation');
  final CollectionReference bldRequest = FirebaseFirestore.instance.collection('requests');
  //CREATE
  Future<void> regUser(name,email,address,type,genotype,regStatus){
    return userDb.add({
      'name':name,
      'email':email,
      'address':address,
      'bloodType':type,
      'genotype':genotype,
      'regStatus':regStatus,
    });
  }

  Future bloodDonation(bloodQty, type, genotype, location){
    return bldDonor.add({
      'bloodQty':bloodQty,
      'bloodType':type,
      'genotype':genotype,
      'location': location,
      'accepted': false,
      // 'user'
      'timestamp': Timestamp.now(),
    });
  }

  Future donationRequest(bloodQty, type, genotype, location){
    return bldRequest.add({
      'bloodQty':bloodQty,
      'bloodType':type,
      'genotype':genotype,
      'location':location,
      'accepted': false,
      //'user': user,
      'timestamp': Timestamp.now(),
    });
  }

  //READ
  Stream <QuerySnapshot> bldDonorInfo (){
    final donorInfo = bldDonor.orderBy('timestamp',descending: true).snapshots();
    return donorInfo;
  }

  //learn how to get user info
  Stream <QuerySnapshot> profileInfo(){
    final userInfo = userDb.snapshots();
    return userInfo;
  }

  Stream <QuerySnapshot> requestInfo(){
    final donationInfo = bldRequest.orderBy('timestamp', descending: true).snapshots();
    return donationInfo;
  }
}
