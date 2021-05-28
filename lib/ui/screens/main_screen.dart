import 'package:flutter/material.dart';
import 'package:loyalty_program_app/bloc/main_screen/pages/main_pages_cubit.dart';
import 'package:loyalty_program_app/bloc/main_screen/main_screen_bloc.dart';
import 'package:loyalty_program_app/ui/res/strings.dart';
import 'package:loyalty_program_app/ui/screens/cabinet_screen.dart';
import 'package:loyalty_program_app/ui/screens/profile_screen.dart';
import 'package:loyalty_program_app/ui/screens/qr_code_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// главный экран приложения
class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainScreenBloc, MainScreenState>(
      builder: (context, state) {
        if (state is MainScreenUserLoading) {
          return CircularProgressIndicator.adaptive();
        } else if (state is MainScreenUserLoadSuccess) {
          final _authUser = state.user;

          return BlocBuilder<MainPagesCubit, MainPagesState>(
            builder: (context, state) {
              return Scaffold(
                body: IndexedStack(
                  index: state.currentPage,
                  children: [
                    CabinetScreen(user: _authUser),
                    ProfileScreen(user: _authUser),
                  ],
                ),
                bottomNavigationBar:
                    _BuildBottomNavigationBar(pageIndex: state.currentPage),
                floatingActionButton: FloatingActionButton(
                  backgroundColor: Theme.of(context).primaryColor,
                  child: Icon(Icons.qr_code),
                  elevation: 0,
                  onPressed: () {
                    _showDetailsBottomSheet(context);
                  },
                ),
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.centerDocked,
              );
            },
          );
        } else if (state is MainScreenUserLoadFailure) {
          // todo экран с ошибкой
          return Text(state.exception.toString());
        }

        // todo лоадер
        return CircularProgressIndicator.adaptive();
      },
    );
  }

  /// показать боттомшит с деталями
  Future<void> _showDetailsBottomSheet(BuildContext context) async {
    await showModalBottomSheet(
      context: context,
      builder: (_) {
        return QRCodeScreen();
      },
      isScrollControlled: true,
      isDismissible: true,
    );
  }
}

/// навигация по экранам
class _BuildBottomNavigationBar extends StatelessWidget {
  final int pageIndex;

  const _BuildBottomNavigationBar({
    Key? key,
    required this.pageIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: AppStrings.bnbLabelCabinet,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: AppStrings.bnbLabelProfile,
        ),
      ],
      currentIndex: pageIndex,
      onTap: (index) {
        context.read<MainPagesCubit>().changedPage(index);
      },
    );
  }
}
