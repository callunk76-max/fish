import 'package:flutter/material.dart';
import 'package:fishing_hobby_app/domain/repositories/fishing_repository.dart';
import 'package:fishing_hobby_app/presentation/screens/weather_screen.dart';
import 'package:fishing_hobby_app/presentation/screens/map_screen.dart';
import 'package:fishing_hobby_app/presentation/screens/spots_screen.dart';
import 'package:fishing_hobby_app/presentation/screens/log_screen.dart';

class HomeScreen extends StatefulWidget {
  final FishingRepository repository;

  const HomeScreen({Key? key, required this.repository}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  late final List<Widget> _widgetOptions;

  @override
  void initState() {
    super.initState();
    _widgetOptions = [
      WeatherScreen(repository: widget.repository),
      MapScreen(repository: widget.repository),
      SpotsScreen(repository: widget.repository),
      LogScreen(),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fishing Hobby'),
      ),
      body: SafeArea(child: _widgetOptions.elementAt(_selectedIndex)),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.wb_sunny),
            label: 'Cuaca',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Peta',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.place),
            label: 'Spot',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Log',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
