// ignore_for_file: file_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:work/utility/bottomNavBar.dart';

import '../utility/drop_Down_Lists.dart';
import '../utility/firebaseStorage.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPage();
}

class _RegisterPage extends State<RegisterPage> {
  FirestoreService firestoreService = FirestoreService();
  late TextEditingController _address,
      _name,
      _email,
      _password,
      _passwordConfirm;
  Genotype? _genotype;
  BloodType? _bloodType;
  RegistrationStatus? regStatus;

  @override
  void initState() {
    super.initState();
    _passwordConfirm = TextEditingController();
    _name = TextEditingController();
    _email = TextEditingController();
    _password = TextEditingController();
    _passwordConfirm = TextEditingController();
    _address = TextEditingController();
  }

  submit() async {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(child: CircularProgressIndicator());
        });
    try {
      if (_password.text == _passwordConfirm.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: _email.text, password: _password.text);
        Navigator.pushNamed(context, "home_page");
      } else {
        const AlertDialog(
          content: Text("Passwords don't match"),
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        const AlertDialog(
          title: Text("No user for this email"),
        );
      } else if (e.code == 'wrong-password') {
        const AlertDialog(
          title: Text("No user for this email"),
        );
      }
    }
    Navigator.pop(context);
  }

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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _name,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: "Username"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _address,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: "Home address"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _email,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: "Email"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _password,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: "Enter password"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _passwordConfirm,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Confirm password"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text("Blood Type"),
                    ),
                    SizedBox(
                      width: 230,
                      child: DropdownButton(
                          isExpanded: true,
                          items: bloodTypeList,
                          value: _bloodType,
                          onChanged: (newValue) {
                            setState(() {
                              _bloodType = newValue;
                            });
                          }),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text("Genotype"),
                    ),
                    SizedBox(
                      width: 235,
                      child: DropdownButton(
                          isExpanded: true,
                          items: genotypeList,
                          value: _genotype,
                          onChanged: (newValue) {
                            setState(() {
                              _genotype = newValue;
                            });
                          }),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(shorten(RegistrationStatus.donor)),
                  Radio(
                      value: RegistrationStatus.donor,
                      groupValue: regStatus,
                      onChanged: (newValue) {
                        setState(() {
                          regStatus = newValue;
                        });
                      }),
                  Text(shorten(RegistrationStatus.recipient)),
                  Radio(
                      value: RegistrationStatus.recipient,
                      groupValue: regStatus,
                      onChanged: (newValue) {
                        setState(() {
                          regStatus = newValue;
                        });
                      })
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                      onPressed: submit,
                      child: const Text("Submit Registration")),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "login_page");
                        },
                        child: const Text("Already have an account?")),
                  )
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }

  @override
  void dispose() {
    _name.dispose();
    _passwordConfirm.dispose();
    _password.dispose();
    _email.dispose();
    _address.dispose();
    super.dispose();
  }

  String shorten(RegistrationStatus regStatus) =>
      regStatus.toString().replaceAll("RegistrationStatus.", "");
}
