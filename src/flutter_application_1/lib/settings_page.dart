import 'package:flutter/material.dart';

// Pantalla de configuración
class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _isDarkModeEnabled = false;
  String _selectedLanguage = 'Español'; // Idioma inicial

  void _toggleDarkMode(bool value) {
    setState(() {
      _isDarkModeEnabled = value;
      // Aquí puedes implementar el cambio de tema globalmente
      // por ejemplo, usando el paquete provider o shared preferences.
    });
  }

  void _changeLanguage(String language) {
    setState(() {
      _selectedLanguage = language;
      // Implementación básica para cambiar el idioma globalmente
      // Puedes usar algún paquete de internacionalización como flutter_i18n o intl
      // Aquí simularemos el cambio de idioma con un simple mensaje de consola
      if (language == 'Español') {
        print('Cambiando a Español');
        // Aquí podrías implementar la lógica para cambiar el idioma de toda la app
      } else if (language == 'Gallego') {
        print('Cambiando a Gallego');
        // Aquí podrías implementar la lógica para cambiar el idioma de toda la app
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              child: const Text(
                'Configuración',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              title: const Text('Modo Oscuro'),
              trailing: Switch(
                value: _isDarkModeEnabled,
                onChanged: _toggleDarkMode,
              ),
            ),
            ListTile(
              title: const Text('Idioma'),
              trailing: DropdownButton<String>(
                value: _selectedLanguage,
                onChanged: (String? value) => _changeLanguage(value!),
                items: <String>['Español', 'Gallego']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Configuración de la aplicación',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            // Aquí puedes agregar elementos adicionales de configuración si es necesario
          ],
        ),
      ),
    );
  }
}
