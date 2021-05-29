import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loyalty_program_app/ui/components/button_clear.dart';
import 'package:loyalty_program_app/ui/res/sizes.dart';

/// текстовое поле
class CustomTextFormFieldWidget extends StatefulWidget {
  final String title;
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final ValueChanged? onFieldSubmitted;
  final VoidCallback? onEditingComplete;
  final VoidCallback onClear;
  final String? Function(String?)? validator;
  final ValueChanged<String?>? onChanged;
  final ValueChanged<String?>? onSaved;
  final int maxLength;
  final int maxLines;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final bool obscureText;
  final String? hintText;
  final List<TextInputFormatter>? inputFormatters;
  final String? text;

  const CustomTextFormFieldWidget({
    Key? key,
    required this.title,
    this.focusNode,
    this.controller,
    this.onFieldSubmitted,
    this.onEditingComplete,
    this.onChanged,
    required this.onClear,
    this.validator,
    this.onSaved,
    this.maxLength = 50,
    this.maxLines = 1,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.hintText,
    this.obscureText = false,
    this.inputFormatters,
    this.text,
  }) : super(key: key);

  @override
  _CustomTextFormFieldWidgetState createState() =>
      _CustomTextFormFieldWidgetState();
}

class _CustomTextFormFieldWidgetState extends State<CustomTextFormFieldWidget> {
  late TextEditingController _controller;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();

    _controller = widget.controller ?? TextEditingController();
    _focusNode = widget.focusNode ?? FocusNode();

    _controller.addListener(() => setState(() {}));
    _focusNode.addListener(() => setState(() {}));

    _controller.text = widget.text ?? '';
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: Theme.of(context).textTheme.subtitle1,
        ),
        AppSizes.sizedBoxH12,
        TextFormField(
          focusNode: _focusNode,
          onEditingComplete: widget.onEditingComplete,
          onFieldSubmitted: widget.onFieldSubmitted,
          controller: _controller,
          cursorWidth: 1,
          maxLength: widget.maxLength,
          maxLines: widget.maxLines,
          obscureText: widget.obscureText,
          keyboardType: widget.keyboardType,
          textInputAction: widget.textInputAction,
          decoration: InputDecoration(
            counterText: '',
            hintText: widget.hintText,
            hintStyle: Theme.of(context)
                .primaryTextTheme
                .subtitle1!
                .copyWith(color: Theme.of(context).primaryColorLight),
            suffixIcon: _clearField(
              focusNode: _focusNode,
              controller: _controller,
              onClear: widget.onClear,
            ),
            enabledBorder: _buildBorderColor(_controller),
          ),
          onChanged: widget.onChanged,
          validator: widget.validator,
          onSaved: widget.onSaved,
          inputFormatters: widget.inputFormatters,
        ),
      ],
    );
  }

  /// очистка поля по кнопке
  Widget _clearField({
    required FocusNode focusNode,
    required TextEditingController controller,
    required VoidCallback onClear,
  }) {
    if (focusNode.hasPrimaryFocus && controller.text.isNotEmpty) {
      return ButtonClear(
        controller: controller,
        onClear: onClear,
      );
    }

    return const SizedBox(width: 0);
  }

  /// цвет границы у уже правильно заполненного поля
  InputBorder _buildBorderColor(TextEditingController controller) =>
      Theme.of(context).inputDecorationTheme.enabledBorder!.copyWith(
            borderSide: BorderSide(
              color: controller.text.isNotEmpty
                  ? Theme.of(context).accentColor.withOpacity(0.4)
                  : Theme.of(context).primaryColorLight,
              style: BorderStyle.solid,
              width: 1,
            ),
          );
}
