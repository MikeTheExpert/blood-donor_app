// ignore_for_file: file_names
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:work/utility/bottomNavBar.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  late TextEditingController _email, _password;

  @override
  void initState() {
    super.initState();
    _email = TextEditingController();
    _password = TextEditingController();
  }

  // Future submit() async {
  //   showDialog(
  //       context: context,
  //       builder: (context) {
  //         return const Center(child: CircularProgressIndicator());
  //       });
  //   try {
  //     await FirebaseAuth.instance.signInWithEmailAndPassword(
  //         email: _email.text, password: _password.text);
  //     Navigator.pushNamed(context, "home_page");
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'user-not-found') {
  //       const AlertDialog(
  //         title: Text("No user for this email"),
  //       );
  //     } else if (e.code == 'wrong-password') {
  //       const AlertDialog(
  //         title: Text("No user for this email"),
  //       );
  //     }
  //   }
  //   Navigator.pop(context);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const MyBottomNav(),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 100,
                  child: TextFormField(
                    controller: _email,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), hintText: "email field"),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 100,
                  child: TextFormField(
                    controller: _password,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "user password"),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      height: 60,
                      child: OutlinedButton(
                          onPressed: () async {
                            await FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                                    email: _email.text,
                                    password: _password.text);
                            Navigator.pushNamed(context, "home_page");
                          },
                          child: const Text("Log In"))),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "register_page");
                      },
                      child: const Text("Don't have an account?"))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _password.dispose();
    _email.dispose();
    super.dispose();
  }
}
