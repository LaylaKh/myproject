import 'package:flutter/material.dart';
import '../../core/strings/app_strings.dart';
import '../lists/favorite_hadiths_list.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(AppString.favorites),
      ),
      body: const FavoriteHadithsList(),
    );
  }
}