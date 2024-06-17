import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _isDarkModeEnabled = false;
  String _selectedLanguage = 'English'; // Valor inicial del idioma seleccionado

  void _toggleDarkMode(bool isEnabled) {
    setState(() {
      _isDarkModeEnabled = isEnabled;
    });
    // Aquí podrías aplicar cambios de tema o guardar la preferencia en Shared Preferences
  }

  void _changeLanguage(String language) {
    setState(() {
      _selectedLanguage = language;
    });
    // Aquí podrías aplicar cambios de idioma o guardar la preferencia en Shared Preferences
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Theme Settings',
              style: Theme.of(context).textTheme.headlineMedium,
 // Change 'headline6' to 'headline4'
            ),
            SwitchListTile(
              title: Text('Dark Mode'),
              value: _isDarkModeEnabled,
              onChanged: _toggleDarkMode,
            ),
            SizedBox(height: 20),
            // Text(
            //   'Language Settings',
            //   style: Theme.of(context).textTheme.titleLarge,
            // ),
            // DropdownButton<String>(
            //   value: _selectedLanguage,
            //   onChanged: (String? value) => _changeLanguage(value!),
            //   items: <String>['English', 'Spanish', 'French', 'German']
            //       .map<DropdownMenuItem<String>>((String value) {
            //     return DropdownMenuItem<String>(
            //       value: value,
            //       child: Text(value),
            //     );
            //   }).toList(),
            // ),
          ],
        ),
      ),
    );
  }
}
