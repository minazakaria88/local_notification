import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  const MyTextFormField({
    super.key,
    required this.hintText,
    required this.controller,
    required this.valid,
  });
  final String hintText;
  final TextEditingController controller;
  final Function valid;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        validator: (value) {
          return valid(value);
        },
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: const Icon(Icons.edit),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              )),
        ),
      ),
    );
  }
}