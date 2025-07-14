import 'package:flutter/material.dart';

class ButtonCustom extends StatelessWidget {
  const ButtonCustom({super.key, required this.text, required this.onPressed, this.enable = true});

  final String text;
  final VoidCallback? onPressed;
  final bool enable;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final Color backgroundColor = enable ? colorScheme.primary : Colors.white;

    final Color foregroundColor = enable ? Colors.white : Colors.black;

    final BorderSide borderSide = enable
        ? BorderSide.none
        : const BorderSide(color: Color(0xFFE5E7EB));

    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: enable ? onPressed : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: onPressed != null ? backgroundColor : Colors.grey.shade300,
          foregroundColor: foregroundColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12), side: borderSide),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: onPressed != null ? foregroundColor : Colors.grey.shade600,
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
