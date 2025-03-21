import 'package:flutter/material.dart';
import 'package:work/donorPage.dart';
import 'package:work/home.dart';
import 'package:work/profilePage.dart';
import 'package:work/requestForm.dart';

import 'authentication/authPage.dart';
import 'authentication/loginPage.dart';
import 'authentication/registrationPage.dart';
import 'donateForm.dart';
import 'recipients.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "donor_page": (context) => DonorPage(),
        "host_page": (context) =>  HostPage(),
        "profile_page": (context) => const ProfilePage(),
        "request_page": (context) => const RequestPage(),
        "login_page": (context) => const LoginPage(),
        "register_page": (context) => const RegisterPage(),
        "home_page": (context) => Home(),
        "donate_form": (context) => const DonateForm(),
      },
      title: "Blood Donor App",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white70),
        useMaterial3: true,
      ),
      //when user login and auth is done, write logic to display login page first for unregistered users
      home: const AuthPage(),

    );
  }

}