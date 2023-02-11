import 'package:flutter/material.dart';
import 'package:users_arkamaya/common/styles/app_colors.dart';
import 'package:users_arkamaya/presentation/pages/about_page.dart';
import 'package:users_arkamaya/presentation/pages/add_user_page.dart';
import 'package:users_arkamaya/presentation/pages/users_page.dart';
import 'package:users_arkamaya/presentation/widgets/navbar_item.dart';

class MainPage extends StatefulWidget {
  static const routeName = "/main";

  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedIndex = 0;

  final List<BottomNavigationBarItem> _bottomNavBarItems = [
    const BottomNavigationBarItem(
      label: 'List Users',
      icon: IconNavBar(
        icon: Icon(
          Icons.home,
        ),
      ),
    ),
    const BottomNavigationBarItem(
      label: 'New',
      icon: Icon(
        Icons.add_circle,
      ),
    ),
    const BottomNavigationBarItem(
      label: 'About',
      icon: Icon(
        Icons.account_circle,
      ),
    ),
  ];

  final List<Widget> _pages = [
    const UsersPage(),
    const AddUserPage(),
    const AboutPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: IndexedStack(
        index: selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        items: _bottomNavBarItems,
        showSelectedLabels: true,
        selectedFontSize: 12,
        selectedItemColor: AppColors.brand,
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
        showUnselectedLabels: true,
        unselectedFontSize: 11,
        unselectedItemColor: AppColors.greyShades(
          ShadeTypes.negative10,
        ),
        onTap: (selected) {
          setState(() {
            selectedIndex = selected;
          });
        },
      ),
    );
  }
}
