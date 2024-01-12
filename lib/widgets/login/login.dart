import 'package:flutter/material.dart';
import 'package:rv_app/widgets/signup/signup.dart';

import 'loginInput.dart';

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
                vertical: 210,
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
                  const SizedBox(
                    height: 40,
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
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Signup(),
                              ));
                        },
                        child: const Text(
                          "sign up",
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  ButtonTheme(
                    height: 50,
                    minWidth: 320,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          foregroundColor: const Color(0x00cbcbcb),
                          backgroundColor: const Color(0xFFF1F1F1),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 150,
                            vertical: 20,
                          )),
                      onPressed: () {},
                      child: const Text(
                        "Log in",
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Itim",
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
