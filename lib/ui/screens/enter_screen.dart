import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loyalty_program_app/bloc/enter_screen/fields/fields_enter_cubit.dart';
import 'package:loyalty_program_app/bloc/enter_screen/form/enter_form_bloc.dart';
import 'package:loyalty_program_app/ui/components/text_button_form.dart';
import 'package:loyalty_program_app/ui/components/wrapper_svg.dart';
import 'package:loyalty_program_app/ui/res/assets.dart';
import 'package:loyalty_program_app/ui/res/routes.dart';
import 'package:loyalty_program_app/ui/res/sizes.dart';
import 'package:loyalty_program_app/ui/res/strings.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loyalty_program_app/ui/widgets/custom_text_form_field_widget.dart';
import 'package:loyalty_program_app/utils/field_validator_utils.dart';

/// экран входа
/// форма для входа, кнопка для регистрации
class EnterScreen extends StatelessWidget {
  final bool isVisibleButtonReg;

  const EnterScreen({
    Key? key,
    this.isVisibleButtonReg = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _BuildAppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 60),
          child: BlocListener<EnterFormBloc, EnterFormState>(
            listener: (context, state) {
              if (state is EnterFormSubmissionFailed) {
                final snackBar = SnackBar(
                  content: Text(state.exception.toString().substring(11)),
                  backgroundColor: Theme.of(context).primaryColor,
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }

              if (state is EnterFormSubmissionSuccess) {
                Navigator.of(context).pushReplacementNamed(AppRoutes.main);
              }
            },
            child: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _BuildFieldEmail(),
                        AppSizes.sizedBoxH16,
                        _BuildFieldPassword(),
                      ],
                    ),
                  ),
                  _BuildButtonEnter(),
                  AppSizes.sizedBoxH24,
                  if (isVisibleButtonReg) _BuildButtonReg(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// AppBar
class _BuildAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(60),
      child: Padding(
        padding: const EdgeInsets.only(top: 20, bottom: 20),
        child: WrapperSvg(
          imgUrl: AppAssets.icLogo,
          width: AppSizes.appLogo,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(AppSizes.appBarLogoHeader);
}

/// поле E-mail
class _BuildFieldEmail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomTextFormFieldWidget(
      title: AppStrings.inputEmail,
      onChanged: (value) => _onChanged(context, value),
      onClear: () => _onClear(context),
      validator: (_) => _validator(context),
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.emailAddress,
      inputFormatters: [
        FieldValidatorUtils.formatEmail,
      ],
    );
  }

  /// поле изменено
  void _onChanged(BuildContext context, String? value) =>
      context.read<FieldsEnterCubit>().emailChanged(value);

  /// очистить поле
  void _onClear(BuildContext context) =>
      context.read<FieldsEnterCubit>().emailChanged('');

  /// валидация поля
  String? _validator(BuildContext context) =>
      context.read<FieldsEnterCubit>().state.fieldEmailIsValid;
}

/// поле пароль
class _BuildFieldPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomTextFormFieldWidget(
      title: AppStrings.inputPassword,
      onChanged: (value) => _onChanged(context, value),
      onClear: () => _onClear(context),
      validator: (_) => _validator(context),
      textInputAction: TextInputAction.done,
      inputFormatters: [
        FieldValidatorUtils.formatPassword,
      ],
      obscureText: true,
    );
  }

  void _onChanged(BuildContext context, String? value) =>
      context.read<FieldsEnterCubit>().passwordChanged(value);

  void _onClear(BuildContext context) =>
      context.read<FieldsEnterCubit>().passwordChanged('');

  String? _validator(BuildContext context) =>
      context.read<FieldsEnterCubit>().state.fieldPasswordIsValid;
}

/// кнопка Войти
class _BuildButtonEnter extends StatelessWidget {
  const _BuildButtonEnter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EnterFormBloc, EnterFormState>(
      builder: (context, state) {
        final isEnabled = context.watch<FieldsEnterCubit>().state.isValid;
        final fieldsState = context.watch<FieldsEnterCubit>().state;

        return TextButtonForm(
          isButtonEnabled: isEnabled,
          onPressed: isEnabled
              ? () => _formSubmit(
                    context,
                    fieldsState: fieldsState,
                  )
              : null,
          title: AppStrings.buttonEnter,
        );
      },
    );
  }

  /// клик по кнопке Войти
  void _formSubmit(
    BuildContext context, {
    required FieldsEnterState fieldsState,
  }) {
    // отправляем данные из полей формы
    context.read<EnterFormBloc>().add(
          EnterFormEventSubmitted(
            fieldsState: fieldsState,
          ),
        );
  }
}

/// кнопка Зарегистрироваться
class _BuildButtonReg extends StatelessWidget {
  const _BuildButtonReg({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButtonForm(
      isButtonEnabled: true,
      onPressed: () => _onPressedButtonReg(context),
      title: AppStrings.buttonRegistration,
    );
  }

  void _onPressedButtonReg(BuildContext context) {
    Navigator.of(context).pushReplacementNamed(AppRoutes.registration);
  }
}
