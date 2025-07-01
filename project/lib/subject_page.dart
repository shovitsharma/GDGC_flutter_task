import 'package:flutter/material.dart';

class SubjectPage extends StatelessWidget {
  final String subject;
  const SubjectPage({super.key, required this.subject});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(subject),
      ),
      body: Column(
        children: [
          
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: const [
                
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("No Class Tomorrow"),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(""),
                ),
              ],
            ),
          ),

          
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(
                      hintText: 'Type a message',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
