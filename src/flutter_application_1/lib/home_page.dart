import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'settings_page.dart'; // Importa la página de configuración

// Pantalla de creación de proyectos (simulada)
class CreateProjectPage extends StatelessWidget {
  const CreateProjectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Project'),
      ),
      body: const Center(
        child: Text(
          'New Project Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

// Pantalla principal
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

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
              style: TextStyle(fontSize: 50, color: Color.fromARGB(206, 59, 193, 255)),
            ),
            const SizedBox(height: 20),
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

// Punto de entrada de la aplicación
void main() {
  runApp(const MyApp());
}

// Clase principal de la aplicación
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OpenDike Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 58, 175, 196)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'OpenDike Demo🌊'),
    );
  }
}
