import 'package:flutter/material.dart';
import 'package:movieapp_sfu_usingflutterboc_codeinterview/ui/pages/download_screen.dart';
import 'package:movieapp_sfu_usingflutterboc_codeinterview/ui/pages/home_screen.dart';
import 'package:movieapp_sfu_usingflutterboc_codeinterview/ui/pages/movie_details_page.dart';
import 'package:movieapp_sfu_usingflutterboc_codeinterview/ui/pages/profile_screen.dart';
import 'package:movieapp_sfu_usingflutterboc_codeinterview/ui/pages/search_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  List<Widget> _screens = const [
    HomeScreen(),
    SearchScreen(),
    DownloadScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PersistentTabView(
          context,
          controller: PersistentTabController(initialIndex: _currentIndex),
          screens: _screens,
          items: [
            PersistentBottomNavBarItem(
              icon: const Icon(Icons.home),
              title: 'Home',
              activeColorPrimary: Theme.of(context).highlightColor,
              inactiveColorPrimary: Colors.grey,
            ),
            PersistentBottomNavBarItem(
              icon: const Icon(Icons.search),
              title: 'Search',
              activeColorPrimary: Theme.of(context).highlightColor,
              inactiveColorPrimary: Colors.grey,
            ),
            PersistentBottomNavBarItem(
              icon: const Icon(Icons.download),
              title: 'Download',
              activeColorPrimary: Theme.of(context).highlightColor,
              inactiveColorPrimary: Colors.grey,
            ),
            PersistentBottomNavBarItem(
              icon: const Icon(Icons.person),
              title: 'Profile',
              activeColorPrimary: Theme.of(context).highlightColor,
              inactiveColorPrimary: Colors.grey,
            ),
          ],
          confineInSafeArea: true,
          backgroundColor: Theme.of(context).primaryColor,
          handleAndroidBackButtonPress: true,
          resizeToAvoidBottomInset: true,
          stateManagement: true,
          hideNavigationBarWhenKeyboardShows: true,
          popAllScreensOnTapOfSelectedTab: true,
          navBarStyle: NavBarStyle.style1, // Customize the nav bar style
        ),
      ),
    );
  }
}
