import 'package:flutter/material.dart';


class ProfileTextFields extends StatelessWidget {
  const ProfileTextFields({
    super.key, required this.textfieldName, required this.labelText,
  });
  final String textfieldName ;
  final String labelText;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          textfieldName,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 2),
        TextField(
          enabled: false,
          decoration: InputDecoration(
              hintText: labelText,
              hintStyle: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: Colors.grey,
              )
          ),
        ),
      ],
    );
  }
}
