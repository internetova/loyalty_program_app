import 'package:flutter/material.dart';
import 'package:loyalty_program_app/data/models/user.dart';
import 'package:loyalty_program_app/ui/res/strings.dart';
import 'package:loyalty_program_app/ui/screens/cabinet_screen.dart';
import 'package:loyalty_program_app/ui/screens/profile_screen.dart';
import 'package:loyalty_program_app/ui/screens/qr_code_screen.dart';

/// главный экран приложения
class MainScreen extends StatefulWidget {
  final String userEmail;

  const MainScreen({
    Key? key,
    required this.userEmail,
  }) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late int currentPage;
  late User user;

  @override
  void initState() {
    super.initState();

    currentPage = 0;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _buildBottomNavigationBar(currentPage),
      body: IndexedStack(
        index: currentPage,
        children: [
          /// todo передать юзера
          // CabinetScreen(user: widget.user),
          // ProfileScreen(user: widget.user),
        ],
      ),
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
  }

  /// навигация по экранам
  Widget _buildBottomNavigationBar(int pageIndex) => BottomNavigationBar(
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
          setState(() {
            currentPage = index;
          });
        },
      );

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
