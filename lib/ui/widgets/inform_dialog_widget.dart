import 'package:flutter/material.dart';
import 'package:loyalty_program_app/ui/res/sizes.dart';

/// диалог при работе с формами
class InformDialogWidget extends StatelessWidget {
  final String header;
  final String text;
  final String buttonTitle;
  final VoidCallback onPressed;

  const InformDialogWidget({
    Key? key,
    required this.onPressed,
    required this.header,
    required this.text,
    this.buttonTitle = 'Ок',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.radius20),
      ),
      title: Column(
        children: [
          Text(
            header,
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(color: Theme.of(context).accentColor),
          ),
          AppSizes.sizedBoxH12,
          Text(
            text,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: onPressed,
          child: Text(
            buttonTitle,
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(color: Theme.of(context).accentColor),
          ),
        ),
      ],
    );
  }
}
