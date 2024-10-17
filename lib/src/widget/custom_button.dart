import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;

  const CustomButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(0),
        width: double.infinity,
        child: ElevatedButton(
          onPressed: onPressed,
          child: Text(text),
        ));
  }
}
