import 'package:flutter/material.dart';
import 'results_page.dart';

class CreateProjectPage extends StatefulWidget {
  const CreateProjectPage({Key? key}) : super(key: key);

  @override
  _CreateProjectPageState createState() => _CreateProjectPageState();
}

class _CreateProjectPageState extends State<CreateProjectPage> {
  String _selectedOption = 'Hypothesis 1';
  final TextEditingController _projectNameController = TextEditingController();
  String _savedProjectName = '';

  final GlobalKey<_Hypothesis1FormState> _formKey = GlobalKey<_Hypothesis1FormState>();

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

  void _navigateToResultsPage() {
    if (_savedProjectName.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a project name')),
      );
      return;
    }

    // Access the form data through the GlobalKey
    final formData = _formKey.currentState?.getData() ?? {};

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultsPage(
          projectName: _savedProjectName,
          hypothesisData: formData,
        ),
      ),
    );
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
            _saveProjectName();
          },
        ),
      ),
      body: Padding(
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
              items: ['Hypothesis 1'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Hypothesis1Form(key: _formKey),
            ),
            ElevatedButton(
              onPressed: _navigateToResultsPage,
              child: const Text('Calculate'),
            ),
          ],
        ),
      ),
    );
  }
}

class Hypothesis1Form extends StatefulWidget {
  const Hypothesis1Form({Key? key}) : super(key: key);

  @override
  _Hypothesis1FormState createState() => _Hypothesis1FormState();
}

class _Hypothesis1FormState extends State<Hypothesis1Form> {
  final TextEditingController _field1Controller = TextEditingController();
  final TextEditingController _field2Controller = TextEditingController();

  @override
  void dispose() {
    _field1Controller.dispose();
    _field2Controller.dispose();
    super.dispose();
  }

  Map<String, String> getData() {
    return {
      'Field 1': _field1Controller.text,
      'Field 2': _field2Controller.text,
    };
  }

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
          controller: _field1Controller,
          decoration: const InputDecoration(labelText: 'Field 1'),
        ),
        TextFormField(
          controller: _field2Controller,
          decoration: const InputDecoration(labelText: 'Field 2'),
        ),
      ],
    );
  }
}