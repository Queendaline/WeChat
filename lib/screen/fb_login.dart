import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FbLogin extends StatelessWidget {
  const FbLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController(text: '');
    TextEditingController passwordController = TextEditingController(text: '');

    return Scaffold(
      appBar: AppBar(title: Text('Login here')),
      body: Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'User login',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            const Text(
              'Fill the form below to sign in to your account',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 24),
            const Text('Email address'),
            TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(hintText: 'Email address'),
            ),
            const SizedBox(height: 24),
            const Text('Password'),
            TextField(
              controller: passwordController,
              keyboardType: TextInputType.visiblePassword,
              decoration: const InputDecoration(hintText: 'Password'),
            ),
            const SizedBox(
              height: 24,
            ),
            ElevatedButton(
              onPressed: () =>
                  firebaseSignUp(emailController.text, passwordController.text),
              child: Text('Sign in'),
            )
          ],
        ),
      ),
    );
  }

  Future firebaseSignUp(email, password) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    auth
        .signInWithEmailAndPassword(email: email, password: password)
        .whenComplete(
            () => {print(email + '-- You have been login to our system')});
  }
}
