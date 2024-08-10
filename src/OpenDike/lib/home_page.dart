import 'package:flutter/material.dart';
import 'create_project_page.dart';
import 'settings_page.dart';
import 'package:file_picker/file_picker.dart';

class MyHomePage extends StatelessWidget {
  final String title;
  final Function(bool) toggleDarkMode;
  final bool isDarkMode;

  const MyHomePage({
    Key? key,
    required this.title,
    required this.toggleDarkMode,
    required this.isDarkMode,
  }) : super(key: key);

  void create_project(BuildContext context) {
    print("Create project");
    Navigator.push(context, MaterialPageRoute(builder: (context) => const CreateProjectPage()));
  }

  void open_project() async {
    print("Open project");
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      print("File path: ${result.files.single.path}");
    } else {
      print("No file selected");
    }
  }

  void go_settings(BuildContext context) {
    print("Go settings");
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SettingsPage(
          isDarkMode: isDarkMode,
          toggleDarkMode: toggleDarkMode,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome to OpenDike!🌊',
              style: TextStyle(
                fontSize: 50,
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.white
                    : Color.fromARGB(206, 59, 193, 255),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildButton(context, 'New Project', Icons.add, () => create_project(context)),
                _buildButton(context, 'Open Project', Icons.folder_open, open_project),
                _buildButton(context, 'Settings', Icons.settings, () => go_settings(context)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context, String label, IconData icon, VoidCallback onPressed) {
    return Container(
      width: 200,
      height: 200,
      margin: const EdgeInsets.all(10),
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon, size: 50),
        label: Text(label, textAlign: TextAlign.center),
        style: ElevatedButton.styleFrom(
          textStyle: const TextStyle(fontSize: 20),
          padding: const EdgeInsets.all(10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}