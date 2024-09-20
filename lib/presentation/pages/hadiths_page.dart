import 'package:flutter/material.dart';
import '../../core/strings/app_strings.dart';
import '../lists/main_hadiths_list.dart';
import '../widgets/hadith_search_delegate.dart';

class HadithsPage extends StatelessWidget {
  const HadithsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(AppString.appName),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                 delegate: HadithSearchDelegate(),
              );
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: const MainHadithsList(),
    );
  }
}