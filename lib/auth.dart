import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'widgets/home/home.dart';
import 'widgets/login/login.dart';

class Auth extends StatefulWidget {
  const Auth({super.key});

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  late String jwtToken = "";

  setJwtToken(token) {
    setState(() {
      jwtToken = token;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (jwtToken == "") {
            return LogIn(
              jwtToken: jwtToken,
              setJwtToken: setJwtToken,
            );
          } else {
            return const Home();
          }
        },
      ),
    );
  }
}
