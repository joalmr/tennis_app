import 'package:flutter/material.dart';
import 'package:tennis_app/src/styles/colors.dart';

class KSecondaryButton extends StatelessWidget {
  const KSecondaryButton({super.key, this.onPressed, required this.textButton});
  final void Function()? onPressed;
  final String textButton;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: const ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(Colors.white24),
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
