import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key, required List<List<String>> favorites}) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  List<List<String>> favorites = [];

  @override
  void initState() {
    super.initState();
    loadFavorites();
  }

  Future<void> loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final favoriteList = prefs.getStringList('favorites') ?? [];
    setState(() {
      favorites = favoriteList.map((item) => item.split(',')).toList();
    });
  }

  Future<void> saveFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final favoriteList = favorites.map((item) => item.join(',')).toList();
    prefs.setStringList('favorites', favoriteList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: ListView.builder(
        itemCount: favorites.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: Key(favorites[index][0]),
            onDismissed: (direction) {
              setState(() {
                favorites.removeAt(index);
                saveFavorites(); // Save favorites after removal
              });
            },
            background: Container(
              color: Colors.red,
              child: const Icon(Icons.delete, color: Colors.white),
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(right: 20),
            ),
            child: ListTile(
              title: Text(favorites[index][1]),
              subtitle: Text(favorites[index][2]),
              // Add more UI elements as needed
            ),
          );
        },
      ),
    );
  }
}
