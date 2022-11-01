
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginWidget extends StatefulWidget {
  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  Future signIn() async {
    await
    FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim());
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          TextField(
            controller: emailController,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(labelText: "Email"),
          ),
          SizedBox(
            height: 4,
          ),
          TextField(
            controller: passwordController,
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(labelText: "Password"),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton.icon(style: ElevatedButton.styleFrom(
            minimumSize: Size.fromHeight(50),
          ),
              onPressed: signIn,
              icon: Icon(
                Icons.lock_open,
                size: 32,
              ),
              label: Text("Sign-In"))
        ],
      ),
    );


    }
  }

