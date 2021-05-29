import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:loyalty_program_app/bloc/edit_profile_screen/fields/fields_edit_profile_cubit.dart';
import 'package:loyalty_program_app/bloc/edit_profile_screen/form/edit_profile_form_bloc.dart';
import 'package:loyalty_program_app/data/models/user.dart';
import 'package:loyalty_program_app/ui/components/text_button_form.dart';
import 'package:loyalty_program_app/ui/res/sizes.dart';
import 'package:loyalty_program_app/ui/res/strings.dart';
import 'package:loyalty_program_app/ui/routes/main_screen_route.dart';
import 'package:loyalty_program_app/ui/widgets/custom_text_form_field_widget.dart';
import 'package:loyalty_program_app/utils/field_validator_utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// редактирование профиля
class EditProfileScreen extends StatelessWidget {
  final User user;

  const EditProfileScreen({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.titleScreenEditProfile),
        leading: BackButton(
          color: Theme.of(context).primaryColor,
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: BlocListener<EditProfileFormBloc, EditProfileFormState>(
                listener: (context, state) {
                  if (state is EditProfileFormSubmissionFailed) {
                    final snackBar = SnackBar(
                      content: Text(state.exception.toString()),
                      backgroundColor: Theme.of(context).primaryColor,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }

                  if (state is EditProfileFormSubmissionSuccess) {
                    MainScreenRoute.goMainScreen(
                      context,
                      authUserEmail: user.email,
                      pageIndex: 1,
                    );
                  }
                },
                child: Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    children: [
                      AppSizes.sizedBoxH32,
                      _BuildFieldLastName(user: user),
                      AppSizes.sizedBoxH12,
                      _BuildFieldFirstName(user: user),
                      AppSizes.sizedBoxH12,
                      _BuildFieldPatronymic(user: user),
                      AppSizes.sizedBoxH12,
                      _BuildFieldBirthdate(user: user),
                      AppSizes.sizedBoxH12,
                      _BuildFieldPhone(user: user),
                      AppSizes.sizedBoxH40,
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: _BuildButtonEdit(),
          ),
        ],
      ),
    );
  }
}

/// поле Имя
class _BuildFieldFirstName extends StatelessWidget {
  final User user;

  const _BuildFieldFirstName({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomTextFormFieldWidget(
      title: AppStrings.inputFirstName,
      text: user.firstName,
      onChanged: (value) => _onChanged(context, value),
      onClear: () => _onClear(context),
      validator: (_) => _validator(context),
      textInputAction: TextInputAction.next,
      inputFormatters: [
        FieldValidatorUtils.formatText,
      ],
    );
  }

  void _onChanged(BuildContext context, String? value) =>
      context.read<FieldsEditProfileCubit>().firstNameChanged(value);

  void _onClear(BuildContext context) =>
      context.read<FieldsEditProfileCubit>().firstNameChanged('');

  String? _validator(BuildContext context) =>
      context.read<FieldsEditProfileCubit>().state.fieldFirstNameIsValid;
}

/// поле фамилия
class _BuildFieldLastName extends StatelessWidget {
  final User user;

  const _BuildFieldLastName({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomTextFormFieldWidget(
      title: AppStrings.inputLastName,
      text: user.lastName,
      onChanged: (value) => _onChanged(context, value),
      onClear: () => _onClear(context),
      validator: (_) => _validator(context),
      textInputAction: TextInputAction.next,
      inputFormatters: [
        FieldValidatorUtils.formatText,
      ],
    );
  }

  void _onChanged(BuildContext context, String? value) =>
      context.read<FieldsEditProfileCubit>().lastNameChanged(value);

  void _onClear(BuildContext context) =>
      context.read<FieldsEditProfileCubit>().lastNameChanged('');

  String? _validator(BuildContext context) =>
      context.read<FieldsEditProfileCubit>().state.fieldLastNameIsValid;
}

/// поле отчество
class _BuildFieldPatronymic extends StatelessWidget {
  final User user;

