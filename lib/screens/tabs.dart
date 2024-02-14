import 'package:fav_places_udemy/screens/fav_places_screen.dart';
import 'package:fav_places_udemy/screens/places.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = const PlacesScreen();
    var activePageTitle = 'Places';

    if (_selectedPageIndex == 1) {
      //final favoritePlaces = ref.watch(favoritePlacesProvider);
      activePage = const FavPlacesScreen(
        places: [],
      );
      activePageTitle = 'Favorites';
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(activePageTitle),
      ),
      //drawer: const Drawer(),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        // style: Theme.of(context).textTheme.bodyLarge!.copyWith(
        //           color: Theme.of(context).colorScheme.onBackground,
        //         ),
        backgroundColor: Theme.of(context).colorScheme.onSurfaceVariant,
        fixedColor: Theme.of(context).colorScheme.onPrimary,
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Places',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
