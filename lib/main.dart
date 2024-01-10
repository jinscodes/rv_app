import 'package:flutter/material.dart';
import 'package:rv_app/widgets/login/loginInput.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Random Voca App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LogIn(),
    );
  }
}

class LogIn extends StatelessWidget {
  const LogIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 40,
                vertical: 200,
              ),
              child: Column(
                children: [
                  const Column(
                    children: [
                      Text(
                        "Random",
                        style: TextStyle(
                          fontFamily: "JacquesFrancoisShadow",
                          fontSize: 50,
                        ),
                      ),
                      Text(
                        "Vocabulary",
                        style: TextStyle(
                          fontFamily: "JacquesFrancoisShadow",
                          fontSize: 45,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const LoginInput(
                        title: "id",
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      const LoginInput(
                        title: "pw",
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.black,
                          textStyle: const TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        onPressed: () {},
                        child: const Text(
                          "sign up",
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
