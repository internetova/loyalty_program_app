import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loyalty_program_app/bloc/registration_screen/fields/fields_reg_cubit.dart';
import 'package:loyalty_program_app/bloc/registration_screen/form/reg_form_bloc.dart';
import 'package:loyalty_program_app/ui/components/text_button_form.dart';
import 'package:loyalty_program_app/ui/components/wrapper_svg.dart';
import 'package:loyalty_program_app/ui/res/assets.dart';
import 'package:loyalty_program_app/ui/res/sizes.dart';
import 'package:loyalty_program_app/ui/res/strings.dart';
import 'package:loyalty_program_app/ui/widgets/custom_text_form_field_widget.dart';
import 'package:loyalty_program_app/utils/utils_field_validator.dart';

/// экран регистрации
class RegistrationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _BuildAppBar(),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: [
                    AppSizes.sizedBoxH32,
                    _BuildFieldEmail(),
                    AppSizes.sizedBoxH12,
                    _BuildFieldFirstName(),
                    AppSizes.sizedBoxH12,
                    _BuildFieldLastName(),
                    AppSizes.sizedBoxH12,
                    _BuildFieldPatronymic(),
                    AppSizes.sizedBoxH12,
                    _BuildFieldPassword(),
                    AppSizes.sizedBoxH12,
                    _BuildFieldConfirmPassword(),
                    AppSizes.sizedBoxH40,
                  ],
                ),
              ),
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: _BuildButtonReg(),
          ),
        ],
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
        UtilsFieldValidator.formatEmail,
      ],
    );
  }

  /// поле изменено
  void _onChanged(BuildContext context, String? value) =>
      context.read<FieldsRegCubit>().emailChanged(value);

  /// очистить поле
  void _onClear(BuildContext context) =>
      context.read<FieldsRegCubit>().emailChanged('');

  /// валидация поля
  String? _validator(BuildContext context) =>
      context.read<FieldsRegCubit>().state.fieldEmailIsValid;
}

/// поле Имя
class _BuildFieldFirstName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomTextFormFieldWidget(
      title: AppStrings.inputFirstName,
      onChanged: (value) => _onChanged(context, value),
      onClear: () => _onClear(context),
      validator: (_) => _validator(context),
      textInputAction: TextInputAction.next,
      inputFormatters: [
        UtilsFieldValidator.formatText,
      ],
    );
  }

  void _onChanged(BuildContext context, String? value) =>
      context.read<FieldsRegCubit>().firstNameChanged(value);

  void _onClear(BuildContext context) =>
      context.read<FieldsRegCubit>().firstNameChanged('');

  String? _validator(BuildContext context) =>
      context.read<FieldsRegCubit>().state.fieldFirstNameIsValid;
}

/// поле фамилия
class _BuildFieldLastName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomTextFormFieldWidget(
      title: AppStrings.inputLastName,
      onChanged: (value) => _onChanged(context, value),
      onClear: () => _onClear(context),
      validator: (_) => _validator(context),
      textInputAction: TextInputAction.next,
      inputFormatters: [
        UtilsFieldValidator.formatText,
      ],
    );
  }

  void _onChanged(BuildContext context, String? value) =>
      context.read<FieldsRegCubit>().lastNameChanged(value);

  void _onClear(BuildContext context) =>
      context.read<FieldsRegCubit>().lastNameChanged('');

  String? _validator(BuildContext context) =>
      context.read<FieldsRegCubit>().state.fieldLastNameIsValid;
}

/// поле отчество
class _BuildFieldPatronymic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomTextFormFieldWidget(
      title: AppStrings.inputPatronymic,
      onChanged: (value) => _onChanged(context, value),
      onClear: () => _onClear(context),
      validator: (_) => _validator(context),
      textInputAction: TextInputAction.next,
      inputFormatters: [
        UtilsFieldValidator.formatText,
      ],
    );
  }

  void _onChanged(BuildContext context, String? value) =>
      context.read<FieldsRegCubit>().patronymicChanged(value);

  void _onClear(BuildContext context) =>
      context.read<FieldsRegCubit>().lastNameChanged('');

  String? _validator(BuildContext context) =>
      context.read<FieldsRegCubit>().state.fieldPatronymicIsValid;
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
      textInputAction: TextInputAction.next,
      inputFormatters: [
        UtilsFieldValidator.formatPassword,
      ],
      obscureText: true,
    );
  }

  void _onChanged(BuildContext context, String? value) =>
      context.read<FieldsRegCubit>().passwordChanged(value);

  void _onClear(BuildContext context) =>
      context.read<FieldsRegCubit>().passwordChanged('');

  String? _validator(BuildContext context) =>
      context.read<FieldsRegCubit>().state.fieldPasswordIsValid;
}

/// поле пароль подтверждение
class _BuildFieldConfirmPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomTextFormFieldWidget(
      title: AppStrings.inputConfirmPassword,
      onChanged: (value) => _onChanged(context, value),
      onClear: () => _onClear(context),
      validator: (_) => _validator(context),
      textInputAction: TextInputAction.done,
      inputFormatters: [
        UtilsFieldValidator.formatPassword,
      ],
      obscureText: true,
    );
  }

  void _onChanged(BuildContext context, String? value) =>
      context.read<FieldsRegCubit>().confirmPasswordChanged(value);

  void _onClear(BuildContext context) =>
      context.read<FieldsRegCubit>().confirmPasswordChanged('');

  String? _validator(BuildContext context) =>
      context.read<FieldsRegCubit>().state.fieldConfirmPasswordIsValid;
}

/// кнопка зарегистрироваться
class _BuildButtonReg extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 40),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: BlocBuilder<RegFormBloc, RegFormState>(
          builder: (context, state) {
            final isEnabled = context.watch<FieldsRegCubit>().state.isValid;
            final fieldsState = context.watch<FieldsRegCubit>().state;

            return TextButtonForm(
              isButtonEnabled: isEnabled,
              onPressed: isEnabled
                  ? () => _formSubmit(
                        context,
                        fieldsState: fieldsState,
                      )
                  : null,
              title: AppStrings.buttonRegistration,
            );
          },
        ),
      ),
    );
  }

  /// клик по кнопке Создать
  void _formSubmit(
    BuildContext context, {
    required FieldsRegState fieldsState,
  }) {
    // отправляем данные из полей формы
    context.read<RegFormBloc>().add(
          RegFormEventSubmitted(
            context,
            fieldsState: fieldsState,
          ),
        );
  }
}
