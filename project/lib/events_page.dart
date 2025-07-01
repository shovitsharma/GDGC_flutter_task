import 'package:college_app/data.dart' show events;
import 'package:flutter/material.dart';



class EventsPage extends StatelessWidget {
  

  const EventsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notice Board'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: events.length,
          itemBuilder: (context,index){
            final notice = events[index];
            return Card(
              child: ListTile(
              title: Text(notice['title']!, style: Theme.of(context).textTheme.titleMedium),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  Text(notice['content']!),
                  const SizedBox(height: 8,),
                  Text('Dated : ${notice['date']}',
                  style: TextStyle(color: Colors.grey[600], fontSize: 12),
                  ),
                ],
              ),
              ),
              
            );
            
          }),
      ),
    );
  }
 
}