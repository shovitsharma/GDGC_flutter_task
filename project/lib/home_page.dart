import 'package:college_app/data.dart';
import 'package:college_app/home_cards.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HomeCards(), 
            const SizedBox(height: 20),
            Text('To Do List', style: Theme.of(context).textTheme.titleMedium,),
            const SizedBox(height: 10,),
            ...toDoItems.map((item)=> ListTile(
              leading: Icon(Icons.check_circle_outline),
              title: Text(item),
              trailing: Icon(Icons.more_vert),
            )),
            const SizedBox(height: 20,),
            Text('Class Chats Preview', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 10),
            ...chatPreviews.map((chat)=>Card(
              child: ListTile(
                leading: Icon(Icons.chat_bubble_outline),
                title: Text(chat['subject']!),
                subtitle: Text(chat['lastMsg']!),
                trailing: Icon(Icons.more_vert),
              ),
            )),
            const SizedBox(height: 20,),
             Text('Today\'s Timetable', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 10,),
            ...timetable.map((slot)=> ListTile(
              leading: Icon(Icons.access_time),
              title: Text(slot['subject']!),
              subtitle: Text(slot['time']!),
            )),
            Text('Today\'s Mess Menu', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 10),
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(messMenu, style: Theme.of(context).textTheme.bodyMedium),
              ),
            ),
            const SizedBox(height: 20,),
          ],
        ),
      ),  
    );  }
}