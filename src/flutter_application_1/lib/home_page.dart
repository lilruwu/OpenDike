import 'package:flutter/material.dart';
import 'create_project_page.dart';
import 'settings_page.dart'; // Importamos la página de ajustes desde el archivo correspondiente
import 'package:file_picker/file_picker.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void create_project() {
    print("Create project");
    Navigator.push(context, MaterialPageRoute(builder: (context) => const CreateProjectPage()));
  }

  void open_project() async {
    print("Open project");
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      // Use the file
      print("File path: ${result.files.single.path}");
    } else {
      // User canceled the picker
      print("No file selected");
    }
  }

  void go_settings() {
    print("Go settings");
    Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingsPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Welcome to OpenDike!🌊',
              // style: const TextStyle(fontSize: 50),
              style: TextStyle(fontSize: 50, color: Color.fromARGB(206, 59, 193, 255)), // Change the color to blue
            ),
            const SizedBox(height: 20), // Adding some space between the text and the buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 200,
                  height: 200,
                  margin: const EdgeInsets.all(10),
                  child: ElevatedButton.icon(
                    onPressed: create_project,
                    icon: const Icon(Icons.add, size: 50),
                    label: const Text('New Project', textAlign: TextAlign.center),
                    style: ElevatedButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20),
                      padding: const EdgeInsets.all(10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 200,
                  height: 200,
                  margin: const EdgeInsets.all(10),
                  child: ElevatedButton.icon(
                    onPressed: open_project,
                    icon: const Icon(Icons.folder_open, size: 50),
                    label: const Text('Open Project', textAlign: TextAlign.center),
                    style: ElevatedButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20),
                      padding: const EdgeInsets.all(10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 200,
                  height: 200,
                  margin: const EdgeInsets.all(10),
                  child: ElevatedButton.icon(
                    onPressed: go_settings,
                    icon: const Icon(Icons.settings, size: 50),
                    label: const Text('Settings', textAlign: TextAlign.center),
                    style: ElevatedButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20),
                      padding: const EdgeInsets.all(10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