  const _BuildFieldPatronymic({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomTextFormFieldWidget(
      title: AppStrings.inputPatronymic,
      text: user.patronymic,
      onChanged: (value) => _onChanged(context, value),
      onClear: () => _onClear(context),
      validator: (_) => _validator(context),
      textInputAction: TextInputAction.next,
      inputFormatters: [
        FieldValidatorUtils.formatText,
      ],
    );
  }

  void _onChanged(BuildContext context, String? value) =>
      context.read<FieldsEditProfileCubit>().patronymicChanged(value);

  void _onClear(BuildContext context) =>
      context.read<FieldsEditProfileCubit>().patronymicChanged('');

  String? _validator(BuildContext context) =>
      context.read<FieldsEditProfileCubit>().state.fieldPatronymicIsValid;
}

/// поле ДР
class _BuildFieldBirthdate extends StatelessWidget {
  final User user;

  const _BuildFieldBirthdate({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomTextFormFieldWidget(
      title: AppStrings.inputBirthdate,
      text: user.birthdate != null
          ? _dateTransform(user.birthdate!)
          : '',
      onChanged: (value) => _onChanged(context, value),
      onClear: () => _onClear(context),
      validator: (_) => _validator(context),
      textInputAction: TextInputAction.next,
      hintText: 'дд.мм.гггг',
      inputFormatters: [
        FieldValidatorUtils.formatDate,
      ],
    );
  }

  String _dateTransform(DateTime date) {
    return DateFormat('dd.MM.yyyy').format(date);
  }

  void _onChanged(BuildContext context, String? value) =>
      context.read<FieldsEditProfileCubit>().birthdateChanged(value);

  void _onClear(BuildContext context) =>
      context.read<FieldsEditProfileCubit>().birthdateChanged('');

  String? _validator(BuildContext context) =>
      context.read<FieldsEditProfileCubit>().state.fieldBirthdateIsValid;
}

/// поле телефон
class _BuildFieldPhone extends StatelessWidget {
  final User user;

  const _BuildFieldPhone({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomTextFormFieldWidget(
      title: AppStrings.inputPhone,
      text: user.phone,
      onChanged: (value) => _onChanged(context, value),
      onClear: () => _onClear(context),
      validator: (_) => _validator(context),
      keyboardType: TextInputType.phone,
      hintText: '+7 (000) 000-00-00',
      textInputAction: TextInputAction.done,
      inputFormatters: [
        FieldValidatorUtils.formatPhone,
      ],
    );
  }

  void _onChanged(BuildContext context, String? value) =>
      context.read<FieldsEditProfileCubit>().phoneChanged(value);

  void _onClear(BuildContext context) =>
      context.read<FieldsEditProfileCubit>().phoneChanged('');

  String? _validator(BuildContext context) =>
      context.read<FieldsEditProfileCubit>().state.fieldPhoneIsValid;
}

/// кнопка сохранить
class _BuildButtonEdit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 40),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: BlocBuilder<EditProfileFormBloc, EditProfileFormState>(
          builder: (context, state) {
            final isEnabled =
                context.watch<FieldsEditProfileCubit>().state.isValid;
            final fieldsState = context.watch<FieldsEditProfileCubit>().state;

            return TextButtonForm(
              isButtonEnabled: isEnabled,
              onPressed: isEnabled
                  ? () => _formSubmit(
                        context,
                        fieldsState: fieldsState,
                      )
                  : null,
              title: AppStrings.buttonEdit,
            );
          },
        ),
      ),
    );
  }

  /// клик по кнопке Создать
  void _formSubmit(
    BuildContext context, {
    required FieldsEditProfileState fieldsState,
  }) {
    // отправляем данные из полей формы
    context.read<EditProfileFormBloc>().add(
          EditProfileFormEventSubmitted(fieldsState),
        );
  }
}
