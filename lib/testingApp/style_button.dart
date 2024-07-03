import 'package:flutter/material.dart';

class StyleButton extends StatelessWidget {
  const StyleButton({
    super.key,
    required this.onPressed,
    required this.child,
  });

  final void Function() onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
            backgroundColor: Colors.brown.shade400,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        child: child);
  }
}
