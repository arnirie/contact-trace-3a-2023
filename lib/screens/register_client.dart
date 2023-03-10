import 'package:contact_tracing_3a/constants/style_constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class RegisterClientScreen extends StatelessWidget {
  const RegisterClientScreen({super.key});

  void registerClient() async {
    try {
      EasyLoading.show(status: 'Processing...');
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: 'arni10@g.com',
        password: '123',
      );
      EasyLoading.showSuccess('User account has been registered.');
    } on FirebaseAuthException catch (ex) {
      if (ex.code == 'weak-password') {
        EasyLoading.showError(
            'Your password is not secure. Please enter a password with more than 6 characters.');
      } else if (ex.code == 'email-already-in-use') {
        EasyLoading.showError(
            'Your email is already registered. Please enter a new email address.');
      }
      print(ex.code);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sign Up',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(12.0),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/illustration.webp'),
            opacity: 0.5,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Register an account'),
            ElevatedButton(
              onPressed: registerClient,
              style: ElevatedButton.styleFrom(
                shape: roundShape,
              ),
              child: const Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
