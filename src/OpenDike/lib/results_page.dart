import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';

class ResultsPage extends StatefulWidget {
  final String projectName;
  final Map<String, String> hypothesisData;

  const ResultsPage({
    Key? key,
    required this.projectName,
    required this.hypothesisData,
  }) : super(key: key);

  @override
  _ResultsPageState createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late PageController _pageController;
  late TextEditingController _projectNameController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _pageController = PageController();
    _projectNameController = TextEditingController(text: widget.projectName);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _pageController.dispose();
    _projectNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _projectNameController,
          style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 20),
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: 'Edit project name',
            hintStyle: TextStyle(color: Colors.white70),
          ),
          onSubmitted: (value) {
            // Here you can update the project name in your data structure
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Project name updated to: $value')),
            );
          },
        ),
        centerTitle: true,
      ),
      body: Row(
        children: [
          // Left column
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Hypothesis Data',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  ...widget.hypothesisData.entries.map((entry) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: TextFormField(
                      initialValue: entry.value,
                      decoration: InputDecoration(labelText: entry.key),
                      onChanged: (value) {
                        // Update the value in hypothesisData
                        widget.hypothesisData[entry.key] = value;
                      },
                    ),
                  )).toList(),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {
                      // Implement recalculation logic here
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Recalculating...')),
                      );
                    },
                    child: const Text('Recalculate'),
                  ),
                  const SizedBox(height: 50),
                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 220, 250, 255),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: [
                        TabBar(
                          controller: _tabController,
                          onTap: (index) {
                            _pageController.animateToPage(
                              index,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          },
                          tabs: const [
                            Tab(text: 'Equations'),
                            Tab(text: 'Features'),
                          ],
                        ),
                        SizedBox(
                          height: 200,
                          child: PageView(
                            controller: _pageController,
                            onPageChanged: (index) {
                              _tabController.animateTo(index);
                            },
                            children: [
                              Center(
                                child: Math.tex(
                                  r'V = I \times R',
                                  textStyle: const TextStyle(fontSize: 24),
                                ),
                              ),
                              const Center(
                                child: Text(
                                  'Example Text :D',
                                  style: TextStyle(fontSize: 24),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Right column
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Dike Simulation',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: Center(
                      child: Image.asset(
                        'assets/test.png',
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) {
                          return const Text(
                            'Image not found',
                            style: TextStyle(fontSize: 16, color: Colors.red),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}