import 'package:flutter/material.dart';

class LoginInput extends StatelessWidget {
  final TextEditingController? controller;
  final String title;

  const LoginInput({
    super.key,
    required this.title,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12, bottom: 5),
            child: Text(
              title,
              style: const TextStyle(
                fontFamily: "Itim",
                fontSize: 25,
              ),
            ),
          ),
          TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: "Enter $title",
              hintStyle: TextStyle(
                color: Colors.black.withOpacity(0.3),
                fontSize: 14,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color(0xFFC3C3C3),
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color(0xFF838383),
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.red,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
