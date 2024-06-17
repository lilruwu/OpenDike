import 'package:flutter/material.dart';

class CreateProjectPage extends StatefulWidget {
  const CreateProjectPage({super.key});

  @override
  _CreateProjectPageState createState() => _CreateProjectPageState();
}

class _CreateProjectPageState extends State<CreateProjectPage> {
  String _selectedOption = 'Hypothesis 1'; // Variable para almacenar la opción seleccionada
  final TextEditingController _projectNameController = TextEditingController(); // Controlador para el campo de texto

  // Mapa que define los campos y el formulario para cada hipótesis
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _projectNameController,
          decoration: const InputDecoration(
            hintText: 'New Project',
            border: InputBorder.none, // Oculta el borde del TextField
          ),
          style: const TextStyle(fontSize: 20),
          onChanged: (value) {
            setState(() {}); // Actualiza el estado para reflejar el cambio en el título
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
                const SizedBox(height: 10), // Espacio entre el texto y el campo de texto
                // Menú desplegable con opciones
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
                const SizedBox(height: 20), // Espacio entre el texto y el nombre del proyecto
                Text(
                  'Project Name: ${_projectNameController.text}',
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 20), // Espacio adicional entre los elementos
                // Mostrar el formulario correspondiente a la hipótesis seleccionada
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

// Ejemplo de formulario para Hypothesis 1 (puedes definir los otros de manera similar)
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
        // Aquí puedes agregar los campos específicos para la hipótesis 1
        TextFormField(
          decoration: const InputDecoration(labelText: 'Field 1'),
        ),
        TextFormField(
          decoration: const InputDecoration(labelText: 'Field 2'),
        ),
        // Puedes agregar más campos según sea necesario
      ],
    );
  }
}

