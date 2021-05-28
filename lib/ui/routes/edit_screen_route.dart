import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loyalty_program_app/bloc/edit_profile_screen/fields/fields_edit_profile_cubit.dart';
import 'package:loyalty_program_app/bloc/edit_profile_screen/form/edit_profile_form_bloc.dart';
import 'package:loyalty_program_app/data/models/user.dart';
import 'package:loyalty_program_app/data/repository/user_repository.dart';
import 'package:loyalty_program_app/ui/screens/edit_profile_screen.dart';

/// маршрут на экран редактирования профиля
class EditScreenRoute {
  EditScreenRoute._();

  static Future<Object?> goEditProfileScreen(BuildContext context, User user) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MultiBlocProvider(
          providers: [
            BlocProvider<FieldsEditProfileCubit>(
              create: (_) => FieldsEditProfileCubit(user),
            ),
            BlocProvider<EditProfileFormBloc>(
              create: (_) => EditProfileFormBloc(
                user,
                context.read<UserRepository>(),
              ),
            ),
          ],
          child: EditProfileScreen(user: user),
        ),
      ),
    );
  }
}
