import 'package:flutter/material.dart';
//DISPLAY & WRITE
class ProfilePage extends StatefulWidget{
  const ProfilePage({super.key});

  @override
  State<StatefulWidget> createState() => _ProfilePage();
}

class _ProfilePage extends State<ProfilePage>{
  final TextEditingController _name = TextEditingController();
  final TextEditingController _address =TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return const Scaffold();
  }
}