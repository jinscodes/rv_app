import 'package:flutter/material.dart';
import 'package:rv_app/widgets/login/loginInput.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 40,
              vertical: 210,
            ),
            child: Column(children: [
              Column(
                children: [
                  const Text(
                    "Signup",
                    style: TextStyle(
                      fontFamily: "JacquesFrancoisShadow",
                      fontSize: 50,
                    ),
                  ),
                  const SizedBox(
                    height: 85,
                  ),
                  const LoginInput(title: "First name"),
                  const SizedBox(
                    height: 18,
                  ),
                  const LoginInput(title: "Last name"),
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
                        ),
                      ),
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
              )
            ]),
          ),
        ),
      ),
    );
  }
}
