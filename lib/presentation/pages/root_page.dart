import 'package:flutter/material.dart';
import 'package:mykhadith/presentation/state/main_bottom_bar_state.dart';
import 'package:provider/provider.dart';
import '../../core/routes/app_routes.dart';
import '../../core/themes/app_theme.dart';
import '../../data/state/hadith_data_state.dart';
import '../state/settings_state.dart';
import 'main_page.dart';

class RootPage extends StatelessWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    final settings = Provider.of<SettingsState>(context);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MainBottomBarState(),
        ),
        ChangeNotifierProvider(
          create: (_) => HadithDataState(),
        ),
      ],
      
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkhtTheme,
        themeMode: getTheme(settings.getThemeIndex),
        onGenerateRoute: AppRoutes.onGeneratorRoute,
        home: const MainPage(),
      ),
    );
  }

  ThemeMode getTheme(int themeIndex) {
    late ThemeMode themeMode;
    switch (themeIndex) {
      case 1:
        themeMode = ThemeMode.light;
        break;
      case 2:
        themeMode = ThemeMode.dark;
        break;
      case 3:
        themeMode = ThemeMode.system;
        break;
    }
    return themeMode;
  }
}
