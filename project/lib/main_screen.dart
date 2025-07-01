import 'package:college_app/chats_page.dart';
import 'package:college_app/clubs_page.dart';
import 'package:college_app/events_page.dart';
import 'package:college_app/home_page.dart';
import 'package:college_app/profile_page.dart';
import 'package:flutter/material.dart';
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;

  final List<Widget> pages = [
    HomePage(),
    ChatsPage(),
    EventsPage(),
    ClubsPage(),
    
    ProfilePage(),
    
  ];

  void onTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        onTap: onTapped,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.white,
        
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), 
          label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Class Groups'),
          BottomNavigationBarItem(icon: Icon(Icons.event), label: 'Events'),
          BottomNavigationBarItem(icon: Icon(Icons.group), label: 'Clubs'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}