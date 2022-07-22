import 'package:flutter/material.dart';
import 'package:pursa/screens/home/home.dart';

class Index extends StatefulWidget {
  const Index({Key? key}) : super(key: key);

  @override
  State<Index> createState() => _IndexState();
}

class _IndexState extends State<Index> {
  //
  int _selectedTab = 0;

  final List<Widget> _tabWidgets = [
    Home(),
    Center(child: Text('activities')),
    Center(child: Text('profil')),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Pursa Exchange",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0.0,
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Color.fromARGB(255, 6, 105, 9),
          unselectedItemColor: Colors.grey,
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedTab,
          // i should handle this state with BloC
          onTap: (index) {
            setState(() {
              _selectedTab = index;
            });
          },
          items: [
            const BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.lock_clock),
              label: 'activities',
            ),
            const BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
              ),
              label: 'Profil',
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
                _tabWidgets[_selectedTab],
              ],
          ),
        ));
  }
}
