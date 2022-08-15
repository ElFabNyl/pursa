import 'package:flutter/material.dart';
import 'package:pursa/screens/home/home.dart';
import 'package:pursa/screens/profil/profil.dart';

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
    ProfilScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF9FDFF),
     
        appBar: AppBar(
          title: Text(
            "Pursa Exchange",
            style: TextStyle(
              color: Colors.black,
              fontSize: 22.0,
              fontWeight: FontWeight.w900,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notifications,
                color: Color(0xff477747),
              ),
            )
          ],
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
