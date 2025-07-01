
import 'package:college_app/club_provider.dart';
import 'package:college_app/login_page.dart';


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
   
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ClubProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'College App',
        theme: ThemeData.dark(useMaterial3: true).copyWith(
          textTheme: ThemeData.dark(useMaterial3: true).textTheme.copyWith(
            titleLarge: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontFamily: 'Lato',
            ),
            titleMedium: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              
            ),
            bodyMedium: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.normal,
              color: Colors.white,
              
            ),
            bodySmall: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w300,
              color: Colors.white,
              
            )
          ),
        ),
      
        home: const LoginPage(),
      ),
    );
  }
}

