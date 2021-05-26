import 'dart:ui';

import 'package:flutter/material.dart';

/// кнопки для формы
class TextButtonForm extends StatelessWidget {
  final String title;
  final bool isButtonEnabled;
  final VoidCallback? onPressed;

  const TextButtonForm({
    Key? key,
    required this.title,
    required this.isButtonEnabled,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
        alignment: Alignment.centerLeft,
        backgroundColor: Theme.of(context).accentColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        title,
        style: Theme.of(context).textTheme.subtitle1?.copyWith(
              color: Theme.of(context).cardColor,
            ),
      ),
    );
  }
}
