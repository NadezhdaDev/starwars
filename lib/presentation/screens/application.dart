import 'package:flutter/material.dart';
import 'package:starwars/presentation/screens/favourite/favourite_screen.dart';
import 'package:starwars/presentation/screens/search/search_screen.dart';

class Application extends StatefulWidget {
  const Application({super.key});

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: <Widget>[
          const SearchScreen(),
          const FavouriteScreen(),
        ].elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle:
        const TextStyle(fontFamily: "Destroy", fontSize: 20.0),
        unselectedLabelStyle:
        const TextStyle(fontFamily: "Destroy", fontSize: 18.0),
        elevation: 6.0,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Поиск',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Фавориты',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        onTap: _onItemTapped,
      ),
    );
  }
}

