import 'package:college_app/club_provider.dart';
import 'package:college_app/login_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    final joinedClubs = Provider.of<ClubProvider>(context).joinedClubs;
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Profile'),
      ),
      body: Column(
        children: [
          CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage(
                'assets/images/profile_logo.png',
              ),
            ),
            const SizedBox(height: 12,),
            Text('USername', style: Theme.of(context).textTheme.titleMedium,),
            
            Text(
              'Username_ug_24@branch.nits.ac.in',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 20,),
            Align(
              alignment: Alignment.center,
              child: Text('Joined Clubs', style: Theme.of(context).textTheme.titleMedium),
            ),
            const SizedBox(height: 10,),
            if(joinedClubs.isEmpty) Text("No clubs joined")
            else
            Wrap(
                spacing: 10,
                runSpacing: 10,
                children: joinedClubs.map((club) {
                  return Chip(
                    label: Text(club['name'] ?? 'Unnamed Club'),
                    avatar: club['logo'] != null
                        ? CircleAvatar(
                            backgroundImage: AssetImage(club['logo'] as String),
                          )
                        : null,
                  );
                }).toList(),
              ),
              const Spacer(),
              ElevatedButton.icon(onPressed: (){
                  setState(() {
                    isPressed = true;
                  });
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginPage(),
                  ),
                  );
              },
               icon: const Icon(Icons.logout),
              label: const Text('Logout'),
               style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                foregroundColor: Colors.white,
              ),
              )
        ],
      ),
    );
  }
}