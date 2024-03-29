import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class InputWidget extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final double height;
  final String topLabel;
  final bool obscureText;

  const InputWidget({
    Key? key,
    required this.hintText,
    required this.controller,
    this.height = 48.0,
    this.topLabel = '',
    this.obscureText = false,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(topLabel),
        const SizedBox(height: 5.0),
        Container(
          height: height,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: TextFormField(
            controller: controller,
            obscureText: obscureText,
            decoration: InputDecoration(
              // prefixIcon: prefixIcon == null
              //     ? prefixIcon
              //     : Icon(
              //         prefixIcon,
              //         color: const Color.fromRGBO(105, 108, 121, 1),
              //       ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color.fromRGBO(74, 77, 84, 0.2),
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Constants.primaryColor,
                ),
              ),
              hintText: hintText,
              hintStyle: const TextStyle(
                fontSize: 14.0,
                color: Color.fromRGBO(105, 108, 121, 0.7),
              ),
            ),
          ),
        )
      ],
    );
  }
}
