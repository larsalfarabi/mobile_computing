import 'package:flutter/material.dart';

class BelajarState extends StatefulWidget {
  const BelajarState({super.key});

  @override
  State<BelajarState> createState() => _BelajarStateState();
}

class _BelajarStateState extends State<BelajarState> {
  final List<Map<String, String>> transactions = [
    {'name': 'Tokopedia', 'amount': '-Rp 150.000'},
    {'name': 'Shoppee', 'amount': '+Rp 200.000'},
    {'name': 'Indomaret', 'amount': '-Rp 50.000'},
  ];

  final TextEditingController _controller = TextEditingController();

  String labelInput = '';

  List<String> listItems = [];

  void _onSubmit() {
    setState(() {
      labelInput = _controller.text;
      listItems.add(_controller.text);
      _controller.clear();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BCA Mobile"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: "Masukkan Input...",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _onSubmit,
              child: const Text('Submit'),
            ),
            Text('Result : $labelInput', style: const TextStyle(fontSize: 24)),
            const SizedBox(height: 24),
            Expanded(
              child: ListView.builder(
                itemCount: listItems.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: const Icon(Icons.list),
                      title: Text(listItems[index]),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
