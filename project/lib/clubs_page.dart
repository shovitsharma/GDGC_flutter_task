import 'package:college_app/club_provider.dart';
import 'package:college_app/data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ClubsPage extends StatelessWidget {
  const ClubsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Clubs Info', style: Theme.of(context).textTheme.titleLarge,),

      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: clubs.length,
          itemBuilder: (context, index){
            final club = clubs[index];
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 8),
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                title: Text(club['name']!, style: Theme.of(context).textTheme.titleMedium,),
                subtitle: Text(club['description'] as String,
                style: Theme.of(context).textTheme.bodySmall,),
                trailing: ElevatedButton(
                onPressed: () {
                  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Join Club", style: Theme.of(context).textTheme.titleMedium),
          content: const Text('Are you sure you want to Join?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('No', style: TextStyle(color: Colors.blue)),
            ),
            TextButton(
              onPressed: () {
                Provider.of<ClubProvider>(context, listen: false).addClub(club);
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('You joined ${club['name']}!')),
                );
              },
              child: const Text('Yes', style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  },
  child: const Text('Know More'),
),

              ),
            );
        }),
      ),
    );
  }
  
}