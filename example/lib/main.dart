import 'package:flutter/material.dart';
import 'package:retcore_datetime/retcore_datetime.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RetCore DateTime Example',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        useMaterial3: true,
      ),
      home: const ExamplePage(),
    );
  }
}

class ExamplePage extends StatefulWidget {
  const ExamplePage({super.key});

  @override
  State<ExamplePage> createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {
  final _controller = TextEditingController(text: 'নভেম্বর ০৭ ২০২৪');
  var _result;

  void _convertDate() {
    final result = RetCoreDateConverter.convert(
      dateString: _controller.text,
      toFormat: RetCoreDateFormat.ddMMMyyyySpace,
    );

    setState(() {
      _result = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RetCore DateTime Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Enter Date',
                border: OutlineInputBorder(),
                hintText: 'Try: নভেম্বর ০৭ ২০২৪ or 07/11/2024',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _convertDate,
              child: const Text('Convert Date'),
            ),
            const SizedBox(height: 30),
            if (_result != null) ...[
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: _result!.success
                      ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '✅ Success!',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                      const SizedBox(height: 16),
                      _buildResultRow('English', _result!.formattedDateEnglish!),
                      _buildResultRow('Bengali', _result!.formattedDateBengali!),
                      _buildResultRow('Format', _result!.detectedFormat!),
                    ],
                  )
                      : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '❌ Failed',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(_result!.error!),
                    ],
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {

        },
        icon: const Icon(Icons.play_arrow),
        label: const Text('Run Tests'),
      ),
    );
  }

  Widget _buildResultRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          SizedBox(
            width: 80,
            child: Text(
              '$label:',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Text(value),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
