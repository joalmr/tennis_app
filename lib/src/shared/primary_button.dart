import 'package:flutter/material.dart';
import 'package:tennis_app/src/styles/colors.dart';

class KPrimaryButton extends StatelessWidget {
  const KPrimaryButton({super.key, this.onPressed, required this.textButton});

  final void Function()? onPressed;
  final String textButton;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: const ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(kPrimaryColor),
          foregroundColor: WidgetStatePropertyAll(kTextColorContrast),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
          ),
          textStyle: WidgetStatePropertyAll(
            TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          )),
      onPressed: onPressed,
      child: Text(textButton),
    );
  }
}
