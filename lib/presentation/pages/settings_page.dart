import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/strings/app_strings.dart';
import '../../core/style/app_styles.dart';
import '../state/settings_state.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppString.settings),
      ),
      body: Padding(
        padding: AppStyles.mainPaddingHorizontal,
        child: Consumer<SettingsState>(
          builder: (BuildContext context, settings, _) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 8),
                const Text(
                  AppString.theme,
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 8),
                CupertinoSlidingSegmentedControl(
                  groupValue: settings.getThemeIndex,
                  children: const <int, Widget>{
                    1: Text(AppString.light),
                    2: Text(AppString.dark),
                    3: Text(AppString.adaptive),
                  },
                  onValueChanged: (int? themeIndex) {
                    settings.setThemeIndex = themeIndex!;
                  },
                ),
                const SizedBox(height: 8),
                const Text(
                  AppString.textSize,
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 8),
                CupertinoSlidingSegmentedControl(
                  groupValue: settings.getTextSize,
                  children: const <int, Widget>{
                    0: Text(AppString.normal),
                    1: Text(AppString.medium),
                    2: Text(AppString.large),
                  },
                  onValueChanged: (int? themeIndex) {
                    settings.setTextSize = themeIndex!;
                  },
                ),
                const SizedBox(height: 8),
                const Text(
                  AppString.display,
                  style: TextStyle(fontSize: 20),
                ),
                SwitchListTile(
                  title: const Text(AppString.alwaysOn),
                  value: settings.getAlwaysOn,
                  onChanged: (bool onChanged) {
                    settings.setAlwaysOn = onChanged;
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
