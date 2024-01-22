// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:rv_app/widgets/signup/signup.dart';

import 'login_input.dart';

class LogIn extends StatefulWidget {
  late String jwtToken;
  final Function setJwtToken;

  LogIn({super.key, required this.jwtToken, required this.setJwtToken});

  @override
  State<LogIn> createState() =>
      _LogInState(jwtToken: jwtToken, setJwtToken: setJwtToken);
}

class _LogInState extends State<LogIn> {
  TextEditingController id = TextEditingController();
  TextEditingController pw = TextEditingController();
  String jwtToken;
  Function setJwtToken;

  _LogInState({required this.jwtToken, required this.setJwtToken});

  Future fetchAPI() async {
    Dio dio = Dio();

    Response res;
    try {
      res = await dio.post(
        "http://localhost:8080/login",
        data: {
          "id": id.text,
          "pw": pw.text,
        },
      );
      print(res.data["jwtToken"]);

      setJwtToken(res.data["jwtToken"]);
    } catch (e) {
      // ignore: use_build_context_synchronously
      showSnackBar(context);
    }
  }

  double count = 0.0;

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
                      LoginInput(
                        title: "id",
                        controller: id,
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      LoginInput(
                        title: "pw",
                        controller: pw,
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
                    height: 30,
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
                      onPressed: () {
                        try {
                          fetchAPI();
                        } catch (e) {
                          print(e);
                        }
                      },
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

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

void showSnackBar(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text(
        "Login failed!",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 16,
        ),
      ),
      duration: Duration(seconds: 2),
    ),
  );
}
