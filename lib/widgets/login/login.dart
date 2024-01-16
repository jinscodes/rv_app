import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:rv_app/widgets/login/square_title.dart';
import 'package:rv_app/widgets/signup/signup.dart';

import 'login_input.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  TextEditingController id = TextEditingController();
  TextEditingController pw = TextEditingController();

  Future fetchAPI() async {
    Dio dio = Dio();

    Response res = await dio.post(
      "http://localhost:8080/login",
      data: {
        "id": id.text,
        "pw": pw.text,
      },
    );

    print(res);
    return res.data;
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
                vertical: 180,
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
                          print("fname: ${id.text}");
                          print("lname:  ${pw.text}");
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
                  Row(
                    children: [
                      const SquareTitle(imgPath: "lib/img/google.png"),
                      IconButton(
                        icon: const Icon(
                          Icons.g_mobiledata_rounded,
                          size: 70,
                        ),
                        onPressed: () {
                          print("clicked");
                        },
                      )
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
