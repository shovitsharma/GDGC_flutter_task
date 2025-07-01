import 'package:college_app/club_provider.dart';
import 'package:college_app/subject_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatsPage extends StatelessWidget {
  ChatsPage({super.key});

  final List<String> subjects = [
    'Mathematics MA-101',
    'Physics PH-101',
    'Electrical EE-101',
    'Computer Science CS-101',
    'Electronics EC-101',
  ];

  @override
  Widget build(BuildContext context) {
    final joinedClubs = Provider.of<ClubProvider>(context).joinedClubs;

    
    final allChats = [
      ...subjects.map((s) => {'name': s, 'isClub': false}),
      ...joinedClubs.map((c) => {'name': c['name'], 'logo': c['logo'], 'isClub': true}),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Class Groups & Clubs'),
      ),
      body: ListView.builder(
        itemCount: allChats.length,
        itemBuilder: (context, index) {
          final chat = allChats[index];
          final isClub = chat['isClub'] as bool;

          return Card(
            margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
            elevation: 3,
            child: ListTile(
              leading: isClub
                  ? CircleAvatar(
                      backgroundImage: AssetImage(chat['logo'] as String),
                      backgroundColor: Colors.grey[300],
                    )
                  : const Icon(Icons.book),
              title: Text(chat['name'] as String),
              trailing: const Icon(Icons.chat),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        SubjectPage(subject: chat['name'] as String),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
