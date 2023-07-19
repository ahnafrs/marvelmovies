import 'package:flutter/material.dart';
import 'package:movietheater/movielisting.dart';

class UserAuthentication extends StatefulWidget {
  const UserAuthentication({Key? key});

  @override
  State<UserAuthentication> createState() => _UserAuthenticationState();
}

class _UserAuthenticationState extends State<UserAuthentication> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _signInWithEmailAndPassword() {
    String email = _emailController.text.trim();
    String password = _passwordController.text;

    // Check if the entered email and password match the provided values
    if (email == 'ahnaf@gmail.com' && password == 'rafayel') {
      // If sign-in is successful, navigate to the next screen and pass the email and password
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => MovieListing(email: email, password: password),
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Sign-in Failed'),
            content: const Text('Invalid email or password.'),
            actions: <Widget>[
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  void _signUpWithEmailAndPassword() {
    // Implement your sign-up logic here
    String email = _emailController.text.trim();
    String password = _passwordController.text;

    // Perform sign-up authentication using email and password
    // You can use Firebase, your own backend, or any authentication service

    // Example code using Firebase:
    try {
      // Use your Firebase authentication method here
      // await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);

      // If sign-up is successful, navigate to the next screen
      Navigator.pushReplacementNamed(context, '/home');
    } catch (e) {
      // Handle sign-up errors
      print('Sign-up failed. Error: $e');
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Sign-up Failed'),
            content: const Text('Failed to create an account.'),
            actions: <Widget>[
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Authentication'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _signInWithEmailAndPassword,
              child: const Text('Sign In'),
            ),
            const SizedBox(height: 8.0),
            ElevatedButton(
              onPressed: _signUpWithEmailAndPassword,
              child: const Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}
