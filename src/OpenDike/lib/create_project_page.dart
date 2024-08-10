import 'package:flutter/material.dart';

class CreateProjectPage extends StatefulWidget {
  const CreateProjectPage({super.key});

  @override
  _CreateProjectPageState createState() => _CreateProjectPageState();
}

class _CreateProjectPageState extends State<CreateProjectPage> {
  String _selectedOption = 'Hypothesis 1';
  final TextEditingController _projectNameController = TextEditingController();
  String _savedProjectName = ''; // New variable to store the saved project name

  final Map<String, Widget> _hypothesisForms = {
    'Hypothesis 1': const Hypothesis1Form(),
    // 'Hypothesis 2': Hypothesis2Form(),
    // 'Hypothesis 3': Hypothesis3Form(),
    // 'Hypothesis 4': Hypothesis4Form(),
    // 'Hypothesis 5': Hypothesis5Form(),
  };

  @override
  void dispose() {
    _projectNameController.dispose();
    super.dispose();
  }

  void _saveProjectName() {
    setState(() {
      _savedProjectName = _projectNameController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _projectNameController,
          decoration: const InputDecoration(
            hintText: 'New Project',
            border: InputBorder.none,
          ),
          style: const TextStyle(fontSize: 20),
          onSubmitted: (value) {
            _saveProjectName(); // Save the project name when Enter is pressed
          },
        ),
      ),
      body: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  'Select an option:',
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 10),
                DropdownButton<String>(
                  value: _selectedOption,
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedOption = newValue!;
                    });
                  },
                  items: _hypothesisForms.keys.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Selected option:',
                  style: TextStyle(fontSize: 24),
                ),
                Text(
                  _selectedOption,
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                Text(
                  'Project Name: $_savedProjectName', // Display the saved project name
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: _hypothesisForms[_selectedOption] ?? const SizedBox(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Hypothesis1Form extends StatelessWidget {
  const Hypothesis1Form({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Hypothesis 1 Form',
          style: TextStyle(fontSize: 20),
        ),
        TextFormField(
          decoration: const InputDecoration(labelText: 'Field 1'),
        ),
        TextFormField(
          decoration: const InputDecoration(labelText: 'Field 2'),
        ),
      ],
    );
  }
}