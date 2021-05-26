import 'package:flutter/material.dart';
import 'package:loyalty_program_app/ui/res/sizes.dart';

/// кнопка очистки поля
class ButtonClear extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback? onClear;

  ButtonClear({
    Key? key,
    required this.controller,
    this.onClear,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.all(10),
      child: SizedBox(
        width: 24,
        height: 24,
        child: Ink(
          decoration: ShapeDecoration(
            color: Theme.of(context).primaryColor,
            shape: CircleBorder(),
          ),
          child: IconButton(
            padding: EdgeInsets.zero,
            icon: Icon(
              Icons.close,
              color: Theme.of(context).cardColor,
              size: 16,
            ),
            splashRadius: AppSizes.splashRadiusSmall,
            onPressed: () {
              controller.clear();
              if (onClear != null) {
                onClear!();
              }
            },
          ),
        ),
      ),
    );
  }
}
